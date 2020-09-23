//
//  token.h
//  uilab
//
//  Created by Pegg, Andrew on 12/12/19.
//  Copyright © 2019 Pegg, Andrew. All rights reserved.
//

#ifndef token_h
#define token_h

#include <stdio.h>
#define BUFFER_SIZE 1024
#define LINE_BUFFER_SIZE 104
#define WORDS_TO_LINE_SIZE 2048

char *piglatin(const char* input, long length);
struct
{
    char reversepharse[10000];
    char *temp;
    char *tok;
    char pigit[10000];
    char shortit[10000];
 

    
    
}typedef str;//struct with typedef


struct
{
    char word[10000];
    char reversedwords[10000];
    char pharse[10000];
    char *buffer;
}typedef sor;//struct with typedef


char *tokenreverse(char* str);//prototype

typedef struct words {
    char word[BUFFER_SIZE];
    char reversed[BUFFER_SIZE];
    char pigged[BUFFER_SIZE];
    char shorted[BUFFER_SIZE];
} WORDS;
typedef struct phrases {
    char original[LINE_BUFFER_SIZE];
    char piglatin[LINE_BUFFER_SIZE];
    char shorthand[LINE_BUFFER_SIZE];
    char reverse[LINE_BUFFER_SIZE];
    WORDS words[WORDS_TO_LINE_SIZE];    // many copies of the Word structure (1 to many)
    long wordCount;     // count of words in phrase
    char *tokenizer;    // tokenization seperator
} PHRASE;

char *shortit(char* input);
char *poloycheck(char* orginal, char* second);
#endif /* token_h*/
