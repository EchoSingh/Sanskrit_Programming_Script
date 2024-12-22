📝 **README for Script Interpreter**

Welcome to the **Script Interpreter** project! 🚀

This project allows you to interpret a simple script written in a custom language with keywords in Sanskrit. It supports variable assignment, arithmetic operations, conditionals, and print statements.

### **ScreenShots**:
   ![Screenshot](Screenshots/output.jpg)

### 🛠 **Features**:
- **Addition** ➕ (yojay)
- **Subtraction** ➖ (hrasam)
- **Multiplication** ✖️ (gunam)
- **Division** ➗ (bhagam)
- **Comparison** 🔍 (adhikam, nyunam, samanam, vyatyasam)
- **Logical Negation** ❌ (nasti)
- **Conditionals** ⬇️ (yadi, athava)
- **Loops** 🔄 (punaravrtti, paryantam)
- **Print statements** 🖨️ (pradarshayati)

### ⚙️ **How to Compile and Run**:
1. **Step 1**: Install **Bison** and **Flex** if not already installed.
   - On Ubuntu, use `sudo apt install bison flex gcc`.
2. **Step 2**: Compile the Lexer and Parser files:
   ```bash
   bison -d parser.y
   flex lexer.l
   gcc -o program lex.yy.c parser.tab.c -lfl
   ```
3. **Step 3**: Run the compiled program:
   ```bash
    ./program
   ```
4. **Step 4** : Write a script in the custom language and input it to see the output. The script should use latin sanskrit keywords for operations (like yojay, hrasam).


### ✨ **Example**:

   ```bash
    ./program
    कार्यक्रम आरंभ: अपना कोड लिखें।
    x = 10
    y = 9
    z = x yojay y
    pradarshayati("z mulya : ")
    "z mulya : "
    pradarshayati(z)
    उत्तरम्: 19
   ```
### 💬 **How It Works**:
     Assignments: Use = to assign values to variables.
     Operations: Perform operations like addition (yojay), subtraction (hrasam), etc.
     Print Statements: Use pradarshayati to print output.
### 📚 **License**:
     This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
 
