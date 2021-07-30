# A Quick Guide to Bash Scripting
## Introduction
Scripting is an essential skill to hackers and anyone else who wants to automate a repetitive process. It makes it easier to have solutions without needing to code a whole program while still being powerful and effective.
This tutorial is aimed at introducing the fundamentals of scripting in Bash and is designed with beginners in mind.

## Prerequisites
The following are necessary to follow along with the tutorial:
* Text Editor (Nano, Mousepad, etc)
* Bash Terminal

This tutorial uses Nano as the text editor and Parrot as the base OS.

## Getting Started
Create a text file with any name with the **.sh** extension.

    $ nano script.sh
    
The above opens the script with the Nano text editor.

The first line of any script is the shebang. This specifies what shell to run the script with. For Bash scripts, that is:

    #!/bin/bash
    
## "Hello World"
Bash scripts can use all native Bash commands. The following are some of many Bash commands that are available to be used in scripts: `cat` `pwd` `ls` `mkdir` `rm` `cd` `mv` `cp` `whoami` `echo` `read` `kill` `last` `man` etc.
To print out text to the screen, use `echo`.

    #!/bin/bash
    echo "Hello World"
    
This outputs "Hello World" when the script is run. 
In Nano, use `Ctrl + O` to write to the file without exiting and `Ctrl + X` to write to file and exit.

## Running the Script
To run the script, navigate to the location of the file and set the permissions to allow for execution of the script. 

    $ chmod +x script.sh
    
Alternatively, enter:

    $ chmod 777 script.sh
    
Run the script by using:

    $ ./script.sh
    
This should output **Hello World**.

Alternatively, you can run the script using:

    $ bash script.sh

## Variables
A variable is a container for values. Variables in Bash operate the same as in any other programming language and can hold numbers, strings/text or a single character. 
To create a variable, simply assign a value to it as shown:

    name="John Tild"
    age=30
    
To use a variable, add a dollar sign ($) at the start of the variable name as shown:

    echo "My name is $name and I am $age years old."
    
The output should contain the values stored in the variable. 

*NOTE:: When a variable reference/name is not preceded by a dollar sign, Bash interprets it as a literal string.* 

To change the value of a variable, simply reassign the value to the existing variable.

    name="Tom Barrs"
    age=12
    
To accept user input as values for variables, the `read` command is used. 

    echo "Enter your name: "
    read name1
    echo "You entered $name1"
    
This outputs "Enter your name: " and pauses for the user to enter input. Hit enter after typing the value to continue.

There are two types of variables: Global variables and local variables. Global variables are accessible thoughout the entire code while local variables are limited to the block of code in which they were created. 
A variable created in a function or a loop (discussed later) is a local variable and cannot be accessed outside the function or loop.

## Comments
Comments refer to extra information in the code/script that the shell/compiler ignores but has details for anyone reading.
Comments are created by putting a hash `#` at the start of a line or before the comment. Bash does not support multiline comments so each line of the comment must begin with the hash.

    # This is a comment. This line is ignored when the script is executed
    # This is a 
    #           multiline comment.
    
## Conditional Statements
Conditional statements are a way to introduce decision-making within code if a condition is satisfied or not. Bash supports the following conditional statements:
* If 
* If-else 
* If-elif
* Case

Conditional statements can also be nested or embedded within other conditional statements.
### If Statement
`If` statements execute commands if the given condition(s) is true, otherwise, nothing happen and the rest of the script continues.
Syntax:

    if [ condition ]; then
        command(s)
    fi
    
Example:

    if [ $age -eq 30 ]; then
        echo "Age is really 30"
    fi
    
This evaluates as true, hence the command `echo` executes, otherwise, nothing happens when run.

*NOTE:: `==` works with string comparisons only while `-eq` is used to test for equality in number types.*

#### Using multiple conditions
Conditional statements can have multiple conditions using logical operators such as:

    condition1 && condition2    # Logical AND
    condition1 || condition2    # Logical OR
    
    
### If-else Statement
`If-else` statements have two parts; the first standard *if* statement that evaluates when true and an *else* part which performs a command if the condition returns false.
Syntax:

    if [[ condition ]]; then
        command(s)
    else
        command(s)
    fi
    
Example:

    # If-else with logical AND
    if [[ $age -eq 0 && $name=="John Tild" ]]; then
        echo "Both conditions are true"
    else 
        echo "One or both conditions are false"
    fi
    
    # If-else with logical OR
    if [[ $age -eq 2 || $name=="John Tild" ]]; then
        echo "At least one condition is true"
    else
        echo "Both conditions are false"
    fi
    
