#!/bin/bash

# Función greet que toma un argumento
greet() {
    local name="$1"
    echo "Hello, $name!"
}

# Función add que toma dos números y suma
add() {
    local num1="$1"
    local num2="$2"
    local sum=$((num1 + num2))
    echo "The sum of $num1 and $num2 is: $sum"
}

# Llamando a las funciones
echo "--- Testing greet function ---"
greet "Leandro"

echo "--- Testing add function ---"
add 15 27
