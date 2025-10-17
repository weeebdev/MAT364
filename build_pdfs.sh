#!/usr/bin/env bash

# Generic Slidev PDF Builder
# This script automatically finds and builds all .md files to PDF format

# set -euo pipefail

# ANSI colos
readonly NC="\033[0m"
readonly RED="\033[31m"
readonly GREEN="\033[32m"
readonly YELLOW="\033[33m"
readonly BLUE="\033[34m"
readonly CYAN="\033[36m"
readonly BOLD="\033[1m"

# Log funcs
info()    { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[✓]${NC} $1"; }
warn()    { echo -e "${YELLOW}[!]${NC} $1"; }
error()   { echo -e "${RED}[✗]${NC} $1" >&2; }
banner()  { echo -e "${CYAN}${BOLD}$1${NC}"; }

banner "📄 Generic Slidev PDF Builder"
banner "============================="

# Create output directory
OUTPUT_DIR="pdf-exports"
mkdir -p "$OUTPUT_DIR"

check_os() {
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        echo "$ID"
    else
        warn "/etc/os-release doesn't exist"
    fi
}

# Check if Slidev is installed
check_pacs_or_install() {
    local shell=$(basename "$SHELL")
    local rc_file
    case "$shell" in
        bash) rc_file="$HOME/.bashrc" ;;
        zsh) rc_file="$HOME/.zshrc" ;;
        fish) rc_file="$HOME/.config/fish/config.fish" ;;
        *) rc_file="$HOME/.profile" ;;
    esac

    if ! command -v npm &> /dev/null; then
        warn "❌ npm is not installed. Installing Node.js and npm..."
        case "$ID" in
            arch)
                sudo pacman -Sy --noconfirm nodejs npm ;;
            ubuntu|kali|debian)
                sudo apt update && sudo apt install -y nodejs npm ;;
            fedora)
                sudo yum install -y nodejs npm ;;
            *)
                error "Could not determine OS"
                error "❌ Unsupported package manager. Please install Node.js and npm manually."
                exit 1 ;;
        esac

        mkdir -p ~/.npm-global
        npm config set prefix '~/.npm-global'
        if ! grep -q 'NPM global path' "$rc_file" 2>/dev/null; then
            {
                echo ''
                echo '# NPM global path start'
                echo 'export PATH=$PATH:~/.npm-global/bin'
                echo '# NPM global path end'
            } >> $rc_file
        fi
        if [ -f "$rc_file" ]; then
            source "$rc_file"
        fi

        success "✅ npm installed and configured globally ($rc_file)"
    fi

    if ! command -v slidev &> /dev/null; then
        warn "❌ Slidev is not installed. Installing..."
        npm install -g @slidev/cli
        npm i -D playwright-chromium
        success "✅ Slidev installed successfully"
    fi
}

# Automatically find all .md files in current directory

# Function to build a single presentation
build_presentation() {
    local file=$1
    local basename=$(basename "$file" .md)
    local output="$OUTPUT_DIR/$basename.pdf"

    echo ""
    info "📄 Building $file..."

    if [ ! -f "$file" ]; then
        warn "⚠️  Warning: $file not found, skipping..."
        return 1
    fi

    # Check if file is a Slidev presentation (contains frontmatter)
    if ! head -n 10 "$file" | grep -q "^---$"; then
        warn "⚠️  Warning: $file doesn't appear to be a Slidev presentation (no frontmatter), skipping..."
        return 1
    fi

    # Skip if PDF already exists and is up-to-date (unless forced)
    if [ -f "$output" ] && [ "$FORCE" != true ]; then
        if [ "$output" -nt "$file" ]; then
            info "⏭️  Skipping $file (up-to-date PDF already exists)"
            return 0
        fi
    fi

    # Build PDF with Slidev using export command
    slidev export "$file" --format pdf --output "$output"

    # Check if PDF was created successfully
    if [ -f "$output" ]; then
        success "✅ PDF file created: $basename.pdf"
    else
        error "❌ Failed to create PDF: $basename.pdf"
        return 1
    fi

    if [ $? -eq 0 ]; then
        success "✅ Successfully built: $basename.pdf"
    else
        error "❌ Failed to build: $file"
        return 1
    fi
}

