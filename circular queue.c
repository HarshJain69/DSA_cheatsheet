#include <stdio.h>

#define MAX_SIZE 4

int front = 0, rear = -1, count = 0;
char queue[MAX_SIZE], item;

void insert() {
    if (count == MAX_SIZE) {
        printf("Queue Overflow! Cannot insert more elements.\n");
    } else {
        printf("Enter the item to insert: ");
        scanf(" %c", &item); // Note the space before %c to consume newline
        rear = (rear + 1) % MAX_SIZE;
        queue[rear] = item;
        count++;
        printf("Inserted: %c\n", item);
    }
}

void delete() {
    if (count == 0) {
        printf("Queue Underflow! Cannot delete from an empty queue.\n");
    } else {
        item = queue[front];
        printf("Deleted item is: %c\n", item);
        front = (front + 1) % MAX_SIZE;
        count--;
    }
}

void display() {
    if (count == 0) {
        printf("Queue is Empty\n");
    } else {
        printf("Contents of the Queue are:\n");
        int i, f = front;
        for (i = 0; i < count; i++) {
            printf("%c\t", queue[f]);
            f = (f + 1) % MAX_SIZE;
        }
        printf("\n");
    }
}

int main() {
    int choice;

    do {
        printf("\n1. Insert\n2. Delete\n3. Display\n4. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1: insert(); break;
            case 2: delete(); break;
            case 3: display(); break;
            case 4: printf("Exiting...\n"); break;
            default: printf("Invalid choice. Try again.\n");
        }
    } while (choice != 4);

    return 0;
}