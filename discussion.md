# Discussion and Reflection
Isabel, Aicha, Meagan


The bulk of this project consists of a collection of five
questions. You are to answer these questions after spending some
amount of time looking over the code together to gather answers for
your questions. Try to seriously dig into the project together--it is
of course understood that you may not grasp every detail, but put
forth serious effort to spend several hours reading and discussing the
code, along with anything you have taken from it.

Questions will largely be graded on completion and maturity, but the
instructors do reserve the right to take off for technical
inaccuracies (i.e., if you say something factually wrong).

Each of these (six, five main followed by last) questions should take
roughly at least a paragraph or two. Try to aim for between 1-500
words per question. You may divide up the work, but each of you should
collectively read and agree to each other's answers.



[ Question 1 ] 

For this task, you will write three new .irv programs. These are
`ir-virtual?` programs in a pseudo-assembly format. Try to compile the
program. Here, you should briefly explain the purpose of ir-virtual,
especially how it is different than x86: what are the pros and cons of
using ir-virtual as a representation? You can get the compiler to to
compile ir-virtual files like so: 

racket compiler.rkt -v test-programs/sum1.irv 

(Also pass in -m for Mac)

response: (files created for this: new1.irv, new2.irv, new3.irv included in repo)
The purpose of ir-virtual is as the name suggests, an immediate representation of programs. The ir-virtual turns programs into ".irv" files that makes them a simpler version of an assembly code. 

Ir-virtual is different than x86 architecture because x86 architecture is more efficent than the ir-virtual representation since it uses the 16 registers and memory addresses. Whereas Ir-virtual uses virtual registers, and linearizes the instructions using the "linearize" function. Ir-virtual and x86 archictecture both use jump instructions but ir-virtual is limited in the fact that it does not support all assembly instructions.

In terms of pros, ir-virtual simplifies the compilation process by using virtual registers. Additionally, ir-virtual provides a form of assembly that is optimized because the instruction set is restricted and has efficient register allocation.

As for the cons, ir-virtual is inefficent because of the fact that it has a restricted amount of instructions it can use. Thus, the assembly provided by ir-vritual is not able to represent complex code that x86 architecture can. Ir-virtual cannot directly use memory addresses like x86 assembly can as well.

[ Question 2 ] 

For this task, you will write four new .ifa programs. Your programs
must be correct, in the sense that they are valid. There are a set of
starter programs in the test-programs directory now. Your job is to
create three new `.ifa` programs and compile and run each of them. It
is very much possible that the compiler will be broken: part of your
exercise is identifying if you can find any possible bugs in the
compiler.

For each of your exercises, write here what the input and output was
from the compiler. Read through each of the phases, by passing in the
`-v` flag to the compiler. For at least one of the programs, explain
carefully the relevance of each of the intermediate representations.

For this question, please add your `.ifa` programs either (a) here or
(b) to the repo and write where they are in this file.
Response:  (our .ifa files are included in the repo)
new1.ifa output ==> 1
new2.ifa output ==> 3
new3.ifa output ==> 40
new4.ifa output ==> 80

Intermediate Representations of New4.ifa. 
(cond [(+ 1 2) (print 50)] [(* 3 2) (print 70)] [else (print 80)]). This is the starting point, representing the program in its high-level language form.
The program contains a cond expression with three conditions and an else branch.
Using IfArith-Tiny,  the program is translated from IfArith to a simpler representation using nested if expressions.
(if (+ 1 2) (print 50) (if (* 3 2) (print 70) (print 80))) expression representation simplifies the program by converting the cond expression to nested if expressions. The transformation adheres to short-circuiting behavior, stopping evaluation once a true condition is found.
ANF (Administrative-normal form): The program is then translated into ANF, which simplifies complex expressions into a series of statements using let bindings. ANF makes the code easier to analyze and generate.
The program becomes more explicit, with temporary variables (let bindings) managing evaluation order.
IR-Virtual: This is a lower-level intermediate representation closer to the assembly code. The program is broken down into basic operations such as mov-lit, add, cmp, and jump instructions (jz and jmp).
IR-Virtual deals with data manipulation in registers and memory, reflecting how the program will be executed on hardware.

x86 Assembly Code: The final target representation is in x86 assembly code, which the hardware can execute directly.
It contains specific instructions for the x86 architecture, handling data in registers and memory, arithmetic operations, comparisons, and control flow. This stage focuses on translating the program into machine-executable code, using printf to print values.

In sum, each stage converts the high-level IfArith source code to a form that can be executed by hardware. The first steps (IfArith and IfArith-Tiny) aim to simplify the code and control short-circuiting behavior. The intermediate stages (ANF and IR-Virtual) simplify the program's operations and statements, allowing for more efficient execution. The last stage (x86 assembly) produces machine code that is executable on the target architecture. The mismatch in the program's output might be attributed to how short-circuiting behavior is handled during the transition from IfArith to IfArith-Tiny, or to potential difficulties with jump management in the IR-Virtual and x86 stages.


[ Question 3 ] 

Describe each of the passes of the compiler in a slight degree of
detail, using specific examples to discuss what each pass does. The
compiler is designed in series of layers, with each higher-level IR
desugaring to a lower-level IR until ultimately arriving at x86-64
assembler. Do you think there are any redundant passes? Do you think
there could be more?

In answering this question, you must use specific examples that you
got from running the compiler and generating an output.

response: 
 The compiler first starts with IfArith expressions, converting them to IfArith-Tiny for simplification.
 The next layer (ANF) organizes expressions into a linear structure. It is then translated into
 Intermediate Representation (IR-Virtual), which maps virtual instructions. The x86 assembly
 instructions are generated from the information gathered. It is lastly formatted into NASM
 assembly for linking and assembly. We don't believe there are any redundant passes as each
 are all important and essential. Additional optimization passes could enhance performance,
 such as dead code elimination or constant folding, though they may add complexity to the
 compiler.