# Function to build all presentations
build_all() {
    info "🚀 Starting PDF build process..."
    info "Output directory: $OUTPUT_DIR"
    echo ""

    info "Searching for MD files"
    PRESENTATIONS=($(find . -maxdepth 1 -name "*.md" -type f | sort))
    local success_count=0
    local total_count=${#PRESENTATIONS[@]}

    for presentation in "${PRESENTATIONS[@]}";
    do
        if build_presentation "$presentation"; then
            ((success_count++))
        fi
    done

    echo ""
    banner "📊 Build Summary:"
    banner "================="
    success "✅ Successfully built: $success_count/$total_count presentations"
    info "📁 Output directory: $OUTPUT_DIR/"

    if [ $success_count -eq $total_count ]; then
        success "🎉 All presentations built successfully!"
    else
        warn "⚠️  Some presentations failed to build. Check the output above."
        exit 1
    fi
}

# Function to create a combined PDF (optional)
create_combined_pdf() {
    echo ""
    echo "📚 Creating combined PDF..."

    if command -v pdftk &> /dev/null; then
        # Use pdftk to combine PDFs
        pdftk "$OUTPUT_DIR"/*.pdf cat output "$OUTPUT_DIR/Combined-Presentations.pdf"
        success "✅ Combined PDF created: Combined-Presentations.pdf"
    elif command -v gs &> /dev/null; then
        # Use Ghostscript to combine PDFs
        gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="$OUTPUT_DIR/Combined-Presentations.pdf" "$OUTPUT_DIR"/*.pdf
        success "✅ Combined PDF created: Combined-Presentations.pdf"
    else
        warn "⚠️  Neither pdftk nor Ghostscript found. Skipping combined PDF creation."
        warn "⚠️  Install pdftk or Ghostscript to create a combined PDF."
    fi
}

# Function to create an index file
create_index() {
    echo ""
    info "📋 Creating index file..."

    cat > "$OUTPUT_DIR/README.md" << EOF
# Slidev PDF Exports

This directory contains PDF exports of all Slidev presentations found in the current directory.

## Available Presentations

EOF

    for presentation in "${PRESENTATIONS[@]}"; do
        local basename=$(basename "$presentation" .md)
        if [ -f "$OUTPUT_DIR/$basename.pdf" ]; then
            info "- **$basename.pdf** - $(echo $basename | sed 's/-/ /g' | sed 's/\b\w/\U&/g')" >> "$OUTPUT_DIR/README.md"
        fi
    done

    cat >> "$OUTPUT_DIR/README.md" << EOF

## Build Information

- **Build Date:** $(date)
- **Slidev Version:** $(slidev --version 2>/dev/null || echo "Unknown")
- **Total Files:** $(ls -1 "$OUTPUT_DIR"/*.pdf 2>/dev/null | wc -l)

## Usage

1. Open any PDF file to view the presentation
2. Use the combined PDF for a complete course overview
3. All presentations are optimized for both screen and print viewing

## Notes

- PDFs are generated with high quality settings
- All animations are converted to static slides
- Code blocks are syntax highlighted
- Mathematical formulas are properly rendered

---
*Generated by build-pdfs.sh script*
EOF

    success "✅ Index file created: README.md"
}

# Function to show help
show_help() {
    banner "Usage: $0 [OPTIONS]"
    banner ""
    banner "Options:"
    banner "  -h, --help     Show this help message"
    banner "  -a, --all      Build all presentations (default)"
    banner "  -c, --combine  Also create a combined PDF"
    banner "  -i, --index    Also create an index file"
    banner "  -f, --file     Build specific file (e.g., -f presentation.md)"
    banner "      --force    Rebuild even if output PDF is up-to-date"
    banner ""
    banner "Examples:"
    banner "  $0                    # Build all .md files in current directory"
    banner "  $0 -c -i             # Build all + combine + index"
    banner "  $0 -f presentation.md # Build only specific file"
}

# Parse command line arguments
COMBINE=false
INDEX=false
SPECIFIC_FILE=""
FORCE=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -a|--all)
            # Default behavior
            shift
            ;;
        -c|--combine)
            COMBINE=true
            shift
            ;;
        -i|--index)
            INDEX=true
            shift
            ;;
        -f|--file)
            SPECIFIC_FILE="$2"
            shift 2
            ;;
        --force)
            FORCE=true
            shift
            ;;
        *)
            warn "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Main execution
main() {
    ID=$(check_os)
    check_pacs_or_install
    if [ -n "$SPECIFIC_FILE" ]; then
        info "🎯 Building specific file: $SPECIFIC_FILE"
        build_presentation "$SPECIFIC_FILE"
    else
        build_all
    fi

    # Optional operations
    if [ "$COMBINE" = true ]; then
        create_combined_pdf
    fi

    if [ "$INDEX" = true ]; then
        create_index
    fi

    echo ""
    success "🎉 Build process completed!"
    success "📁 Check the '$OUTPUT_DIR' directory for your PDF files."
}

main "$@"
