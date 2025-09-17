---
theme: default
class: text-center
highlighter: shiki
lineNumbers: false
info: |
  ## Cryptography Syllabus
  MAT364 - Cryptography Course
drawings:
  persist: false
transition: slide-left
title: Cryptography
---

# Cryptography
## MAT364 - Cryptography Course

**Instructor:** Adil Akhmetov  
**University:** SDU  
**Semester:** Fall 2025

<div class="pt-12">
  <span @click="$slidev.nav.next" class="px-2 py-1 rounded cursor-pointer" hover="bg-white bg-opacity-10">
    Press Space for next page →
  </span>
</div>

---
layout: default
---

# Course Description

The **"Cryptography for Programmers"** course is designed for students with computer science backgrounds and focuses on practical implementation of cryptographic algorithms in modern software systems.

<div class="grid grid-cols-2 gap-4 mt-8">

<div>

## Key Focus Areas
- **Practical Programming** of cryptographic algorithms
- **Real-world Applications** in software development
- **Minimal Mathematics** - more implementation details
- **Modern Tools** and libraries

</div>

<div>

## Learning Outcomes
- Implement classical and modern ciphers
- Work with cryptographic libraries
- Create secure APIs and web applications
- Understand modern cryptographic protocols

</div>

</div>

---
layout: two-cols
---

# Learning Objectives

## Technical Skills
1. **Practical Programming of Cryptographic Algorithms**
   - Implementation of classical and modern ciphers
   - Working with cryptographic libraries
   - Creating secure APIs and web applications

2. **Understanding Modern Cryptographic Protocols**
   - TLS/SSL, HTTPS, SSH
   - Authentication and authorization
   - Digital signatures and certificates

::right::

## Security Analysis
3. **Security Analysis and Testing**
   - Penetration testing of cryptographic implementations
   - Vulnerability analysis
   - Secure programming practices

---
layout: section
---

# Course Structure

---
layout: default
---

# Weekly Course Plan

<div class="grid grid-cols-2 gap-4 text-sm">

<div>

## Weeks 1-4: Foundations
- **Week 1:** Introduction to Cryptography for Programmers
- **Week 2:** Classical Ciphers and Implementation
- **Week 3:** Cryptanalysis and Attacks
- **Week 4:** Stream Ciphers and One-Time Pads

</div>

<div>

## Weeks 5-8: Core Algorithms
- **Week 5:** Block Ciphers and Applications
- **Week 6:** Hash Functions and Data Integrity
- **Week 7:** Asymmetric Cryptography - RSA
- **Week 8:** Key Exchange and Protocols

</div>

<div>

## Weeks 9-12: Applications
- **Week 9:** Digital Signatures
- **Week 10:** Cryptographic Protocols in Web Development
- **Week 11:** Cryptography in Mobile Applications
- **Week 12:** Cryptography in Blockchain

</div>

<div>

## Weeks 13-15: Advanced Topics
- **Week 13:** Quantum Cryptography and Post-Quantum
- **Week 14:** Practical Projects
- **Week 15:** Final Testing and Project Defense

</div>

</div>

---
layout: two-cols
---

# Week 1: Introduction to Cryptography

## Topics
- Cryptography fundamentals: terminology and concepts
- Types of attacks and security models
- Cryptographic primitives in programming

## Practical Assignments
- Create a simple cipher in Python/JavaScript
- Analyze vulnerabilities in existing code
- Set up development environment for cryptography

::right::

## Code Example
```python
# Simple XOR cipher
def xor_cipher(text, key):
    return ''.join(chr(ord(c) ^ key) for c in text)

# Usage
message = "Hello World"
encrypted = xor_cipher(message, 5)
print(f"Encrypted: {encrypted}")
```

---
layout: two-cols
---

# Week 2: Classical Ciphers

## Topics
- Caesar cipher and its variations
- Substitution ciphers
- Transposition ciphers

## Practical Assignments
- Implement Caesar cipher with different keys
- Create frequency analysis program
- Break simple ciphers using brute force

::right::

## Code Example
```python
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

---
layout: default
---

# Assessment Methods

<div class="grid grid-cols-2 gap-8 mt-8">

<div>

## Quizzes (60%)
- **3 Quizzes** throughout the semester
- Cover practical programming and theory
- Hands-on coding challenges
- Real-world problem solving

</div>

<div>

## Final Project (40%)
- **Comprehensive cryptographic project**
- Choose from suggested topics or propose your own
- Implement a complete cryptographic system
- Documentation and presentation required

</div>

</div>

<div class="mt-8 p-4 bg-blue-100 rounded-lg">
<strong>Suggested Final Projects:</strong>
- Secure messaging application
- File encryption system
- Blockchain implementation
- Web authentication system
</div>

---
layout: default
---

# Technical Requirements

<div class="grid grid-cols-2 gap-8">

<div>

## Software
- **Python 3.8+** with libraries:
  - `cryptography`
  - `pycryptodome`
  - `requests`
- **Node.js** for web development
- **Git** for version control
- **Docker** for containerization

</div>

<div>

## Recommended IDEs
- **Visual Studio Code** with cryptography extensions
- **PyCharm Professional**
- **IntelliJ IDEA**

</div>

</div>

<div class="mt-8">
<h3>Getting Started</h3>
<pre><code>pip install cryptography pycryptodome requests
npm install -g @slidev/cli
git clone [course-repository]</code></pre>
</div>

---
layout: default
---

# Reading List

<div class="grid grid-cols-2 gap-8">

<div>

## Primary Literature
1. **"Real-World Cryptography"** - David Wong (2021)
2. **"Cryptography Engineering"** - Niels Ferguson, Bruce Schneier, Tadayoshi Kohno (2010)
3. **"Serious Cryptography"** - Jean-Philippe Aumasson (2017)

</div>

<div>

## Online Resources
- [OWASP Cryptographic Storage Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cryptographic_Storage_Cheat_Sheet.html)
- [Cryptopals Crypto Challenges](https://cryptopals.com/)
- [NIST Cryptographic Standards](https://www.nist.gov/cryptography)
- [CryptoHack](https://cryptohack.org/)

</div>

</div>

---
layout: default
---

# Practice Tools

<div class="grid grid-cols-3 gap-4">

<div class="text-center">
<h3>Network Analysis</h3>
<strong>Wireshark</strong>
- Network traffic analysis
- Protocol inspection
- Security monitoring
</div>

<div class="text-center">
<h3>Web Testing</h3>
<strong>Burp Suite</strong>
- Web application testing
- Vulnerability scanning
- Security assessment
</div>

<div class="text-center">
<h3>Password Security</h3>
<strong>John the Ripper</strong>
- Password cracking
- Security testing
- Vulnerability assessment
</div>

</div>

---
layout: default
---

# Contact Information

<div class="grid grid-cols-2 gap-8">

<div>

## Instructor
**Adil Akhmetov**  
📧 adil.akhmetov@sdu.edu.kz  
🏢 [Office Address]  
🕒 [Office Hours]

</div>

<div>

## Course Information
- **Course Code:** MAT364
- **Course Name:** Cryptography
- **Semester:** Fall 2025
- **University:** SDU

</div>

</div>

<div class="mt-8 p-4 bg-green-100 rounded-lg">
<strong>Important:</strong> This syllabus is adapted for students with computer science backgrounds and focuses on practical application of cryptography in modern software development.
</div>

---
layout: end
---

# Questions?

<div class="pt-12">
  <span class="px-2 py-1 rounded cursor-pointer" hover="bg-white bg-opacity-10">
    Thank you for your attention! ❤️
  </span>
</div>
