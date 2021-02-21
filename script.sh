#!/bin/bash

# Creating and assigning variables
name="John Tild"
age=30

# Printing data to the screen
echo "My name is $name and i am $age years old"

# Reassigning variables
name="Tom Barrs"
age=12

# Reading input from User
echo "Enter your name: "
read name1
echo "You entered $name1"

# If statement
if [ $age -eq 30 ]; then
	echo "Age is really 30"
fi

# If statement with multiple conditions
# Logical AND
if [[ $age -eq 30 && $name=="John Tild" ]]; then
	echo "Both conditions are true."
fi

# Logical OR
if [[ $age -eq 5 || $name=="John Tild" ]]; then
	echo "One or both conditions are true."
fi


# If-else statement
if [[ $age -eq 90 ]]; then
	echo "Ages match"
else
	echo "Age is actually $age"
fi

# If-elif statement
echo "Enter Score: "
read score
if [[ $score>=80 ]]; then
	echo "$score -  A"
elif [[ $score>=70 && $score<80 ]]; then
	echo "$score - B"
elif [[ $score>=50 && $score<70 ]]; then
	echo "$score - C"
else
	echo "Failed. Cannot determine grade."
fi

# Case Statements
echo -n "Enter city: "
read place

case $place in
	"London")
		echo "$place is the UK" ;;
	"Madrid")
		echo "$place is in Spain" ;;
	"Paris")
		echo "$place is in France" ;;
	*)
		echo "Cannot Find" ;;
esac


# For loop
for (( i=0; i<=5; i++ )); do
	echo -n "$i "
done


countries="France Britain Denmark Italy"
for country in $countries; do 
	echo $country
done

# While loop with conditional control
counter=1
while [ $counter -le 15 ]; do
	echo "Counter is now $counter"
	(( counter++ ))

	if [[ $counter -eq 5 ]]; then
		break
	fi
done

# Until loop with conditional control
counter=0
until [ $counter -gt 10 ]; do
	echo "Counter is now $counter"
	(( counter++ ))

	if [[ $counter -eq 7 ]]; then
		break
	fi
done

# Functions
functn() { echo "This is a function"; echo "This continues"; }
functn

function printFunction {
	echo "This is another function"
}
printFunction
