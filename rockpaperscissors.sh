#!/bin/bash

# Function to get a random choice for the computer
get_random_choice() {
    choices=("rock" "paper" "scissors")
    echo ${choices[$RANDOM % ${#choices[@]}]}
}

# Function to determine the winner
determine_winner() {
    if [ "$1" == "$2" ]; then
        echo "It's a tie!"
    elif [ "$1" == "rock" ] && [ "$2" == "scissors" ] ||
         [ "$1" == "scissors" ] && [ "$2" == "paper" ] ||
         [ "$1" == "paper" ] && [ "$2" == "rock" ]; then
        echo "You win!"
    else
        echo "You lose!"
    fi
}

echo "Welcome to Rock, Paper, Scissors!"
echo "Type 'exit' to quit the game."

while true; do
    echo -n "Enter your choice (rock, paper, or scissors): "
    read user_choice

    # Exit the loop if the user types 'exit'
    if [ "$user_choice" == "exit" ]; then
        echo "Thanks for playing! Goodbye!"
        break
    fi

    # Validate user input
    if [[ ! "$user_choice" =~ ^(rock|paper|scissors)$ ]]; then
        echo "Invalid choice. Please enter rock, paper, or scissors."
        continue
    fi

    echo "You chose: $user_choice"

    # Get computer's choice
    computer_choice=$(get_random_choice)
    echo "Computer chose: $computer_choice"

    # Determine the winner
    determine_winner "$user_choice" "$computer_choice"
done

