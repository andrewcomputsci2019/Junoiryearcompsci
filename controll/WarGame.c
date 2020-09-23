//
//  WarGame.c
//  uilab
//
//  Created by Pegg, Andrew on 2/5/20.
//  Copyright © 2020 Pegg, Andrew. All rights reserved.
//
#include "WarGame.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>
CARD * createdeck()
{
    CARD *card;

    /* Initial memory allocation */
    card = (CARD *)malloc(sizeof(CARD) * DECK_CNT);         // Intro to memory allocatin
    
    for(int suit = Clubs; suit <= Spades; suit++) {         // Clubs, Diamonds, Hearts, Spades
        char cardSuffix = tolower(*suitStrings[suit]);      // make cardSuffix as 1st letter of suit
        
        for(int symbol = Ace; symbol <= King; symbol++ ) {  // Ace, Two, Three ..., Queen, King
            int index = (suit * SYMBOL_CNT) + symbol;       // index equals: 0...12, 13...25, 26...38, 39...51
            card[index].cID = index + 1;
            card[index].value = symbol + 1;
            card[index].suit = suit;
            card[index].symbol = symbol;
            
            // Is card Red or Black
            switch (suit) {
                case Hearts:
                case Diamonds:
                    card[index].color = Red;
                    break;
                default:
                    card[index].color = Black;
            }
            
            // add cImage  to correspond to Assets.xcassets
            sprintf( card[index].cImage,"%d%c", (symbol + 1), cardSuffix );
        }
    }
    return card;
}

/**
* Shuffles deck of cards
*
* param  CARD *
* return void
*/
void shuffledeck(CARD *card)
{

    // Shuffle cards
    CARD swap[1];
    for (int i = 0; i < DECK_CNT; i++) {        // traverse through deck one time
        int r;
        while ( (r = rand() % DECK_CNT) == i);  // repeat if r = i, don't swap with itself
        
        // swap logic
        swap[0] = card[i];        // current saved to swap
        card[i] = card[r];        // current changed with random
        card[r] = swap[0];        // random changed with swap
    }
}
 
/**
* Console test program to deal deck of cards and display to console
*
* param  CARD *
* return void
*/
void dealdeck(CARD *card)
{
    // Deal deck to two players
    CARD player1[DECK_CNT/2];               // half deck array for each player
    CARD player2[DECK_CNT/2];
    for (int i = 0, index = 0; i < DECK_CNT; i++)    // deal half deck to each
    {
        if ( (i % 2) == 0 ) {
            player1[index] = card[i];       // card to player1
            printf("%5s %5s of %-8s %d %d %s",
                   colorStrings[player1[index].color],
                   symbolStrings[player1[index].symbol], suitStrings[player1[index].suit],
                   player1[index].cID, player1[index].value, player1[index].cImage);
            
        } else {
            player2[index] = card[i];     // card to player2
            printf("\t\t\t");
            printf("%5s %5s of %-8s %d %d %s",
                   colorStrings[player2[index].color],
                   symbolStrings[player2[index].symbol], suitStrings[player2[index].suit],
                   player2[index].cID, player2[index].value, player2[index].cImage);
            printf("\n");
            index++;

        }

    }
    
}

/**
* Removes allocated deck (CARD *) from heap
*
* param  CARD *
* return void
*/
void freedeck(CARD *card)
{
    if (card != NULL)
        free(card);
}