example: 
```ifa
(cond [(+ 1 2) (print 50)]
      [(* 3 2) (print 70)]
      [else (print 80)])
```

1.Parsing:  IfArith parses the source program into an abstract syntax tree (AST).
Output: The parsed representation. (cond [(+1, 2) (print 50)] [(* 3 2) (Print 70)] [Else (Print 80)]).
This step arranges the program into a structured representation, making further modifications easy.

2. Arith->Ifarith: To convert IfArith to IfArith-Tiny Desugaring, use the AST as the input.
Output: The program is desugared from conditional to nested if expressions.
The original code is rewritten as: (if (+ 1 2) (print 50) (if (* 3 2) (print 70) (print 80)).
This transformation streamlines the program's structure, reducing complicated constructions to simpler forms.
To convert IfArith-Tiny to ANF (A-normal form), provide the IfArith-Tiny AST as an input.
Output: The program is further changed into A-normal form, which simplifies equations and adds temporary variables. For example: (let ((x1254 1))...
This stage simplifies the program and prepares it for the future stages of compilation.

3. ANF to IR (virtual):
Input: the ANF representation.
Output: The program is converted to a lower-level representation that resembles assembly language.
Example: ((lab1263) (mov-lit x1254 1)).
This step takes the program closer to machine code, introducing explicit control flow and actions.

4.IR-virtual to x86-64 Assembly:
Input: the IR-virtual representation.
Output: The finished x86-64 assembly code.
For example, move esi to 50.
This stage translates the virtual representation into assembly code that can be run on the target architecture.

[ Question 4 ] 

This is a larger project, compared to our previous projects. This
project uses a large combination of idioms: tail recursion, folds,
etc.. Discuss a few programming idioms that you can identify in the
project that we discussed in class this semester. There is no specific
definition of what an idiom is: think carefully about whether you see
any pattern in this code that resonates with you from earlier in the
semester.

response:
This project's syntax and idioms are similar to the exercise we did called "if-arith" and the church encoding in project 
4. This project contains a variety of idioms that were taught earlier in this course. One of the most noticeable ones is 
tail recursion. The functions linearize and
translate use this idiom extensively. Pattern matching is also used throughout the code to match
 different data structures such as symbols, lists, and many more. The match function makes it
 easier to handle different/complex cases. Pattern matching makes the code easier to read and
 understand. Foldl was also used on multiple occasions in combination with lambda functions.
 Lastly, higher-order functions such as ifarith-tiny->anf can be seen.


[ Question 5 ] 

In this question, you will play the role of bug finder. I would like
you to be creative, adversarial, and exploratory. Spend an hour or two
looking throughout the code and try to break it. Try to see if you can
identify a buggy program: a program that should work, but does
not. This could either be that the compiler crashes, or it could be
that it produces code which will not assemble. Last, even if the code
assembles and links, its behavior could be incorrect.

To answer this question, I want you to summarize your discussion,
experiences, and findings by adversarily breaking the compiler. If
there is something you think should work (but does not), feel free to
ask me.

Your team will receive a small bonus for being the first team to
report a unique bug (unique determined by me).

response:
When examining the compiler code and running tests to identify potential bugs, we found several areas where the behavior of the compiler diverges from expectations. One key area of concern is how cond expressions are handled during the compilation process. In IfArith-Tiny, cond expressions are converted to nested if expressions, and these nested if statements should adhere to short-circuiting semantics, stopping evaluation once a true condition is found.

While running the program directly in Racket, cond behaves according to Racket's standard semantics, correctly using short-circuiting. However, when the program is compiled using the IfArith compiler, there may be a discrepancy in how the compiler translates cond to if. This could lead to incorrect control flow handling in the lower-level intermediate representations.

Another potential issue arises with the use of let* expressions, particularly when managing the representation of true and false in the compiler. Since true and false are represented as non-zero and zero respectively, there could be issues with how the compiler handles these boolean values, especially in let* expressions.

Additionally, the compiler's handling of arithmetic operations such as subtraction appears to be problematic, causing unexpected behavior or failures in the compiled code. These issues may stem from discrepancies in how the compiler translates arithmetic expressions in the high-level IfArith language to lower-level intermediate representations. We also found bugs when using built-ins like >,<, and = in functions.

Overall, these findings suggest that the compiler may not correctly manage control flow and semantics in certain scenarios, particularly in the conversion of cond expressions and arithmetic operations. For future work, it would be important to focus on refining the translation from IfArith to lower-level representations, ensuring accurate handling of boolean values, arithmetic operations, and control flow. This experience highlights the importance of rigorous testing and code critique to identify and address potential issues in the compilation process.

review of test cases:
-arith1 works as expected, arith0 
-42 does work
-arith2 works
-multiplication and addition operators work
-subtraction does not work
-in our let* the program fails because we cannot represent #t or #f, in our compiler representation true and false is represented using 0 and non-zero
-for now, the cond in our compiler returns the branch when the clause is false (has value 0)
-new4ifa when compiled and executed, returns 80 but dr racket returns 50, this is another bug

[ High Level Reflection ] 

In roughly 100-500 words, write a summary of your findings in working
on this project: what did you learn, what did you find interesting,
what did you find challenging? As you progress in your career, it will
be increasingly important to have technical conversations about the
nuts and bolts of code, try to use this experience as a way to think
about how you would approach doing group code critique. What would you
do differently next time, what did you learn?

