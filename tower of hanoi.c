#include <stdio.h>
#include <math.h>

void tower_of_hanoi(int n, char source, char temp, char destination) {
    if (n == 1) {
        printf("Move disk 1 from %c to %c\n", source, destination);
        return;
    }

    tower_of_hanoi(n - 1, source, destination, temp);
    printf("Move disk %d from %c to %c\n", n, source, destination);
    tower_of_hanoi(n - 1, temp, source, destination);
}

int main() {
    int n;

    printf("Enter the number of discs: ");
    scanf("%d", &n);

    tower_of_hanoi(n, 'A', 'B', 'C');
    printf("\nTotal number of moves: %d\n", (int)pow(2, n) - 1);

    return 0;
}