//
//  revcontroller.m
//  uilab
//
//  Created by Pegg, Andrew on 12/4/19.
//  Copyright © 2019 Pegg, Andrew. All rights reserved.
//

#import "revcontroller.h"
#import "Calc.h"


@interface revcontroller()

@end

@implementation revcontroller
@synthesize Outputtext,InputText,polo,time1,time2,time3;

- (void)viewDidLoad {
    [super viewDidLoad];
    [InputText setText:@"enter text"];
    // Do any additional setup after loading the view.
}


- (IBAction)revse:(id)sender
{
    clock_t t; double time;
   
    NSString *intputstring= InputText.text; const char *char1 = [intputstring UTF8String]; const char *c2=[intputstring UTF8String]; const char *c3=[intputstring UTF8String];
    t=clock();
    char1=strrev((char*)char1);
    t=clock()-t;
    time =((double)t)/CLOCKS_PER_SEC;
    [Outputtext setText:[NSString stringWithFormat:@"%s",char1]];
    [time1 setText:[NSString stringWithFormat:@"%f",time]];
    char1=c2;//clears buffer back to orginal string
    NSLog(@"%s",char1);//also debug

    // pointer
    t=clock();
    char1= reverseString((char*)char1);
    t=clock()-t;
    time =((double)t)/CLOCKS_PER_SEC;
    [Outputtext setText:[NSString stringWithFormat:@"%s",char1]];
    [time2 setText:[NSString stringWithFormat:@"%f",time]];
    //recourison
    
    
    NSLog(@"%s",char1);
    t=clock();
    reverse((char*)c3,0,(int)strlen(char1)-1);
    t=clock()-t;
    NSLog(@"%s",c3);
    time =((double)t)/CLOCKS_PER_SEC;
    [Outputtext setText:[NSString stringWithFormat:@"%s",char1]];
    [time3 setText:[NSString stringWithFormat:@"%f",time]];
    c3=char1;
    c2=[intputstring UTF8String];//redfine c2 to orginal string 
    NSLog(@"%s",c3);//debug
    NSLog(@"%s",c2);//debug
    
    
    
    
    
    
    
    int n=0;// checking if statement
    n=strcmp(c3,c2);
    NSLog(@"%d",n);//more debug
    if(n==0)
    {
        [polo setText: @"Yes"];
    }
    else
    {
        [polo setText:@"No"];
    }
    
        
     
}
- (IBAction)onreturn:(id)sender {
[self.InputText resignFirstResponder];
}

@end

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


