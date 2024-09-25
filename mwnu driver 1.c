#include <stdio.h>

#define MAX_SIZE 100 // Adjust as needed

int a[MAX_SIZE], n, elem, i, pos;

void create() {
    printf("\nEnter the size of the array elements: ");
    scanf("%d", &n);
    printf("\nEnter the elements for the array:\n");
    for (i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }
}

void display() {
    printf("\nThe array elements are:\n");
    for (i = 0; i < n; i++) {
        printf("%d\t", a[i]);
    }
    printf("\n"); 
}

void insert() {
    printf("\nEnter the position for the new element: ");
    scanf("%d", &pos);
    printf("\nEnter the element to be inserted: ");
    scanf("%d", &elem);

    if (pos >= 0 && pos <= n) {
        for (i = n - 1; i >= pos; i--) {
            a[i + 1] = a[i];
        }
        a[pos] = elem;
        n++;
    } else {
        printf("Invalid position!\n");
    }
}

void delete() {
    printf("\nEnter the position of the element to be deleted: ");
    scanf("%d", &pos);

    if (pos >= 0 && pos < n) {
        elem = a[pos];
        for (i = pos; i < n - 1; i++) {
            a[i] = a[i + 1];
        }
        n--;
        printf("\nThe deleted element is = %d\n", elem);
    } else {
        printf("Invalid position!\n");
    }
}

int main() {
    int ch;

    do {
        printf("\n-------- Menu --------\n");
        printf("1. Create\n");
        printf("2. Display\n");
        printf("3. Insert\n");
        printf("4. Delete\n");
        printf("5. Exit\n");
        printf("------------------------\n");
        printf("Enter your choice: ");
        scanf("%d", &ch);

        switch (ch) {
            case 1: create(); break;
            case 2: display(); break;
            case 3: insert(); break;
            case 4: delete(); break;
            case 5: printf("Exiting...\n"); break;
            default: printf("\nInvalid choice!\n");
        }
    } while (ch != 5);

    return 0;
}