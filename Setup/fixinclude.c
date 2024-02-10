#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Very unsafe... but oh well.
char* StripFilename(char *s){
    char *ret_s = calloc(25, sizeof(char));
    unsigned char s_idx = 0;
    for(int i = 0; s[i]!='\0'; i++){
        switch(s[i]){
            case '/':
                free(ret_s);
                ret_s = calloc(25, sizeof(char));
                s_idx = 0;
                break;
            default:
                ret_s[s_idx++] = s[i];
        }
    }
    ret_s[s_idx] = '\0';
    return ret_s;
}

char *Dirconcat(char *s1, char *s2){
    char *ret_s = NULL;
    unsigned int lenT = 0, len1 = 0, len2 = 0;

    // Count lengths
    while(s1[len1++] != '\0');
    while(s2[len2++] != '\0');
    lenT = len1+len2-1;
    len1--;

    ret_s = calloc(lenT, sizeof(char));
    
    for(unsigned int i = 0; i < len1; i++) ret_s[i]=s1[i]; // Add first in
    for(unsigned int i = 0; i < len2; i++) ret_s[i+len1]=s2[i]; // Add second in
    ret_s[lenT-1] = '\0'; // Make sure its null termd

    return ret_s;
}

int main(int argc, char** argv){
    if(!argv[1]) return -1; // No src
    if(!argv[2]) return -2; // No dest
    if(!argv[3]) return -3; // No dirconv

    char *fname = StripFilename(argv[1]);
    char *newdest = Dirconcat(argv[2], fname);

    FILE *srcfp = fopen(argv[1], "r");
    FILE *destfp = fopen(newdest, "w");
    size_t bufsz = 100;
    int word_idx = 0;
    char *line_buf = calloc(bufsz,sizeof(char));
    char *word_buf = calloc(11,sizeof(char));

    while(fgets(line_buf,bufsz,srcfp)){
        unsigned char fl = 0;
        for(size_t i = 0; i < 11 && (line_buf[i] != '\0' || line_buf[i] != '\n'); i++){
            switch(line_buf[i]){ // I mean... it works
                case 'i':
                case 'n':
                case 'c':
                case 'l':
                case 'u':
                case 'd':
                case 'e':
                case 'b':
                case 'I':
                case 'N':
                case 'C':
                case 'L':
                case 'U':
                case 'D':
                case 'E':
                case 'B':
                    word_buf[word_idx] = line_buf[i];
                    word_idx++;
                    break;
                case ' ':
                    word_buf[word_idx] = '\0';
                    if(!strncmp(word_buf, "include", 11)){
                        fl = 1;
                        char *incname = StripFilename(line_buf);
                        fprintf(destfp, "include %s\\%s",argv[3],incname);
                    }else if(!strncmp(word_buf, "includelib", 11)){
                        fl = 1;
                        char *libname = StripFilename(line_buf);
                        fprintf(destfp, "includelib %s\\%s",argv[3],libname);
                    }
                    break;
                default:
                    break;
            }
        }
        switch(fl){
            case 0:
                fprintf(destfp, "%s", line_buf);
                break;
            case 1:
                break;
        }
        free(word_buf);
        word_idx = 0;
        word_buf = calloc(11,sizeof(char));
    }
    fclose(srcfp);
    fclose(destfp);
    return 0;
}
