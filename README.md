Expression Supported

The parser currently supports the following expression format:

a = b * c - e;

Where:

a, b, c, e are identifiers (variable names).

The operators used are:

(Multiplication)


(Subtraction)


= (Assignment)



Translation

The expression is translated to a custom instruction format as:

msub a, b, c, e

Which semantically means:

Multiply b and c

Subtract e from the result

Store the final result in a


This mimics a custom CPU instruction (like a fused multiply-subtract or msub).

Build & Run Instructions

1. Compile Bison grammar: bison -d parser.y


2. Compile Flex lexer: flex lexer.l


3. Compile and link everything: gcc -o parser parser.tab.c lex.yy.c -lfl


4. Run the parser: ./parser


5. Enter an expression: a = b * c - e;


6. Output: Custom instruction: msub a, b, c, e



License

MIT or your preferred license.

Let me know if you'd like to support more expressions or auto-generate an AST!
