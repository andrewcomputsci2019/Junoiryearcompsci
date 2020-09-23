//
//  Rectangle.m
//  uilab
//
//  Created by Pegg, Andrew on 11/13/19.
//  Copyright © 2019 Pegg, Andrew. All rights reserved.
//

#import "Rectangle.h"
//#import "Calc.h"

@interface Rectangle ()

@end
//@synthesize side1,side2,area,permiter;
@implementation Rectangle
@synthesize side1,side2,area,permiter;

- (void)viewDidLoad {
    [area setText:@"0.0"];
    [permiter setText:@"0.0"];
   
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)calculate:(id)sender{
    double calcarea= side1.text.doubleValue*side2.text.doubleValue;
    [area setText:[NSString stringWithFormat:@"%lf",calcarea]];
    double calcperm = (side1.text.doubleValue+side2.text.doubleValue)*2;
    [permiter setText:[NSString stringWithFormat:@"%lf",calcperm]];
    [self.side1 resignFirstResponder];
    [self.side2 resignFirstResponder];
}



@end
