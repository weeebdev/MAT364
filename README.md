# MAT364 - Cryptography for Programmers

[![Course](https://img.shields.io/badge/Course-MAT364-blue.svg)](https://github.com/adilakhmetov/mat354)
[![University](https://img.shields.io/badge/University-SDU-green.svg)](https://sdu.edu.kz)
[![Semester](https://img.shields.io/badge/Semester-Fall%202025-orange.svg)](https://github.com/adilakhmetov/mat354)
[![Instructor](https://img.shields.io/badge/Instructor-Adil%20Akhmetov-purple.svg)](https://github.com/adilakhmetov)

> **A practical, hands-on approach to cryptography for computer science students**

## 📚 Course Overview

The **Cryptography for Programmers** course is designed for students with computer science backgrounds and focuses on practical implementation of cryptographic algorithms in modern software systems. This course minimizes mathematical aspects in favor of practical programming, algorithm implementation, and integration into real-world applications.

### 🎯 Learning Objectives

**Technical Skills:**
- **Practical Programming** of cryptographic algorithms
- **Understanding Modern Cryptographic Protocols** (TLS/SSL, HTTPS, SSH)
- **Security Analysis and Testing** with penetration testing and vulnerability analysis

**Key Competencies:**
- Implement classical and modern ciphers from scratch
- Work with cryptographic libraries and APIs
- Create secure web applications and APIs
- Analyze and break cryptographic systems
- Apply security best practices in real-world scenarios

## 🗂️ Repository Structure

```
mat354/
├── new/                          # Current course materials
│   ├── lecture1.md              # Introduction to Cryptography
│   ├── lecture2.md              # Classical Ciphers
│   ├── lecture3.md              # Cryptanalysis and Attacks
│   ├── kasiski-method.md        # Deep dive: Kasiski Method
│   ├── CS_Cryptography_Syllabus.md
│   └── dist/                    # Built presentation files
├── old/                         # Previous course materials
│   ├── L1 Introduction to Cryptography.pdf
│   ├── L1 with notes.pdf
│   └── L2 Classical ciphers.pdf
└── README.md                    # This file
```

## 📖 Course Content

### Week 1: Introduction to Cryptography
- **Topics:** Cryptography fundamentals, terminology, attack types, security models
- **Practical:** Create simple XOR cipher, analyze vulnerabilities
- **Tools:** Python/JavaScript development environment

### Week 2: Classical Ciphers
- **Topics:** Caesar cipher, substitution ciphers, transposition ciphers
- **Practical:** Implement Caesar cipher, frequency analysis, brute force attacks
- **Focus:** Understanding why classical ciphers are insecure

### Week 3: Cryptanalysis and Attacks
- **Topics:** Brute force attacks, frequency analysis, timing attacks, side-channel attacks
- **Practical:** Create frequency analysis tools, implement timing attacks
- **Advanced:** Modern attack vectors and defensive measures

### Week 4: Stream Ciphers and One-Time Pads
- **Topics:** Stream ciphers, pseudorandom number generators, RC4, ChaCha20
- **Practical:** Implement stream ciphers, test random number generators
- **Security:** Perfect secrecy and its limitations

### Week 5: Block Ciphers and Applications
- **Topics:** Block cipher principles, modes (ECB, CBC, GCM), AES implementation
- **Practical:** Implement block ciphers, compare operation modes
- **Real-world:** File encryption applications

### Week 6: Hash Functions and Data Integrity
- **Topics:** MD5, SHA-1, SHA-256, SHA-3, HMAC
- **Practical:** Password storage systems, file integrity verification
- **Applications:** Digital signatures and authentication

### Week 7: Asymmetric Cryptography - RSA
- **Topics:** Asymmetric cryptography principles, RSA algorithm, key management
- **Practical:** Implement RSA, key exchange systems
- **Security:** Large file encryption with RSA

### Week 8: Key Exchange and Protocols
- **Topics:** Diffie-Hellman protocol, man-in-the-middle attacks
- **Practical:** Implement Diffie-Hellman, secure communication channels
- **Analysis:** Protocol vulnerability assessment

### Week 9: Digital Signatures
- **Topics:** Digital signature principles, DSA, ECDSA
- **Practical:** Digital signature systems, verification
- **Applications:** Blockchain and certificates

### Week 10: Cryptographic Protocols in Web Development
- **Topics:** HTTPS/TLS, JWT tokens, OAuth 2.0, OpenID Connect
- **Practical:** HTTPS servers, JWT authentication, OAuth providers
- **Integration:** Web application security

### Week 11-15: Advanced Topics and Projects
- **Week 11:** Mobile cryptography and biometric authentication
- **Week 12:** Blockchain cryptography and consensus algorithms
- **Week 13:** Quantum cryptography and post-quantum algorithms
- **Week 14-15:** Final project - Secure messenger application

## 🛠️ Technical Requirements

### Software Stack
- **Python 3.8+** with libraries: `cryptography`, `pycryptodome`, `requests`
- **Node.js** for web development
- **Git** for version control
- **Docker** for containerization

### Recommended IDEs
- **Visual Studio Code** with cryptography extensions
- **PyCharm Professional**
- **IntelliJ IDEA**

### Development Environment
```bash
# Clone the repository
git clone https://github.com/adilakhmetov/mat354.git
cd mat354

# Install Python dependencies
pip install cryptography pycryptodome requests

# Install Node.js dependencies (if needed)
npm install
```

## 📚 Learning Resources

### Primary Literature
1. **"Real-World Cryptography"** - David Wong (2021)
2. **"Cryptography Engineering"** - Niels Ferguson, Bruce Schneier, Tadayoshi Kohno (2010)
3. **"Serious Cryptography"** - Jean-Philippe Aumasson (2017)

### Online Resources
- [OWASP Cryptographic Storage Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cryptographic_Storage_Cheat_Sheet.html)
- [Cryptopals Crypto Challenges](https://cryptopals.com/)
- [NIST Cryptographic Standards](https://www.nist.gov/cryptography)
- [CryptoHack](https://cryptohack.org/) - Interactive cryptography learning platform

### Practice Tools
- **Wireshark** - Network traffic analysis
- **Burp Suite** - Web application testing
- **John the Ripper** - Password cracking

## 🎯 Assessment

| Assessment | Description | Quantity | Percentage |
|------------|-------------|----------|------------|
| **Quizzes** | Practical programming and theory quizzes | 3 | 60% |
| **Final Project** | Comprehensive cryptographic project | 1 | 40% |

### Final Project: Secure Messenger
Create a complete secure messaging application with:
- End-to-end encryption
- User authentication
- Message integrity verification
- Secure key exchange
- Mobile/web interface

## 🚀 Getting Started

### 1. Explore the Materials
- Start with `lecture1.md` for course introduction
- Follow the weekly progression through `lecture2.md`, `lecture3.md`, etc.
- Use `kasiski-method.md` for deep dives into specific topics

### 2. Run the Presentations
```bash
# Install Slidev (if not already installed)
npm install -g @slidev/cli

# Run any presentation
slidev new/lecture2.md
slidev new/lecture3.md
slidev new/kasiski-method.md
```

### 3. Practice with Code Examples
- Each lecture includes working Python code
- Experiment with different parameters
- Try breaking the implementations
- Implement your own variations

## 📞 Contact Information

**Instructor:** Adil Akhmetov  
**Email:** adil.akhmetov@sdu.edu.kz  
**University:** SDU (Suleyman Demirel University)  
**Office Hours:** [Schedule TBD]

## 🤝 Contributing

This repository is part of an academic course. Contributions are welcome for:
- Code improvements and optimizations
- Additional examples and exercises
- Documentation enhancements
- Bug fixes and security improvements

## 📄 License

This course material is provided for educational purposes. Please respect academic integrity and use responsibly.

## 🔗 Related Resources

- [Stanford CS255: Cryptography (Dan Boneh)](https://crypto.stanford.edu/~dabo/courses/CS255/)
- [Coursera: Cryptography I (Dan Boneh)](https://www.coursera.org/learn/crypto)
- [CTFtime](https://ctftime.org/) - Cybersecurity competitions
- [GitHub Security Lab](https://securitylab.github.com/) - Vulnerability examples

---

**Ready to dive into the fascinating world of cryptography? Start with the first lecture and begin your journey toward becoming a cryptography expert! 🔐**