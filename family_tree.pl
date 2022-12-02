Begin by downloading the provided file royal.pl from Canvas. This file is a set of Prolog facts that represents the genealogy of the royal House of Windsor covering the years 1760-present. Using the facts provided in royal.pl we can construct a family tree.

People
The individuals in the family tree are given as facts and noted as male or female.

male('King George III').
male('King George IV').
...
female('Charlotte of Mecklenburg-Strelitz').
female('Caroline of Brunswick').
...
Birth and Death
The list of facts also includes dates of birth and death (if applicable) for each individual in the family tree. 

born('King George III', 1738).
born('Charlotte of Mecklenburg-Strelitz', 1744).
...
died('Franz: Duke of Saxe-Coburg-Saalfeld', 1806).
died('Charlotte of Mecklenburg-Strelitz', 1818).
...
Parents
The family tree includes the parents of each individual.

parent('King George III', 'King George IV').
parent('Charlotte of Mecklenburg-Strelitz', 'King George IV').
...
The rule parent(P, C) indicates that P is the parent of child C. For any individual, there will be two parent facts: one for the father and the other for the mother. In the above snippet, King George III is the father of King George IV and Charlotte of Mecklenburg-Strelitz is the mother of King George IV.

Marriage
The rule married(H, W) lists the marriages of husband H and wife W.

married('King George III', 'Charlotte of Mecklenburg-Strelitz').
married('King George IV', 'Caroline of Brunswick').
...
Regency
Lastly, the file royal.pl also contains facts about the English monarchs, which notes the years the person served as king or queen.

reigned('King George III', 1760, 1820).
...
reigned('Queen Elizabeth II', 1952, 2021).
Getting Started
Create an empty file lab5.pl or use the provided (nearly) empty template file. In this file, you will include all the Prolog rules you will be asked to write in the lab. This file must be in the same directory as royal.pl . You must consult (import) royal.pl in your lab5.pl file.

Note that .pl is also an extension used by Perl and this may confuse syntax highlighting programs. Syntax highlighting will not be terribly useful in this Prolog lab, so you need not concern yourself with it. If wish, you can search for custom syntax highlighting extensions to your favorite code editor (e.g., in vim Links to an external site., Atom Links to an external site., Sublime Links to an external site., Notepad++ Links to an external site., VSCode Links to an external site.).

Your program must begin with a comment that includes your name and the date. Programs submitted without your name in the file will not be scored!

Warmup
Let's start by checking that everything is working. First start swipl at the command line. 

Next, load the file royal.pl by typing the following. 

:- consult( 'royal.pl' ).
Note that the above rule is a headless horn clause because it does not have a left-hand term. This is equivalent to saying if true then perform the right-hand side. This is useful to instruct Prolog to perform a task, such as to load the royal.pl file. Also, note that all rules in Prolog end with a period. 

Next, run the following query. The symbol ?- is the Prolog query prompt. You do not retype this.

?- parent( X,  'Queen Elizabeth II' ).
This query asks who is the parent of Queen Elizabeth II. Prolog first returns the result X = 'King George VI'. Type a semicolon (;) to prompt Prolog for the next result. Prolog then returns X ='Lady Elizabeth Bowes-Lyon'. The period following the second result indicates there are no additional results.

The entire query and result interaction should appear as so.

?- parent( X,  Queen Elizabeth II ). 
X = King George VI ; 
X = Lady Elizabeth Bowes-Lyon . 
Replicate this exchange on your machine.

Relationship Rules
In this lab, you will create a number of Prolog rules that define a number of common familial relationships. 

Parents
In Prolog parlance, we define a rule as its name and its arity Links to an external site.. For instance the rule mother/2 indicates a rule named mother with two arguments.

mother(M,C):- parent(M,C), female(M).
Add this rule to your Prolog file. Reload your file.  Test your new rule with the following query.

?- mother(X, 'Queen Elizabeth II').
which should return the single result:

X = 'Lady Elizabeth Bowes-Lyon'.
Now write the rule father/2 and add it to your file.

