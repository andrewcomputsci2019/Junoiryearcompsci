//
//  token.c
//  uilab
//
//  Created by Pegg, Andrew on 12/12/19.
//  Copyright © 2019 Pegg, Andrew. All rights reserved.
//

#include "token.h"
#include "Calc.h"
#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>

str P;// sturct renaming
sor Storage;//also renaming
int i;

char *tokenreverse(char* str)
{
    memset(P.reversepharse,'\0',sizeof(P.reversepharse));
    Storage.buffer=str;
    strcat(Storage.pharse,Storage.buffer);
    strcat(Storage.pharse," ");//addss whole phrase to the struct
    const char *space=" ";
    P.tok =strtok(str,space);
    while(P.tok !=NULL)
    {
         
        strcat(Storage.word,P.tok);//adds words to struct
        strcat(Storage.word, " ");
        P.temp=strrev(P.tok);//strrev is my funnction not found in c
        strcat(Storage.reversedwords,P.temp);//adds reverse words thing
        strcat(Storage.reversedwords," ");// adds space
        printf("%s", P.temp);
        strcat(P.reversepharse,P.temp);
        strcat(P.reversepharse," ");
        P.tok=strtok(NULL,space);
        i++;
    }
 
    str=P.reversepharse;
    return str;
    
}









PHRASE pM;
char pigBuffer[BUFFER_SIZE];
void cleancopy(char *dest, const char *source, long buffsize);
void tokenizer(void);
void reverser(void);
void pigger(void);
void translator(const char* input, long length);
char *piglatin(const char* input, long length);
char *getreversed(void);
void settokenizer(char *tokenizer);
char *getpiglatin(void);

void translator(const char* input, long length){
    cleancopy(pM.original, input, LINE_BUFFER_SIZE);
    printf( "original phrase:  %s\n", pM.original );
    tokenizer();
    pigger();
}
void settokenizer(char *tokenizer)
{
    long length = strlen(tokenizer)+1;
 
    if (pM.tokenizer)
        free(pM.tokenizer);
    pM.tokenizer = malloc(length);
    strncpy(pM.tokenizer, tokenizer, length);
}

