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


;;arith1 works as expected
;;arith0 
;;42 does work
;;arith2 works
;;multiplication and addition works, 
;;subtraction does not work
;; in our let* the program fails because we cannot represent #t or #f, in our compiler representation true and false is represented using 0 and non-zero
;;for now, the cond in our compiler returns the branch when the clause is false (has value 0)

[ Question 1 ] 

For this task, you will write three new .irv programs. These are
`ir-virtual?` programs in a pseudo-assembly format. Try to compile the
program. Here, you should briefly explain the purpose of ir-virtual,
especially how it is different than x86: what are the pros and cons of
using ir-virtual as a representation? You can get the compiler to to
compile ir-virtual files like so: 

racket compiler.rkt -v test-programs/sum1.irv 

(Also pass in -m for Mac)

response:
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

[ High Level Reflection ] 

In roughly 100-500 words, write a summary of your findings in working
on this project: what did you learn, what did you find interesting,
what did you find challenging? As you progress in your career, it will
be increasingly important to have technical conversations about the
nuts and bolts of code, try to use this experience as a way to think
about how you would approach doing group code critique. What would you
do differently next time, what did you learn?

