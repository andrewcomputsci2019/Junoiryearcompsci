//
//  tokencontroller.m
//  uilab
//
//  Created by Pegg, Andrew on 12/13/19.
//  Copyright © 2019 Pegg, Andrew. All rights reserved.
//

#import "tokencontroller.h"
#import "token.h"

@interface tokencontroller()

@end

@implementation tokencontroller
@synthesize input,output,piglat,shorthand,Polo,Time;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)dothing:(id)sender
{
    clock_t t; double time;
    char*pass;
    NSString *inputstring;
    inputstring=input.text;
    const char *c1=[inputstring UTF8String];
    const char *c2;
    t=clock();
   c2 = tokenreverse((char*)c1);
    t=clock()-t;
    time =((double)t)/CLOCKS_PER_SEC;
    [Time setText:[NSString stringWithFormat :@"%.4f",time ]];
    printf("%.6f\n",time);
    NSLog(@"%s\n",c2);
    [output setText:[NSString stringWithFormat:@"%s",c2]];
    c1=[inputstring UTF8String];
    printf("%s",c1);
    long l= strlen(c1);
    c2=piglatin((char*)c1,l);
    [piglat setText:[NSString stringWithFormat:@"%s",c2]];
    c1=[inputstring UTF8String];
    c1 = shortit((char*)c1);
    [shorthand setText:[NSString stringWithFormat:@"%s",c1]];
    c1=[inputstring UTF8String];
    c2=[inputstring UTF8String];
    pass = poloycheck((char*)c1,(char*)c2);
    [Polo setText:[NSString stringWithFormat:@"%s",pass]];
     
    
    
    
    
    

    
}

- (IBAction)onreturn:(id)sender {
[self.input resignFirstResponder];
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
