#include <stdio.h>

void read_strings() {
    printf("Enter the main string (STR): ");
    fgets(str, 100, stdin); // Use fgets to safely read strings

    printf("Enter the pattern string (PAT): ");
    fgets(pat, 50, stdin);

    printf("Enter the replace string (REP): ");
    fgets(rep, 50, stdin);

    // Remove trailing newlines from fgets
    str[strcspn(str, "\n")] = 0;
    pat[strcspn(pat, "\n")] = 0;
    rep[strcspn(rep, "\n")] = 0;
}

int string_length(char *s) {
    int len = 0;
    while (s[len] != '\0') {
        len++;
    }
    return len;
}

void find_and_replace() {
    int str_len = string_length(str);
    int pat_len = string_length(pat);
    int rep_len = string_length(rep);

    c = m = k = 0;
    flag = 0;

    // Pattern matching and replacement logic
    while (c <= str_len - pat_len) {
        for (i = 0; i < pat_len; i++) {
            if (str[m + i] != pat[i]) {
                break;
            }
        }

        if (i == pat_len) { // Pattern found
            flag = 1;
            for (j = 0; j < rep_len; j++) {
                ans[k++] = rep[j];
            }
            c += pat_len;
            m += pat_len;
        } else {
            ans[k++] = str[m++];
            c++;
        }
    }

    ans[k] = '\0';

    if (flag == 0) {
        printf("Pattern not found in the main string.\n");
    } else {
        printf("Replaced string: %s\n", ans);
    }
}

int main() {
    read_strings();
    find_and_replace();

    return 0;
}