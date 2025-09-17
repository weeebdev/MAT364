# Computer Science Cryptography Syllabus
**Course: MAT364 - Cryptography**  
**Instructor: Adil Akhmetov**  
**University: SDU**  
**Semester: Fall 2025**

## Course Description

The "Cryptography for Programmers" course is designed for students with computer science backgrounds and focuses on practical implementation of cryptographic algorithms in modern software systems. The course minimizes mathematical aspects in favor of practical programming, algorithm implementation, and integration into real-world applications.

## Learning Objectives

### Technical Skills
1. **Practical Programming of Cryptographic Algorithms**
   - Implementation of classical and modern ciphers
   - Working with cryptographic libraries
   - Creating secure APIs and web applications

2. **Understanding Modern Cryptographic Protocols**
   - TLS/SSL, HTTPS, SSH
   - Authentication and authorization
   - Digital signatures and certificates

3. **Security Analysis and Testing**
   - Penetration testing of cryptographic implementations
   - Vulnerability analysis
   - Secure programming practices

## Weekly Course Plan

### Week 1: Introduction to Cryptography for Programmers
**Topics:**
- Cryptography fundamentals: terminology and concepts
- Types of attacks and security models
- Cryptographic primitives in programming

**Practical Assignments:**
- Create a simple cipher in Python/JavaScript
- Analyze vulnerabilities in existing code
- Set up development environment for cryptography

**Code Examples:**
```python
# Simple XOR cipher
def xor_cipher(text, key):
    return ''.join(chr(ord(c) ^ key) for c in text)
```

### Week 2: Classical Ciphers and Implementation
**Topics:**
- Caesar cipher and its variations
- Substitution ciphers
- Transposition ciphers

**Practical Assignments:**
- Implement Caesar cipher with different keys
- Create frequency analysis program
- Break simple ciphers using brute force

**Code Examples:**
```python
# Caesar cipher
def caesar_cipher(text, shift):
    result = ""
    for char in text:
        if char.isalpha():
            ascii_offset = 65 if char.isupper() else 97
            result += chr((ord(char) - ascii_offset + shift) % 26 + ascii_offset)
        else:
            result += char
    return result
```

### Week 3: Cryptanalysis and Attacks
**Topics:**
- Brute force attacks
- Frequency analysis
- Timing attacks
- Side-channel attacks

**Practical Assignments:**
- Create frequency analysis tool
- Implement timing attack
- Analyze vulnerabilities in cryptographic libraries

### Week 4: Stream Ciphers and One-Time Pads
**Topics:**
- Stream ciphers in programming
- Pseudorandom number generators
- RC4 and ChaCha20 implementation

**Practical Assignments:**
- Implement stream cipher
- Test quality of random number generators
- Create secure password generator

**Code Examples:**
```python
# Simple stream cipher
import random

def stream_cipher(text, seed):
    random.seed(seed)
    keystream = [random.randint(0, 255) for _ in range(len(text))]
    return bytes(a ^ b for a, b in zip(text.encode(), keystream))
```

### Week 5: Block Ciphers and Applications
**Topics:**
- Block cipher principles
- Block cipher modes (ECB, CBC, GCM)
- AES implementation

**Practical Assignments:**
- Implement simple block cipher
- Compare different modes of operation
- Create file encryptor

**Code Examples:**
```python
from cryptography.fernet import Fernet

# AES encryption
def encrypt_file(filename, key):
    f = Fernet(key)
    with open(filename, 'rb') as file:
        encrypted_data = f.encrypt(file.read())
    with open(filename + '.encrypted', 'wb') as file:
        file.write(encrypted_data)
```

### Week 6: Hash Functions and Data Integrity
**Topics:**
- MD5, SHA-1, SHA-256, SHA-3
- HMAC (Hash-based Message Authentication Code)
- Applications in passwords and digital signatures

**Practical Assignments:**
- Create password storage system with hashing
- Implement HMAC
- Create file integrity verification system

**Code Examples:**
```python
import hashlib
import hmac

def hash_password(password, salt):
    return hashlib.pbkdf2_hmac('sha256', password.encode(), salt, 100000)

def verify_file_integrity(filename, expected_hash):
    with open(filename, 'rb') as f:
        file_hash = hashlib.sha256(f.read()).hexdigest()
    return file_hash == expected_hash
```

### Week 7: Asymmetric Cryptography - RSA
**Topics:**
- Asymmetric cryptography principles
- RSA algorithm
- Key generation and management

**Practical Assignments:**
- Implement simple RSA
- Create key exchange system
- Encrypt large files using RSA

**Code Examples:**
```python
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives import serialization

def generate_rsa_keys():
    private_key = rsa.generate_private_key(
        public_exponent=65537,
        key_size=2048,
    )
    public_key = private_key.public_key()
    return private_key, public_key
```

