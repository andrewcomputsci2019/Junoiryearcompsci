//
//  GolfController.m
//  uilab
//
//  Created by Pegg, Andrew on 1/15/20.
//  Copyright © 2020 Pegg, Andrew. All rights reserved.
//

#import "GolfController.h"

@interface GolfController()

@end

@implementation GolfController

@synthesize ball,hole,image1,wall1,wall2,sandpit;

- (void)viewDidLoad {
  [super viewDidLoad];
  // changes hole image to be circular
  self.hole.layer.cornerRadius = .5*self.hole.layer.frame.size.height;
  self.hole.layer.masksToBounds = YES;
}
-(void)moveBall {
  // simulates friction by reducing velocity
  self.ballVelocityX = speedDamping * self.ballVelocityX;
  self.ballVelocityY = speedDamping * self.ballVelocityY;
   
  // this is the ball move
  self.ball.center = CGPointMake(self.ball.center.x + self.ballVelocityX, self.ball.center.y + self.ballVelocityY);
   
  // logic to calculate if ball and hole collide
  if (CGRectIntersectsRect(self.ball.frame, self.hole.frame)) {
    [self.gameTimer invalidate];
    [self.view setUserInteractionEnabled:YES];
    self.ball.center = CGPointMake(self.hole.center.x, self.hole.center.y);
    self.ball.alpha = 0.1;
      //put physcs code for ball
  }
    if (CGRectIntersectsRect(self.ball.frame, self.image1.frame))
        {
            self.ballVelocityY = self.ballVelocityY*-1;
                    }
    if (CGRectIntersectsRect(self.ball.frame, self.wall1.frame))
    {
        self.ballVelocityX = self.ballVelocityX*-1;
    }
   if (CGRectIntersectsRect(self.ball.frame, self.wall2.frame))
   {
       self.ballVelocityX = self.ballVelocityX*-1;
   }
  // if ball slows/stops turn off game timer and turn user interaction back on
  if(fabs(self.ballVelocityX) < stopSpeed && fabs(self.ballVelocityY) < stopSpeed) {
    [self.gameTimer invalidate];
    [self.view setUserInteractionEnabled:YES];
  }
    if (CGRectIntersectsRect(self.ball.frame, self.sandpit.frame))
           {
               self.ballVelocityX = sanddamping * self.ballVelocityX;
                self.ballVelocityY = sanddamping * self.ballVelocityY;
              
           }
}
 -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  NSLog(@"touches Began");
  UITouch *touch = [touches anyObject];
  // turn user interaction off as swipe begins
  [self.view setUserInteractionEnabled:NO];
   
  // store point a touch began
  self.firstPoint = [touch locationInView:self.view];
   
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  NSLog(@"touches Ended");
   
  UITouch *touch = [touches anyObject];
   
  // store point a touch end
  self.lastPoint = [touch locationInView:self.view];
   
  // logic to calculate swipevector as distance between touch began and touch end
  CGPoint swipeVector = CGPointMake(self.lastPoint.x - self.firstPoint.x, self.lastPoint.y - self.firstPoint.y);
   
  // velocity of ball based off of swipe
  self.ballVelocityX = speedScale * swipeVector.x;
  self.ballVelocityY = speedScale * swipeVector.y;
   
  // move ball occurs multiple times at this sampling rate, until friction causes ball to stop
  self.gameTimer = [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end