char *getreversed()
{
    
    return pM.reverse;
}
char *getpiglatin()
{
    return pM.piglatin;
}
void tokenizer(){
    if (!strlen(pM.tokenizer))
        settokenizer(" ");
    long i = 0;
    char *token = strtok(pM.original, pM.tokenizer);
    while( token != NULL )  {                                // NULL mean end of phrase
        printf( "word after tokenizing:  %s\n", token );
        // assignment to struct
        cleancopy(pM.words[i].word, token, BUFFER_SIZE);
        printf( "word in structure %li:  %s\n", i, pM.words[i].word);
        // iterate
        i++;
        token = strtok(NULL, pM.tokenizer);    // remaining words, NULL means same str
    }
    pM.wordCount = i;
}
void reverser() {
    for (long i = 0; i < pM.wordCount; i++)
    {
        
        // reverse one word and copy
       /* cleancopy( pM.words[i].reversed,
        reverse(pM.words[i].word,(long)strlen(pM.words[i].word),x),
        BUFFER_SIZE);
        printf( "word in structure reversed %li:  %s\n", i, pM.words[i].reversed);*/
        // concat word to resersed result
        if (i == 0) // first word is copy
        {
            cleancopy(pM.reverse, pM.words[i].reversed, LINE_BUFFER_SIZE);
        } else {    // remaining words are concatenation
            strcat( pM.reverse, pM.tokenizer);
            strcat( pM.reverse, pM.words[i].reversed );
        }
        printf( "growing phrase in structure reversed %li:  %s\n", i, pM.reverse);
    }
}
void pigger() {
    for (long i = 0; i < pM.wordCount; i++)
    {
        // reverse one word and copy to structure
        cleancopy( pM.words[i].pigged,
               piglatin(pM.words[i].word, (long)strlen(pM.words[i].word)),
               BUFFER_SIZE);
        printf( "word in structure pigged %li:  %s\n", i, pM.words[i].pigged);
        
        if (i == 0)
        {
            cleancopy(pM.piglatin, pM.words[i].pigged, LINE_BUFFER_SIZE);
        } else {    // remaining words are concatenation
            strcat( pM.piglatin, pM.tokenizer);
            strcat( pM.piglatin, pM.words[i].pigged );
        }
        printf( "growing phrase in structure in piglatin %li:  %s\n", i, pM.piglatin);
    }
}
int isvowel(int ch)
{
  int c = toupper(ch);
  return (c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U');
}
int isvowelwithY(int ch)
{
    int c = toupper(ch);
    return (isvowel(ch) || c == 'Y');
}

void igpay(char *dest, const char *source, long length) {
    char temp[BUFFER_SIZE];
    memset(temp, '\0', sizeof(temp));
    
    const char *beginPtr = source;
    long i = 0;
    while (i < length && !isvowelwithY(*beginPtr)) {
        temp[i] = *beginPtr;
        beginPtr++;
        i++;
    }
    
    cleancopy(dest, beginPtr, BUFFER_SIZE);
    strcat( dest, temp);
    strcat( dest, "ay" );
}
char *piglatin(const char* input, long length) {
   
    cleancopy(pigBuffer, input, BUFFER_SIZE);
   
    const char *beginPtr = pigBuffer;
    if (isvowel(*beginPtr)) {
        strcat( pigBuffer, "ya" );
    } else if (isalpha(*beginPtr)) {
        igpay(pigBuffer, input, length);
    } else {
    }
    
    return pigBuffer;
}
void cleancopy(char *dest, const char *source, long buffsize)
{
  
    memset(dest, '\0', buffsize);
   
    long length = strlen(source);
    if (length < buffsize)
        strncpy(dest, source, length);
    else
        strncpy(dest, source, buffsize);
}


char *shortit(char* input)
{
    
    //logic check for vovles and cerrtian words ie  (for and to you)
    char hold[1500];
    memset(hold,'\0',sizeof(hold));
    char final[1501];
    memset(final,'\0',sizeof(final));
    char* temptok;
    char* temp;
    const char* space =" ";
    temptok =strtok(input,space);
    
    
    while(temptok != NULL)
    {
                temp = temptok;
                strcat(hold,temp);
                strcat(hold," ");
                temptok =strtok(NULL,space);
        
        
    }
    int x;
   
    int j;
    for(x=0; x<=sizeof(hold); x++)
    {
        j = strncmp(&hold[x],"a",1);
        if(j==0)
        {
            memset(hold+x,'.',1);
        }
    }
        for(x=0; x<=sizeof(hold); x++)
        {
            j=strncmp(&hold[x],"e",1);
            if(j==0)
            {
                memset(hold+x,'.',1);
            }
        }
        for(x=0; x<=sizeof(hold); x++)
        {
            j=strncmp(&hold[x],"i",1);
            if(j==0)
            {
                memset(hold +x, '.',1);
            }
        }
        for(x=0; x<=sizeof(hold); x++)
        {
            j=strncmp(&hold[x],"o",1);
            if(j==0)
            {
                memset(hold + x, '.', 1);
            }
        }
         for(x=0; x<=sizeof(hold); x++)
         {
             j=strncmp(&hold[x],"u",1);
             if(j==0)
             {
                 memset(hold + x, '.', 1);
             }
         }
       
        
        
    
   const char* per=".";
          temptok =strtok(hold,per);
    
    
    while(temptok != NULL)
      {
                  temp = temptok;
                  strcat(final,temp);
                  temptok =strtok(NULL,per);
      }
    
    
    input= final;
    
    
    
    
    
    return input;
}
char *poloycheck(char* orginal, char* second)
{
    long l;
    char* pass;
    int j;
    
    char* temp;
    char hold[15000];
    char hold2[15000];
    memset(hold2,'\0',sizeof(hold2));
    memset(hold,'\0',sizeof(hold));
    
    const char* space= " ";
    temp=strtok(orginal,space);
     while(temp != NULL)
     {
         
         strcat(hold,temp);
         temp=strtok(NULL,space);
         
     }
    
    temp=strtok(second,space);
    while(temp!=NULL)
    {
        temp=strrev(temp);
        strcat(hold2,temp);
       
        temp =strtok(NULL,space);
    }
    
    
l = strlen(hold);
  j =   strncmp(hold,hold2,l);
    if(j==0)
    {
        pass="yes";
    }
    else
    {
        pass="no";
    }
    return pass;
}
