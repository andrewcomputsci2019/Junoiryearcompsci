//
//  pinballController.m
//  uilab
//
//  Created by Pegg, Andrew on 1/21/20.
//  Copyright © 2020 Pegg, Andrew. All rights reserved.
//

#import "pinballController.h"

@interface pinballController ()

@end

@implementation pinballController
@synthesize ball,padel1,padel2,wall1,wall2,start,end1,end2,score1,score2,resume;
int scor_e1;
int scor_e2;
double numberredritc;
int numberredritc2;

- (void)viewDidLoad {
   
    [super viewDidLoad];
    [self addGestureRecognizers];
    self.resume.alpha=0;
    // Do any additional setup after loading the view.
    self.padel1.userInteractionEnabled=YES;
    self.padel2.userInteractionEnabled=YES;
    self.Player1.alpha=0.0;
    self.Player2.alpha=0.0;
}

-(IBAction)dothing:(id)sender
{
   
    [self.navigationController setNavigationBarHidden:YES];
    
    srand((unsigned int)time(NULL));
    self.ballVelocityX=rand()%1-.1;
    self.ballVelocityX=self.ballVelocityX/100;
    self.ballVelocityY=1;
    self.ballVelocityY=self.ballVelocityY/20;
    self.gameTimer = [NSTimer scheduledTimerWithTimeInterval:.00001 target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
    self.start.alpha=0;
    [self moveBall];
    self.timer2 = [NSTimer scheduledTimerWithTimeInterval:.00001 target:self selector:@selector(movepadel) userInfo:nil repeats:YES];
    
}

-(void)moveBall {
 
  
  // this is the ball move
  self.ball.center = CGPointMake(self.ball.center.x + self.ballVelocityX, self.ball.center.y + self.ballVelocityY);
    
  
 
 
   
    
   
  // if ball slows/stops turn off game timer and turn user interaction back on

    if(CGRectIntersectsRect(self.ball.frame, self.padel1.frame))
    {
       
        self.ballVelocityY=self.ballVelocityY*-1;
       self.ballVelocityY=self.ballVelocityY*1.01;
        numberredritc = (ball.center.x - padel1.center.x);
       numberredritc = numberredritc/999.0;
        self.ballVelocityX=self.ballVelocityX+numberredritc;
        
    }
    if(CGRectIntersectsRect(self.ball.frame, self.padel2.frame))
    {
        
        numberredritc = (ball.center.x-padel2.center.x);
        numberredritc = numberredritc/999.0;
        self.ballVelocityY=self.ballVelocityY*-1;
        self.ballVelocityY=self.ballVelocityY*1.01;
        self.ballVelocityX=self.ballVelocityX+numberredritc;
    }
    if(CGRectIntersectsRect(self.ball.frame, self.wall1.frame))
       {
           self.ballVelocityX=self.ballVelocityX*-1;
           
       }
    if(CGRectIntersectsRect(self.ball.frame, self.wall2.frame))
       {
           self.ballVelocityX=self.ballVelocityX*-1;
           
       }
    if(CGRectIntersectsRect(self.ball.frame, self.end1.frame))
    {
        
      [self.gameTimer invalidate];
      [self.view setUserInteractionEnabled:YES];
      self.ball.center=CGPointMake(164+19.5,314+19.5);
        self.start.alpha=1.0;
        scor_e1=score1.text.doubleValue;
        scor_e1++;
        [score1 setText:[NSString stringWithFormat:@"%d",scor_e1]];
        if(scor_e1==5)
                 {
                    self.start.alpha=0.0;
                    self.Player1.alpha=1;
                   self.padel1.userInteractionEnabled=NO;
                   self.padel2.userInteractionEnabled=NO;
                 }
        [self.navigationController setNavigationBarHidden:NO];
       [self.timer2 invalidate];
      
    }
      if(CGRectIntersectsRect(self.ball.frame, self.end2.frame))
      {
          [self.gameTimer invalidate];
          [self.view setUserInteractionEnabled:YES];
          self.ball.center=CGPointMake(164+19.5,314+19.5);
          self.start.alpha=1.0;
          scor_e2=score2.text.doubleValue;
          scor_e2++;
          [score2 setText:[NSString stringWithFormat:@"%d",scor_e2]];
          if(scor_e2==5)
          {
              self.start.alpha=0.0;
              self.Player2.alpha=1;
            self.padel1.userInteractionEnabled=NO;
            self.padel2.userInteractionEnabled=NO;
          }
          [self.navigationController setNavigationBarHidden:NO];
          [self.timer2 invalidate];
      }
    
}
-(IBAction)quit:(id)sender
{
    [self.gameTimer invalidate];
    [self.timer2 invalidate];
    [self.navigationController setNavigationBarHidden:NO];
    self.resume.alpha=1;
    self.padel1.userInteractionEnabled=NO;
    self.padel2.userInteractionEnabled=NO;
}
-(IBAction)resume:(id)sender
{
    self.padel1.userInteractionEnabled=YES;
    self.padel2.userInteractionEnabled=YES;
    self.gameTimer = [NSTimer scheduledTimerWithTimeInterval:.00001 target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
     self.timer2 = [NSTimer scheduledTimerWithTimeInterval:.00001 target:self selector:@selector(movepadel) userInfo:nil repeats:YES];
    [self.navigationController setNavigationBarHidden:YES];
    self.resume.alpha=0;
}

-(void)movepadel
{
    //self.padel1.center = CGPointMake(self.ball.center.x + self.padelVelocityX,610+7);
    //self.padel2.center = CGPointMake(self.ball.center.x + self.padelVelocityX,82+7);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void) addGestureRecognizers
{
    UIPanGestureRecognizer *panRecognizer =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panRecognized:)];
     UIPanGestureRecognizer *panRecognizer2 =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panRecognized2:)];
    [self.padel1 addGestureRecognizer:panRecognizer];
    [self.padel2 addGestureRecognizer:panRecognizer2];

    
}
- (void) panRecognized:(UIPanGestureRecognizer*) recognizer
{
    UIView *pannedView= recognizer.view;
    CGPoint translation = [recognizer translationInView:pannedView.superview];
    pannedView.center=CGPointMake(pannedView.center.x +translation.x, pannedView.center.y);
    [recognizer setTranslation:CGPointZero inView:(pannedView.superview)];
}
- (void) panRecognized2:(UIPanGestureRecognizer*) recognizer
{
    UIView *pannedView= recognizer.view;
    CGPoint translation = [recognizer translationInView:pannedView.superview];
    pannedView.center=CGPointMake(pannedView.center.x +translation.x, pannedView.center.y);
    [recognizer setTranslation:CGPointZero inView:(pannedView.superview)];
}


@end

