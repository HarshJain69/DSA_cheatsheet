#include <stdio.h>
#include <string.h>

#define MAX_LEN 100

char str[MAX_LEN], pat[MAX_LEN], rep[MAX_LEN], ans[MAX_LEN * 2]; 

// Function to perform pattern matching and replacement
void string_replace() {
    int str_len = strlen(str);
    int pat_len = strlen(pat);
    int rep_len = strlen(rep);+
    int i, j, k = 0, m = 0, flag = 0;

    for (i = 0; i <= str_len - pat_len; i++) {
        int match = 1; 

        // Check if the pattern matches at the current position
        for (j = 0; j < pat_len; j++) {
            if (str[i + j] != pat[j]) {
                match = 0; 
                break;
            }
        }

        if (match) {
            flag = 1; 
            // Copy the replacement string to the result
            for (j = 0; j < rep_len; j++) {
                ans[k++] = rep[j];
            }
            i += pat_len - 1; 
        } else {
            ans[k++] = str[i];
        }
    }

    ans[k] = '\0'; 

    if (flag == 1) {
        printf("The resultant string is\n%s\n", ans);
    } else {
        printf("Pattern string NOT found\n");
    }
}

int main() {
    printf("Enter a main string\n");
    fgets(str, MAX_LEN, stdin);
    str[strcspn(str, "\n")] = 0; 

    printf("Enter a pattern string\n");
    fgets(pat, MAX_LEN, stdin);
    pat[strcspn(pat, "\n")] = 0; 

    printf("Enter a replace string\n");
    fgets(rep, MAX_LEN, stdin);
    rep[strcspn(rep, "\n")] = 0;

    string_replace();

    return 0;
}