Immediate Family
 Next, write a set of additional rules to describe relationships in the immediate family.

spouse/2
child/2
son/2
daughter/2
sibling/2
brother/2
sister/2
In your rules, you are encouraged to make use of other rules you have previously written. For example, a sister is a specific kind of sibling and might make use of the sibling rule. This may impact the order you choose to implement these rules in the file. 

Ensure you pay attention to the order of the arguments. Accidentally switching the order of the arguments will change the meaning of the function. This is the most common mistake students will make in this programming assignment.

Extended Family
 Next, write a set of additional rules to describe relationships in the extended family.

uncle/2              (two rules)
aunt/2                (two rules)
grandparent/2
grandfather/2
grandmother/2
grandchild/2
To cover aunt and uncle we need two rules for each. The first describes an aunt by blood, which is someone directly related to your parent. The other rule describes an aunt by marriage, which is someone married to the sibling of your parent. Similarly, there are two rules needed to cover the uncle relationship.

Ancestors
For the next two rules, make use of rules you have already written. This is a recursive rule and will need a base case. It will take more than one rule to define these functions.

Write the following rules:

ancestor/2
descendant/2
The rule ancestor(X, Y) means X is the ancestor of Y.  An ancestor is a parent, grandparent, great-grandparent, great-great-grandparent, etc. The rule descendant(X, Y) means X is the descendant of Y.

Numeric Comparisons
Next, we will write some Prolog rules that require numeric comparisons.

Complete the following rules:

older/2
younger/2
The rule older(X, Y) indicates person X is older than person Y. The rule younger/2 will be written in a similar manner. Please note that this rule is the same as previous ones. When given both an X and a Y, it sets a relationship. When given only an X it will return all the persons (Y) that X is older than and vis versa. 

Lastly, write a rule that determines the regent in power at the time when someone was born.

regentWhenBorn/2
The rule regentWhenBorn(X, Y) asks who was King or Queen (X) when person Y was born. HINT: do not use inclusive dates when making your rules.

Cousin (Extra Credit)
Write rule(s) that define the first cousin relationship, cousin/2. You must determine the formal (logic) definition of a first-cousin Links to an external site.. You do not need to support second or third cousins, nor cousins removed.

Summary of Rules
The following is a summary of the rules you will write in Lab 5.

mother/2
father/2
spouse/2
child/2
son/2
daughter/2
sibling/2
brother/2
sister/2
uncle/2              (two rules)
aunt/2                (two rules)
grandparent/2
grandfather/2
grandmother/2
grandchild/2
ancestor/2
descendant/2
older/2
younger/2
regentWhenBorn/2
cousin/2              (extra credit)
Resources
This lab requires an independent study of the Prolog language. You are encouraged to use any web tutorials and resources to learn Prolog.

SWI Prolog manualLinks to an external site.
Prolog interactive IDELinks to an external site.
Introduction to PrologLinks to an external site.
More Prolog examplesLinks to an external site.
Even more Prolog examplesLinks to an external site.
Allow yourself plenty of time, and use patience, perseverance, and the Internet to debug your code.

Output Format
Copy the following line of code and paste it near the beginning of your program.

portray(Term) :- atom(Term), format("~s", Term).
This code reads lines from standard input and evaluates them. It terminates on end-of-input. This is necessary to work with the automatic tester. It is already provided in the (nearly) empty provided template lab5.pl.

Testing
In the directory tests you will find a number of pairs of files representing the given input and expected output of the test. You can use these tests at the command line to test your program. 

swipl lab5.pl < ./tests/t00.in
The above line will execute lab5.pl piping in the input given in the file t00.in. You can compare your result with the expected output given in the file t00.out.

Test t00 checks the parent relationship, which is provided as part of the royal.pl file. You should use test t00 to determine your Prolog installation is working before continuing onto the first task. 

Submission
Each student will complete and submit this assignment individually. Do not consult with others outside of our course message boards. However, you are encouraged to use the Internet to learn Prolog.

You will submit only your single code file.

lab5.pl
Do not submit royal.pl or any of the tests. 
