//
//  ViewController.m
//  uilab
//
//  Created by Pegg, Andrew on 11/12/19.
//  Copyright © 2019 Pegg, Andrew. All rights reserved.
//

#import "PythoController.h"
#import "Calc.h"

@interface UIViewController ()

@end

@implementation  PythoController
@synthesize awnser, side2, side1;

- (void)viewDidLoad {
[side1 setText:@"0.0"];
[side2 setText:@"0.0"];
[awnser setText:@"0.0"];

    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)calculate:(id)sender{
    double calcawnser = hyptoneuse(side1.text.doubleValue, side2.text.doubleValue);
    [awnser setText:[NSString stringWithFormat:@"%lf",calcawnser]];
}







@end
