//
//  funfact.c
//  uilab
//
//  Created by Pegg, Andrew on 12/10/19.
//  Copyright © 2019 Pegg, Andrew. All rights reserved.
//

#include "factheader.h"
#include <time.h>
#include <stdlib.h>
ff T;
char* funfact()
{
  srand((unsigned int)time(NULL)*rand());
  int num = rand()%10+1;
  switch (num) {
    case 1:   T.fact[9999] = "Dolphins only sleep with half their brains awake.";  break;
    case 2:   T.fact[9999] = "Canadians say sorry so much that a law was passed in 2009 declaring that an apology can't be used as evidence of admission to guilt.";  break;
    case 3:   T.fact[9999] = "The only letter that doesn't appear on the periodic table is J.";  break;
    case 4:   T.fact[9999] = "Back when dinosaurs existed, there used to be volcanoes that were erupting on the moon.";  break;
    case 5:   T.fact[9999] = "Nintendo trademarked the phrase 'It's on like Donkey Kong' in 2010.";  break;
    case 6:   T.fact[9999] = "A single strand of spaghetti is called a 'spaghetto'.";  break;
    case 7:   T.fact[9999] = "At birth, a baby panda is smaller than a mouse.";  break;
    case 8:   T.fact[9999] = "Iceland does not have a railway system.";  break;
    case 9:   T.fact[9999] = "The largest Japanese population outside of Japan stands at 1.6 million people who live in Brazil.";  break;
    case 10:  T.fact[9999] = "Violin bows are commonly made from horse hair.";  break;
    default:  break;
  }
  //printf("%s\n",T.fact[9999]);
  return T.fact[9999];
}
