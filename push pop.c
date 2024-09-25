#include <stdio.h>
#include <stdlib.h> // Use stdlib.h for exit()

#define MAX_SIZE 5 

int top = -1;
int stack[MAX_SIZE];

void push() {
    if (top == MAX_SIZE - 1) {
        printf("Stack Overflow! Cannot push more elements.\n");
    } else {
        int val;
        printf("Enter element to push: ");
        scanf("%d", &val);
        stack[++top] = val; // Increment top, then assign
    }
}

void pop() {
    if (top == -1) {
        printf("Stack Underflow! Cannot pop from an empty stack.\n");
    } else {
        printf("Deleted element is %d\n", stack[top--]); // Print and decrement top
    }
}

void display() {
    if (top == -1) {
        printf("Stack is empty.\n");
    } else {
        printf("Stack contents:\n");
        for (int i = top; i >= 0; --i) {
            printf("%d\n", stack[i]);
        }
    }
}

int main() {
    int choice;

    while (1) {
        printf("\n*** Stack Menu ***\n");
        printf("1. Push\n");
        printf("2. Pop\n");
        printf("3. Display\n");
        printf("4. Exit\n");
        printf("Enter your choice (1-4): ");
        scanf("%d", &choice);

        switch (choice) {
            case 1: push(); break;
            case 2: pop(); break;
            case 3: display(); break;
            case 4: exit(0); 
            default: printf("Invalid choice!\n");
        }
    }

    return 0; // This line is technically unreachable, but good practice
}