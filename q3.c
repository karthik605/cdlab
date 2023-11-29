#include <stdio.h>
#include <ctype.h>
void main()
{
    char content[1000]="";
    FILE* ptr;
    char ch;
    int lines=0,digits=0,vowels=0,con=0,words=0;
    ptr = fopen("sample.txt", "r");

    do {
        ch = fgetc(ptr);
        //printf("%c", ch);
        if(ch=='\n')
        {
            lines++;
        }
        if(ch=='0' ||ch=='1' ||ch=='2' ||ch=='3' ||ch=='4' ||ch=='5' ||ch=='6' ||ch=='7' ||ch=='8' ||ch=='9')
        {
            digits++;
        }
        if(ch=='a' ||ch=='e' ||ch=='i' ||ch=='o' ||ch=='u' ||ch=='A' ||ch=='E' ||ch=='I' ||ch=='O' ||ch=='U')
        {
            vowels++;
        }
        else
        {
            if(isalpha(ch))
            {
                con++;
            }
        }
    } while (ch != EOF);

    fclose(ptr);
    printf("%s",content);
    //printf("Number of words:%d\n",words);
    printf("Number of lines:%d\n",lines+1);
    printf("Number of digits:%d\n",digits);
    printf("Number of vowels:%d\n",vowels);
    printf("Number of consonats:%d\n",con);
}
