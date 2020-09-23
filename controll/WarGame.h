//
//  WarGame.h
//  uilab
//
//  Created by Pegg, Andrew on 2/5/20.
//  Copyright © 2020 Pegg, Andrew. All rights reserved.
//

#ifndef WarGame_h
#define WarGame_h

// cards
#define SUIT_CNT 4
#define SYMBOL_CNT 13
#define DECK_CNT 52
static char *colorStrings[] = {"Red", "Black"};
static char *suitStrings[] = {"Clubs", "Diamonds", "Hearts", "Spades"};
static char *symbolStrings[] = {"Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"};
typedef enum {Red, Black} COLOR_TYPE;
typedef enum {Clubs, Diamonds, Hearts, Spades} SUIT_TYPE;
typedef enum {Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King} SYMBOL_TYPE;
typedef struct card {
    int cID;                        // unique ID of card (1 to 52 on conventional deck)
    int value;                      // 1, 2, ... 13, used to determine rank in games
    COLOR_TYPE color;               // Red or Black
    SUIT_TYPE suit;                 // Clubs, Diamonds, Hearts, Spaces
    SYMBOL_TYPE symbol;             // Ace, Two, ... King
    char cImage[10];
} CARD;
CARD * createdeck(void);
void shuffledeck(CARD *c);
void dealdeck(CARD *c);
void freedeck(CARD *c);
void pointertest(void);
void structuretest(void);


#endif /* WarGame_h */
