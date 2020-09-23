//
//  Revlogic.c
//  uilab
//
//  Created by Pegg, Andrew on 12/4/19.
//  Copyright © 2019 Pegg, Andrew. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include "Calc.h"


char *strrev(char *str)
{
    if (!str || ! *str)
        return str;

    int i = (int)strlen(str) - 1, j = 0;

    char ch;
    while (i > j)
    {
        ch = str[i];
        str[i] = str[j];
        str[j] = ch;
        i--;
        j++;
    }
    return str;
}

char *reverseString(char* str)
{
    int l, i;
    char *begin_ptr, *end_ptr, ch;
  

    l = (int)strlen(str);
  
  
    begin_ptr = str;
    end_ptr = str;
  
    
    for (i = 0; i < l - 1; i++)

        end_ptr++;
  
   
    for (i = 0; i < l / 2; i++) {
  
  
        ch = *end_ptr;
        *end_ptr = *begin_ptr;
        *begin_ptr = ch;
  
    
        begin_ptr++;
        end_ptr--;
        }
    return str;

}

void swap(char* x, char* y)
{
    char temp = *x;
    *x = *y;
    *y = temp;
}

void reverse(char str[], int l, int h)
{
    if (l < h)
    {
        swap(&str[l], &str[h]);
        reverse(str, l + 1, h - 1);
    }
}


