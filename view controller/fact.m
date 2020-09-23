//
//  fact.m
//  uilab
//
//  Created by Pegg, Andrew on 12/10/19.
//  Copyright © 2019 Pegg, Andrew. All rights reserved.
//

#import "fact.h"
#import "factheader.h"
ff D;

@interface fact ()

@end

@implementation fact
@synthesize outputFact;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)get:(id)sender
{
    D.fact[9999] = funfact();
    [outputFact setText:[NSString stringWithFormat:@"%s",D.fact[9999]]];
    
    
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