### If-elif Statement
`If-elif` statements make provision for checking of extra conditions beyond the initial condition test at the if stage. 
Syntax:

    if [[ condition ]]; then
        command(s)
    elif [[ condition ]]; then
        command(s)
    ...
    else
        command(s)
    fi
    
The number of `elif` parts are not limited and can be added according to the number of conditions to be tested against.

Example:

    echo "Enter Score:"
    read score
    # if-elif statements
    if [[ $score>=80 ]]; then
        echo "$score - A"
    elif [[ $score>=70 && $score<80 ]]; then
        echo "$score - B"
    elif [[ $score>=50 && $score<70 ]]; then
        echo "$score - C"
    else
        echo "Failed. Cannot determine grade."
    fi
    
    
#### CAUTION 
When using `if-else` or `if-elif` statements, conditions should be put in double square braces instead of single square braces.
The space between the condition and both opening and closing braces must be present to avoid errors during execution.

### Case statement
Case statements simplify complex decision-making when there are multiple varied options. Bash case statements work by matching patterns (satisfying conditions) and executing commands associated where conditions are met.
Syntax:

    case <expression> in
        PATTERN1)
            command(s) ;;
        PATTERN2)
            command(s) ;;
        ...
        PATTERN_N)
            command(s) ;;
        *)
            command(s) ;;
    esac
    
Case statements are similar to switch statements in other languages such as C and JavaScript.

Example:

    echo -n "Enter City: "
    read place
    
    case $place in
        "London")
            echo "$place is in the UK" ;;
        "Madrid")
            echo "$place is in Spain" ;;
        "Paris")
            echo "$place is in France" ;;
        *)
            "Cannot find"
    esac
    
*TIP:: Use* `-n` *with* `echo` *to stay on the current line after output.*

## Loops
Loops define a way to iterate over a sequence or pattern and perform a repetitive task. Loops also depend on conditions to control operation of the loop.
There are three basic loops in Bash: 
 * For loops
 * While loops
 * Until loops

### For Loop
For loops work by iterating over a sequence or list and perform commands on each iteration unless otherwise specified.
Syntax:

    for (( initialisation ; ending condition ; update )); do
        command(s)
    done
    
    # Alternative Syntax
    for item in [list]
    do
        command(s)
    done
    
    # Alternative Syntax
    for x in {1..10}
    do
        command(s)
    done
    
Example:

    for (( i=0; i<=5; i++)); do
        echo -n "$i "
    done
    
    countries="France Britain Denmark Italy"
    for country in $countries; do
        echo $country
    done
    
### While Loop
The while loop performs an operation(s) as long as the stated expression/condition stays true. Execution of commands only stops when the expression is false or a conditional is used for control.
Syntax:

    while expression; do
        command(s)
    done
    
Example:

    counter=1
    while [ $counter -le 15 ]; do
        echo "Counter is now $counter"
        (( counter++ ))
        
        if [[ $counter -eq 5 ]]; then
            break
        fi
    done
    
### Until Loop
The until loop operates similar to the while loop except the until loop executes until the condition or expressionn becomes true. The until loop can also be controlled using conditional statements.
Syntax: 

    until expression; do
        command(s)
    done
    
Example:

    counter=0
    until [ $counter -gt 10]; do
        echo "Counter is now $counter"
        (( counter++ ))
        
        if [[ $counter -eq 7 ]]; then
            break
        fi
    done
    
### Functions
A function refers to a block of code organized to perform an action. Functions provide a way to reuse code. 
Functions are essentially command sets that can be used numerous times during the code.
Syntax:

    function_name() {
        command(s)
    }
    
    # Alternative Syntax using the function keyword
    function function_name {
        command(s)
    }
    
    # One-liner version
    function_name() { command(s); }
    
Functions can only be called after they have been defined and are called by their reference with no extra characters.

Example:

    functn() { echo "This is a function"; echo "This continues"; }
    functn
    
    function printFunction {
        echo "This is another function"
    }
    
## Conclusion
At this point, you should now be able to write a script in Bash, simple and complex to run wherever there is a Bash shell.

## References
The script built during this tutorial is available on Github [here](https://github.com/MildThrone83943/Bash-Scripting).
For more details on how and when to use `[ ]` against `[[ ]]` in Bash, see [here](https://serverfault.com/questions/52034/what-is-the-difference-between-double-and-single-square-brackets-in-bash)
