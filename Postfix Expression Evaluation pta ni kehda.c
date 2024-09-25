#include <stdio.h>
#include <ctype.h>  // For isdigit()
#include <math.h>   // For pow()

#define MAX_SIZE 20

int main() {
    double stack[MAX_SIZE];
    int top = -1; 
    char postfix[MAX_SIZE], symbol;
    double op1, op2, result;

    // Get postfix expression from user
    printf("Enter the postfix expression: ");
    fgets(postfix, MAX_SIZE, stdin); // Use fgets for input safety

    // Evaluate postfix expression
    for (int i = 0; postfix[i] != '\0' && postfix[i] != '\n'; i++) {
        symbol = postfix[i];

        if (isdigit(symbol)) {
            // Push operand onto the stack
            stack[++top] = symbol - '0'; // Convert char digit to integer
        } else if (isspace(symbol)) {
            continue; // Ignore whitespace
        } else {
            // Operator encountered, pop two operands and evaluate
            if (top < 1) {
                printf("Error: Invalid postfix expression!\n");
                return 1; // Indicate an error occurred
            }
            op2 = stack[top--];
            op1 = stack[top--];

            switch (symbol) {
                case '+': result = op1 + op2; break;
                case '-': result = op1 - op2; break;
                case '*': result = op1 * op2; break;
                case '/': 
                    if (op2 == 0) {
                        printf("Error: Division by zero!\n");
                        return 1; 
                    }
                    result = op1 / op2; 
                    break;
                case '^': result = pow(op1, op2); break;
                default: 
                    printf("Error: Invalid operator '%c'!\n", symbol);
                    return 1; 
            }

            stack[++top] = result; // Push result back onto the stack
        }
    }

    // Check if the expression was valid
    if (top != 0) {
        printf("Error: Invalid postfix expression!\n");
        return 1; 
    }

    printf("The result is: %f\n", stack[0]);
    return 0;
}