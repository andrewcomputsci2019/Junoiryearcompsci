//
//  Calc.h
//  uilab
//
//  Created by Pegg, Andrew on 11/8/19.
//  Copyright © 2019 Pegg, Andrew. All rights reserved.
//

#ifndef Calc_h
#define Calc_h

#include <stdio.h>
#define PLUS 0

#define MULTIPLY 1
#define DIVIDE 2
#define PERCENT 3
#define Subtraction 4
#define Power 5
#define power2 6

double calcit(double arg1, int mathOp, double arg2);
double hyptoneuse (double side1, double side2);
char *strrev(char *str);
char *reverseString(char* str);
void reverse(char str[], int l, int h);


#endif /* Calc_h */