### Week 8: Key Exchange and Protocols
**Topics:**
- Diffie-Hellman protocol
- Man-in-the-middle attacks
- Modern key exchange protocols

**Practical Assignments:**
- Implement Diffie-Hellman protocol
- Create secure communication channel
- Analyze protocol vulnerabilities

### Week 9: Digital Signatures
**Topics:**
- Digital signature principles
- DSA and ECDSA
- Applications in blockchain and certificates

**Practical Assignments:**
- Create digital signature system
- Implement signature verification
- Integrate with web applications

**Code Examples:**
```python
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import padding

def sign_message(message, private_key):
    signature = private_key.sign(
        message.encode(),
        padding.PSS(
            mgf=padding.MGF1(hashes.SHA256()),
            salt_length=padding.PSS.MAX_LENGTH
        ),
        hashes.SHA256()
    )
    return signature
```

### Week 10: Cryptographic Protocols in Web Development
**Topics:**
- HTTPS and TLS
- JWT tokens
- OAuth 2.0 and OpenID Connect

**Practical Assignments:**
- Set up HTTPS server
- Implement JWT authentication
- Create OAuth 2.0 provider

**Code Examples:**
```python
import jwt
from datetime import datetime, timedelta

def create_jwt_token(user_id, secret_key):
    payload = {
        'user_id': user_id,
        'exp': datetime.utcnow() + timedelta(hours=24)
    }
    return jwt.encode(payload, secret_key, algorithm='HS256')
```

### Week 11: Cryptography in Mobile Applications
**Topics:**
- Secure data storage on mobile devices
- Biometric authentication
- API protection in mobile apps

**Practical Assignments:**
- Create mobile app with encryption
- Implement biometric authentication
- Protect local data

### Week 12: Cryptography in Blockchain
**Topics:**
- Hash functions in blockchain
- Digital signatures in transactions
- Consensus algorithms

**Practical Assignments:**
- Create simple blockchain
- Implement mining
- Analyze blockchain protocol security

### Week 13: Quantum Cryptography and Post-Quantum Cryptography
**Topics:**
- Quantum computer threats
- Post-quantum algorithms
- Preparing for quantum future

**Practical Assignments:**
- Research post-quantum algorithms
- Create hybrid cryptographic systems
- Analyze existing system readiness

### Week 14: Practical Projects
**Topics:**
- Developing cryptographic libraries
- Creating secure web applications
- Security auditing

**Practical Assignments:**
- Final project: create secure messenger
- Penetration testing own solutions
- Documentation and project presentation

### Week 15: Final Testing and Project Defense
**Topics:**
- Final project defense
- Final examination
- Results discussion

## Assessment Methods

| Assessment | Description | Quantity | Percentage |
|------------|-------------|----------|------------|
| Quizzes | Practical programming and theory quizzes | 3 | 60% |
| Final Project | Comprehensive cryptographic project | 1 | 40% |

## Technical Requirements

### Software
- Python 3.8+ with libraries: cryptography, pycryptodome, requests
- Node.js for web development
- Git for version control
- Docker for containerization

### Recommended IDEs
- Visual Studio Code with cryptography extensions
- PyCharm Professional
- IntelliJ IDEA

## Reading List

### Primary Literature
1. **"Real-World Cryptography"** - David Wong (2021)
2. **"Cryptography Engineering"** - Niels Ferguson, Bruce Schneier, Tadayoshi Kohno (2010)
3. **"Serious Cryptography"** - Jean-Philippe Aumasson (2017)

### Online Resources
- [OWASP Cryptographic Storage Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cryptographic_Storage_Cheat_Sheet.html)
- [Cryptopals Crypto Challenges](https://cryptopals.com/)
- [NIST Cryptographic Standards](https://www.nist.gov/cryptography)

### Practical Resources
- [CryptoHack](https://cryptohack.org/) - cryptography learning platform
- [CTFtime](https://ctftime.org/) - cybersecurity competitions
- [GitHub Security Lab](https://securitylab.github.com/) - vulnerability examples

## Additional Materials

### Video Lectures
- Stanford CS255: Cryptography (Dan Boneh)
- Coursera: Cryptography I (Dan Boneh)

### Practice Tools
- Wireshark for network traffic analysis
- Burp Suite for web application testing
- John the Ripper for password cracking

## Contact Information

**Instructor:** Adil Akhmetov  
**Email:** adil.akhmetov@sdu.edu.kz  
**Office:** [Office Address]  
**Office Hours:** [Schedule]  

**Teaching Assistant:** [TA Name]  
**Email:** [TA email]  

---

*This syllabus is adapted for students with computer science backgrounds and focuses on practical application of cryptography in modern software development.*
