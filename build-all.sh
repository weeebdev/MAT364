#!/bin/bash

# MAT364 Cryptography Course - Build All Presentations
# This script builds all Slidev presentations for GitHub Pages deployment

set -e

# Create output directory
rm -rf docs
mkdir -p docs

# Define presentations to build
PRESENTATIONS=(
  "syllabus.md:syllabus:Syllabus"
  "lecture1.md:lecture1:Lecture 1 - Introduction"
  "lecture2.md:lecture2:Lecture 2 - Classical Ciphers"
  "lecture3.md:lecture3:Lecture 3 - Cryptanalysis"
  "lecture4.md:lecture4:Lecture 4 - Stream Ciphers"
  "lecture5.md:lecture5:Lecture 5 - Block Ciphers"
  "lecture6.md:lecture6:Lecture 6 - Hash Functions"
  "lecture7.md:lecture7:Lecture 7 - RSA Deep Dive"
  "lecture8.md:lecture8:Lecture 8 - Key Exchange"
  "lecture9.md:lecture9:Lecture 9 - Digital Signatures"
  "lecture10.md:lecture10:Lecture 10 - Web Cryptography"
  "lecture11.md:lecture11:Lecture 11 - Mobile Cryptography"
  "lecture12.md:lecture12:Lecture 12 - Blockchain"
  "lecture13.md:lecture13:Lecture 13 - Quantum Cryptography"
  "final-exam-project.md:final-exam-project:Final Exam Project"
  "project-description.md:project-description:Project Description"
  "kasiski-method.md:kasiski-method:Kasiski Method"
  "quiz-lectures6-13.md:quiz-lectures6-13:Quiz Review (Lectures 6-13)"
)

# Build each presentation
for entry in "${PRESENTATIONS[@]}"; do
  IFS=':' read -r file folder name <<< "$entry"
  if [ -f "$file" ]; then
    echo "📦 Building: $name ($file -> docs/$folder)"
    bunx slidev build "$file" --base "/$folder/" --out "docs/$folder" 2>/dev/null || {
      echo "⚠️  Warning: Failed to build $file, trying without base..."
      bunx slidev build "$file" --out "docs/$folder" 2>/dev/null || {
        echo "❌ Error: Could not build $file"
      }
    }
  else
    echo "⏭️  Skipping: $file (not found)"
  fi
done

