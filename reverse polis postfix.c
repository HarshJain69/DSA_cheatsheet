#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>

#define MAX_SIZE 20

double stack[MAX_SIZE];
int top = -1;

// Function to perform arithmetic operations
double compute(char symbol, double op1, double op2) {
    switch(symbol) {
        case '+': return op1 + op2;
        case '-': return op1 - op2;
        case '*': return op1 * op2;
        case '/': 
            if (op2 == 0) {
                printf("Error: Division by zero!\n");
                exit(1); // Terminate the program on division by zero
            }
            return op1 / op2;
        case '^': return pow(op1, op2);
        default: 
            printf("Error: Invalid operator!\n");
            exit(1); // Terminate on invalid operator
    }
}

int main() {
    char postfix[MAX_SIZE], symbol;
    double result;
    int i;

    printf("Enter the postfix expression: ");
    fgets(postfix, MAX_SIZE, stdin); // Use fgets for safer input

    // Evaluate the postfix expression
    for (i = 0; postfix[i] != '\0' && postfix[i] != '\n'; i++) {
        symbol = postfix[i];

        if (isdigit(symbol)) {
            // Push operand onto the stack
            stack[++top] = symbol - '0'; 
        } else if (isspace(symbol)) {
            // Ignore whitespace
            continue;
        } else {
            // Operator encountered
            if (top < 1) {
                printf("Error: Invalid postfix expression!\n");
                exit(1); // Terminate on invalid expression
            }

            double op2 = stack[top--];
            double op1 = stack[top--];
            result = compute(symbol, op1, op2);
            stack[++top] = result;
        }
    }

    if (top != 0) {
        printf("Error: Invalid postfix expression!\n");
        exit(1); 
    }

    printf("The result is: %f\n", stack[top]);

    return 0;
}