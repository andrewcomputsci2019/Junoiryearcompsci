//
//  Temp.m
//  uilab
//
//  Created by Pegg, Andrew on 11/13/19.
//  Copyright © 2019 Pegg, Andrew. All rights reserved.
//

#import "Temp.h"

@interface _Temp ()

@end

@implementation _Temp
@synthesize FText,FtoC,CtoF,FtoF;

- (void)viewDidLoad {
    [FtoC setText:@"0.0"];
    [FtoF setText:@"0.0"];
    [CtoF setText:@"0.0"];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)calculate:(id)sender{
    double calcftoc= (FText.text.doubleValue-32)*5/9;
    [FtoC setText:[NSString stringWithFormat:@"%lf",calcftoc]];
    double calcftof = FText.text.doubleValue-32;
    if(calcftof<0)
       {
           calcftof = calcftof*-1;
           [FtoF setText:[NSString stringWithFormat:@"%lf",calcftof]];
       }
        else
           {
               [FtoF setText:[NSString stringWithFormat:@"%lf",calcftof]];
       }
    [FtoF setText:[NSString stringWithFormat:@"%lf",calcftof]];
    double calcCtoF = calcftoc;
    [CtoF setText:[NSString stringWithFormat:@"%lf",calcCtoF]];
    [self.FText resignFirstResponder];

}
     


@end
