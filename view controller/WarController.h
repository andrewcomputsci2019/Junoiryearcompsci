//
//  WarController.h
//  uilab
//
//  Created by Pegg, Andrew on 2/5/20.
//  Copyright © 2020 Pegg, Andrew. All rights reserved.
//
#import "WarGame.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface WarController : UIViewController
{
    CARD *cards;
}
#define animSpeed .1
@property (weak, nonatomic) IBOutlet UIImageView *HoldingDeck2;
@property (weak, nonatomic) IBOutlet UIImageView *Player1Deck;
@property (weak, nonatomic) IBOutlet UIButton *quitbutton;
@property (weak, nonatomic) IBOutlet UIImageView *Player1Battle;
@property (weak, nonatomic) IBOutlet UIImageView *Player2Battle;
@property (weak, nonatomic) IBOutlet UILabel *automodewaring;
@property (weak, nonatomic) IBOutlet UIImageView *arrowpoint;
@property (weak, nonatomic) IBOutlet UILabel *LoseLabel;
@property (weak, nonatomic) IBOutlet UILabel *holdeck2counter;
@property (weak, nonatomic) IBOutlet UIButton *action;
@property (weak, nonatomic) IBOutlet UILabel *WinLabel;
@property (weak, nonatomic) IBOutlet UIImageView *Player2Deck;
@property (weak, nonatomic) IBOutlet UIImageView *HoldingDeck;
@property (weak, nonatomic) IBOutlet UILabel *cardcounterplayer;
@property (weak, nonatomic) IBOutlet UILabel *cardcounterai;
@property (weak, nonatomic) IBOutlet UILabel *hldingdeck1counter;
@property (nonatomic) CGPoint firstPoint;
@property (nonatomic) CGPoint lastPoint;
@property (strong, nonatomic) NSTimer *cardTimer;
@property (strong, nonatomic) NSTimer *RoundTimer;
@end

NS_ASSUME_NONNULL_END
