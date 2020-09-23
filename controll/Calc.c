//
//  Calc.c
//  uilab
//
//  Created by Pegg, Andrew on 11/8/19.
//  Copyright © 2019 Pegg, Andrew. All rights reserved.
//

#include "Calc.h"
#include "math.h"

double calcit(double arg1, int mathOp, double arg2)
{
    double calcAnswer;
     calcAnswer = 0.0;
    switch(mathOp)
       {
           case PLUS:
              calcAnswer = arg1 + arg2;
               break;
           
           case DIVIDE:
               calcAnswer = arg1 / arg2;
               break;
           case MULTIPLY:
               calcAnswer = arg1 * arg2;
               break;
           case PERCENT:
               calcAnswer = (arg1/arg2)*100;
               break;
           case Subtraction:
               calcAnswer = arg1 - arg2;
               break;
           case Power:
               calcAnswer = powf(arg1, arg2);
               break;
           case power2:
               calcAnswer = powf(arg1,2);
               break;
           
               case -1:
               calcAnswer = arg1;
               
       }
    return calcAnswer;
}
double hyptoneuse (double side1, double side2) {
    side1 *= side1;
    side2 *= side2;
    double buffer = side1 + side2;
    double side3 = sqrt(buffer);
    return side3;
}


