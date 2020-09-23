//
//  pinballController.h
//  uilab
//
//  Created by Pegg, Andrew on 1/21/20.
//  Copyright © 2020 Pegg, Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface pinballController : UIViewController
#define speedScale 1.0

#define gravity -.5
#define stopSpeed 1.0

@property (weak, nonatomic) IBOutlet UIImageView *wall1;
@property (nonatomic) float ballVelocityX;
@property (nonatomic) float ballVelocityY;
@property (weak, nonatomic) IBOutlet UIImageView *ball;
@property (weak, nonatomic) IBOutlet UIImageView *padel1;
@property (weak, nonatomic) IBOutlet UIImageView *padel2;
@property (weak, nonatomic) IBOutlet UIImageView *end1;
@property (weak, nonatomic) IBOutlet UIImageView *end2;
@property (weak, nonatomic) IBOutlet UIImageView *wall2;
@property (weak, nonatomic) IBOutlet UIButton *start;
@property (weak, nonatomic) IBOutlet UILabel *score1;
@property (weak, nonatomic) IBOutlet UILabel *score2;
@property (weak, nonatomic) IBOutlet UIButton *resume;
@property (weak, nonatomic) IBOutlet UILabel *Player2;
@property (weak, nonatomic) IBOutlet UILabel *Player1;

@property (nonatomic) float padelVelocityX;


@property (strong ,nonatomic) NSTimer* timer2;
@property (strong, nonatomic) NSTimer *gameTimer;

@end

NS_ASSUME_NONNULL_END