# Create index.html
echo "📝 Creating index page..."
cat > docs/index.html << 'HTMLEOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MAT364 - Cryptography Course | SDU</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
            min-height: 100vh;
            color: #e0e0e0;
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 3rem 2rem;
        }
        
        header {
            text-align: center;
            margin-bottom: 3rem;
            padding-bottom: 2rem;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        
        h1 {
            font-size: 3rem;
            font-weight: 700;
            background: linear-gradient(135deg, #00d9ff, #00ff88);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 0.5rem;
        }
        
        .subtitle {
            font-size: 1.25rem;
            color: #888;
            margin-bottom: 0.5rem;
        }
        
        .instructor {
            color: #666;
            font-size: 0.95rem;
        }
        
        .section {
            margin-bottom: 3rem;
        }
        
        .section-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #00d9ff;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .section-title::before {
            content: '';
            width: 4px;
            height: 24px;
            background: linear-gradient(180deg, #00d9ff, #00ff88);
            border-radius: 2px;
        }
        
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 1.25rem;
        }
        
        .card {
            background: rgba(255,255,255,0.03);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 12px;
            padding: 1.5rem;
            transition: all 0.3s ease;
            cursor: pointer;
            text-decoration: none;
            color: inherit;
            display: block;
        }
        
        .card:hover {
            background: rgba(255,255,255,0.06);
            border-color: rgba(0,217,255,0.3);
            transform: translateY(-4px);
            box-shadow: 0 12px 40px rgba(0,217,255,0.15);
        }
        
        .card-header {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 0.75rem;
        }
        
        .card-icon {
            width: 48px;
            height: 48px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            flex-shrink: 0;
        }
        
        .card-icon.lecture { background: linear-gradient(135deg, #667eea, #764ba2); }
        .card-icon.project { background: linear-gradient(135deg, #f093fb, #f5576c); }
        .card-icon.info { background: linear-gradient(135deg, #4facfe, #00f2fe); }
        .card-icon.quiz { background: linear-gradient(135deg, #fa709a, #fee140); }
        
        .card-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: #fff;
        }
        
        .card-week {
            font-size: 0.8rem;
            color: #00d9ff;
            font-weight: 500;
        }
        
        .card-description {
            color: #888;
            font-size: 0.9rem;
            line-height: 1.5;
        }
        
        .card-arrow {
            margin-top: 1rem;
            color: #00d9ff;
            font-size: 0.85rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .card:hover .card-arrow {
            gap: 0.75rem;
        }
        
        footer {
            text-align: center;
            padding-top: 3rem;
            border-top: 1px solid rgba(255,255,255,0.1);
            color: #666;
            font-size: 0.9rem;
        }
        
        footer a {
            color: #00d9ff;
            text-decoration: none;
        }
        
        footer a:hover {
            text-decoration: underline;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 2rem 1rem;
            }
            
            h1 {
                font-size: 2rem;
            }
            
            .grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>🔐 Cryptography</h1>
            <p class="subtitle">MAT364 - Fall 2025</p>
            <p class="instructor">Instructor: Adil Akhmetov | SDU University</p>
        </header>
        
        <section class="section">
            <h2 class="section-title">Course Information</h2>
            <div class="grid">
                <a href="syllabus/" class="card">
                    <div class="card-header">
                        <div class="card-icon info">📋</div>
                        <div>
                            <div class="card-title">Course Syllabus</div>
                        </div>
                    </div>
                    <p class="card-description">Course overview, objectives, assessment methods, and weekly plan.</p>
                    <div class="card-arrow">View presentation →</div>
                </a>
                
                <a href="final-exam-project/" class="card">
                    <div class="card-header">
                        <div class="card-icon project">🎯</div>
                        <div>
                            <div class="card-title">Final Exam Project</div>
                        </div>
                    </div>
                    <p class="card-description">CryptoVault Suite - comprehensive cryptographic security project (40 points).</p>
                    <div class="card-arrow">View requirements →</div>
                </a>
                
                <a href="project-description/" class="card">
                    <div class="card-header">
                        <div class="card-icon project">📝</div>
                        <div>
                            <div class="card-title">Project Description</div>
                        </div>
                    </div>
                    <p class="card-description">Alternative project options and detailed guidelines.</p>
                    <div class="card-arrow">View details →</div>
                </a>
            </div>
        </section>
        
        <section class="section">
            <h2 class="section-title">Lectures</h2>
            <div class="grid">
                <a href="lecture1/" class="card">
                    <div class="card-header">
                        <div class="card-icon lecture">📚</div>
                        <div>
                            <div class="card-week">Week 1</div>
                            <div class="card-title">Introduction to Cryptography</div>
                        </div>
                    </div>
                    <p class="card-description">Fundamentals, CIA triad, cryptographic primitives, symmetric vs asymmetric.</p>
                    <div class="card-arrow">View lecture →</div>
                </a>
                
                <a href="lecture2/" class="card">
                    <div class="card-header">
                        <div class="card-icon lecture">📚</div>
                        <div>
                            <div class="card-week">Week 2</div>
                            <div class="card-title">Classical Ciphers</div>
                        </div>
                    </div>
                    <p class="card-description">Caesar cipher, Vigenère cipher, substitution and transposition ciphers.</p>
                    <div class="card-arrow">View lecture →</div>
                </a>
                
                <a href="lecture3/" class="card">
                    <div class="card-header">
                        <div class="card-icon lecture">📚</div>
                        <div>
                            <div class="card-week">Week 3</div>
                            <div class="card-title">Cryptanalysis & Attacks</div>
                        </div>
                    </div>
                    <p class="card-description">Frequency analysis, brute force, known-plaintext attacks.</p>
                    <div class="card-arrow">View lecture →</div>
                </a>
                
                <a href="lecture4/" class="card">
                    <div class="card-header">
                        <div class="card-icon lecture">📚</div>
                        <div>
                            <div class="card-week">Week 4</div>
                            <div class="card-title">Stream Ciphers & OTP</div>
                        </div>
                    </div>
                    <p class="card-description">One-time pads, stream ciphers, RC4, ChaCha20.</p>
                    <div class="card-arrow">View lecture →</div>
                </a>
                
                <a href="lecture5/" class="card">
                    <div class="card-header">
                        <div class="card-icon lecture">📚</div>
                        <div>
                            <div class="card-week">Week 5</div>
                            <div class="card-title">Block Ciphers</div>
                        </div>
                    </div>
                    <p class="card-description">DES, AES, modes of operation (ECB, CBC, CTR, GCM).</p>
                    <div class="card-arrow">View lecture →</div>
                </a>
                
                <a href="lecture6/" class="card">
                    <div class="card-header">
                        <div class="card-icon lecture">📚</div>
                        <div>
                            <div class="card-week">Week 6</div>
                            <div class="card-title">Hash Functions</div>
                        </div>
                    </div>
                    <p class="card-description">SHA-256, HMAC, password hashing, data integrity.</p>
                    <div class="card-arrow">View lecture →</div>
                </a>
                
                <a href="lecture7/" class="card">
                    <div class="card-header">
                        <div class="card-icon lecture">📚</div>
                        <div>
                            <div class="card-week">Week 7</div>
                            <div class="card-title">RSA Deep Dive</div>
                        </div>
                    </div>
                    <p class="card-description">RSA algorithm, key generation, OAEP padding, attacks.</p>
                    <div class="card-arrow">View lecture →</div>
                </a>
                
                <a href="lecture8/" class="card">
                    <div class="card-header">
                        <div class="card-icon lecture">📚</div>
                        <div>
                            <div class="card-week">Week 8</div>
                            <div class="card-title">Key Exchange</div>
                        </div>
                    </div>
                    <p class="card-description">Diffie-Hellman, ECDH, authenticated key exchange.</p>
                    <div class="card-arrow">View lecture →</div>
                </a>
                
                <a href="lecture9/" class="card">
                    <div class="card-header">
                        <div class="card-icon lecture">📚</div>
                        <div>
                            <div class="card-week">Week 9</div>
                            <div class="card-title">Digital Signatures</div>
                        </div>
                    </div>
                    <p class="card-description">RSA-PSS, ECDSA, Ed25519, PKI, JWT.</p>
                    <div class="card-arrow">View lecture →</div>
                </a>
                
                <a href="lecture10/" class="card">
                    <div class="card-header">
                        <div class="card-icon lecture">📚</div>
                        <div>
                            <div class="card-week">Week 10</div>
                            <div class="card-title">Web Cryptography</div>
                        </div>
                    </div>
                    <p class="card-description">TLS/HTTPS, Web Crypto API, secure cookies, CORS.</p>
                    <div class="card-arrow">View lecture →</div>
                </a>
                
                <a href="lecture11/" class="card">
                    <div class="card-header">
                        <div class="card-icon lecture">📚</div>
                        <div>
                            <div class="card-week">Week 11</div>
                            <div class="card-title">Mobile Cryptography</div>
                        </div>
                    </div>
                    <p class="card-description">iOS/Android security, Keychain, biometrics, certificate pinning.</p>
                    <div class="card-arrow">View lecture →</div>
                </a>
                
                <a href="lecture12/" class="card">
                    <div class="card-header">
                        <div class="card-icon lecture">📚</div>
                        <div>
                            <div class="card-week">Week 12</div>
                            <div class="card-title">Blockchain Cryptography</div>
                        </div>
                    </div>
                    <p class="card-description">Bitcoin/Ethereum signatures, Merkle trees, Proof of Work.</p>
                    <div class="card-arrow">View lecture →</div>
                </a>
                
                <a href="lecture13/" class="card">
                    <div class="card-header">
                        <div class="card-icon lecture">📚</div>
                        <div>
                            <div class="card-week">Week 13</div>
                            <div class="card-title">Quantum Cryptography</div>
                        </div>
                    </div>
                    <p class="card-description">Quantum computing threats, post-quantum cryptography, lattice-based schemes.</p>
                    <div class="card-arrow">View lecture →</div>
                </a>
            </div>
        </section>
        
        <section class="section">
            <h2 class="section-title">Supplementary Materials</h2>
            <div class="grid">
                <a href="kasiski-method/" class="card">
                    <div class="card-header">
                        <div class="card-icon info">🔍</div>
                        <div>
                            <div class="card-title">Kasiski Examination</div>
                        </div>
                    </div>
                    <p class="card-description">Method for breaking Vigenère cipher - finding key length.</p>
                    <div class="card-arrow">View material →</div>
                </a>
                
                <a href="quiz-lectures6-13/" class="card">
                    <div class="card-header">
                        <div class="card-icon quiz">📝</div>
                        <div>
                            <div class="card-title">Quiz Review</div>
                        </div>
                    </div>
                    <p class="card-description">Review questions covering Lectures 6-13.</p>
                    <div class="card-arrow">View quiz →</div>
                </a>
            </div>
        </section>
        
        <footer>
            <p>MAT364 Cryptography Course © 2025 | SDU University</p>
            <p style="margin-top: 0.5rem;">Built with <a href="https://sli.dev" target="_blank">Slidev</a></p>
        </footer>
    </div>
</body>
</html>
HTMLEOF

# Create .nojekyll to prevent Jekyll processing
touch docs/.nojekyll

echo ""
echo "✅ Build complete!"
echo "📁 Output directory: docs/"
echo ""
echo "To deploy to GitHub Pages:"
echo "  1. Push the docs/ folder to your repository"
echo "  2. Go to Settings → Pages → Source: Deploy from branch"
echo "  3. Select 'main' branch and '/docs' folder"

