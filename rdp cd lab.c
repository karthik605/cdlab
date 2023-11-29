#include <stdio.h>
#include <string.h>

int S();
int match(char);

char *ip;
char string[50];

int main() {
    printf("Enter the string: ");
    scanf("%s", string);
    ip = string;
    printf("\n\nInput\tAction\n--------------------------------\n");

    if (S() && *ip == '\0') {
        printf("\n--------------------------------\n");
        printf("String is successfully parsed\n");
    } else {
        printf("\n--------------------------------\n");
        printf("Error in parsing string\n");
    }
}

int S() {
    if (*ip == 'a') {
        printf("%s\tS -> aSa\n", ip);
        ip++;
        if (S()) {
            if (match('a')) {
                return 1;
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    } else if (*ip == 'b') {
        printf("%s\tS -> bSb\n", ip);
        ip++;
        if (S()) {
            if (match('b')) {
                return 1;
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    } else if (*ip == 'c') {
        printf("%s\tS -> c\n", ip);
        ip++;
        return 1;
    } else {
        return 0;
    }
}

int match(char expected) {
    if (*ip == expected) {
        printf("%s\tMatched %c\n", ip, expected);
        ip++;
        return 1;
    } else {
        printf("%s\tError: Expected %c\n", ip, expected);
        return 0;
    }
}
