//
//  GolfController.h
//  uilab
//
//  Created by Pegg, Andrew on 1/15/20.
//  Copyright © 2020 Pegg, Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#define speedScale .4
#define speedDamping .9  // friction rate
#define stopSpeed 5.0
NS_ASSUME_NONNULL_BEGIN
#define sanddamping .25


@interface GolfController : UIViewController



@property (weak, nonatomic) IBOutlet UIImageView *ball;
@property (weak, nonatomic) IBOutlet UIImageView *hole;
@property (nonatomic) CGPoint firstPoint;
@property (nonatomic) CGPoint lastPoint;
@property (nonatomic) float ballVelocityX;
@property (nonatomic) float ballVelocityY;
@property (strong, nonatomic) NSTimer *gameTimer;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *wall1;
@property (weak, nonatomic) IBOutlet UIImageView *wall2;
@property (weak, nonatomic) IBOutlet UIImageView *sandpit;

@end

NS_ASSUME_NONNULL_END
