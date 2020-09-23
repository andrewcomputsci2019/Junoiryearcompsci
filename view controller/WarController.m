//
//  WarController.m
//  uilab
//
//  Created by Pegg, Andrew on 2/5/20.
//  Copyright © 2020 Pegg, Andrew. All rights reserved.
//

#import "WarController.h"
#import "WarGame.h"

@interface WarController ()

@end

@implementation WarController
@synthesize HoldingDeck2,HoldingDeck,Player1Battle,Player2Battle,Player2Deck,Player1Deck,cardcounterai,cardcounterplayer,LoseLabel,WinLabel;
@synthesize action,holdeck2counter,hldingdeck1counter,RoundTimer,cardTimer,arrowpoint,automodewaring,quitbutton;

int Holdingdeckplayer;
int holdingdeckai;
NSString *dId;
NSString *cId;
int fristvaule;
NSString *firstplayercard;


- (void)viewDidLoad {
[Player1Deck setImage:[UIImage imageNamed:@"card0.png"]];
[Player2Deck setImage:[UIImage imageNamed:@"card0.png"]];
    freedeck(cards);
    cards = createdeck();
    shuffledeck(cards);
    LoseLabel.alpha = 0;
    WinLabel.alpha=0;
    [self.navigationController setNavigationBarHidden:YES];
         self.cardTimer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(automode) userInfo:nil repeats:YES];//automode
   
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}

-(void)automode//automode method
{
    
    [self.navigationController setNavigationBarHidden:NO];
    
    freedeck(cards);
    cards = createdeck();
    shuffledeck(cards);
    arrowpoint.alpha = 1;
     automodewaring.alpha =1;
    
       static int deck1=0;//'set deck to zero to began'
         static int deck2=0;//'
         static int count = 0;
         deck1 = deck1 == 0 ? DECK_CNT/2 : deck1;
         deck2 = deck2 == 0 ? DECK_CNT/2 : deck2;
         long a = count % DECK_CNT;
         if((holdingdeckai>26 && Holdingdeckplayer>26) || deck1+deck2>52)
            {
                deck1=26;
                holdingdeckai=0;
                Holdingdeckplayer=0;
                deck2=26;
            }// makes sure deck is not over 52 cards
        
         NSString *cId = [NSString stringWithFormat:@"card%s.png" , cards[a].cImage];
         if((a%2)==0) //makes a string wicht follows my card naming structure
         {
             
             Player1Battle.image = [UIImage imageNamed:@"card0.png"];
                  
                 // do some animation stuff
                 [UIView animateWithDuration:animSpeed animations:^{
                   self->Player1Battle.transform = CGAffineTransformMakeScale(-1,1);
                 }];
                 dispatch_time_t changeTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(animSpeed/2 * NSEC_PER_SEC));
                 dispatch_after(changeTime, dispatch_get_main_queue(), ^(void){
                   [self->Player1Battle setImage:[UIImage imageNamed:cId]];
                 });
                 dispatch_after(changeTime, dispatch_get_main_queue(), ^(void){
                  [UIView animateWithDuration:animSpeed animations:^{
                   self->Player1Battle.transform = CGAffineTransformMakeScale(1,1);
                  }];
                 });
             firstplayercard=cId;
             fristvaule = cards[a].symbol == Ace ? SYMBOL_CNT : cards[a].value;
             // finds value of the cards
             deck1--;
            
             
         }
         else
         {
             Player2Battle.image = [UIImage imageNamed:@"card0.png"];
                  
                 // anamation code by parker use gctransforme
                 [UIView animateWithDuration:animSpeed animations:^{
                   self->Player2Battle.transform = CGAffineTransformMakeScale(-1,1);
                 }];
                 dispatch_time_t changeTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(animSpeed/2 * NSEC_PER_SEC));
                 dispatch_after(changeTime, dispatch_get_main_queue(), ^(void){
                   [self->Player2Battle setImage:[UIImage imageNamed:cId]];
                 });
                 dispatch_after(changeTime, dispatch_get_main_queue(), ^(void){
                  [UIView animateWithDuration:animSpeed animations:^{
                   self->Player2Battle.transform = CGAffineTransformMakeScale(1,1);
                  }];
                 });
      
             
         int secondvuale = cards[a].symbol == Ace ? SYMBOL_CNT : cards[a].value;
         NSLog(@"%d,%d",cards[a].value,fristvaule);
             //finds the second value of cards
               deck2--;
        
         
             if(fristvaule>secondvuale)// compars first and second
         {
             [HoldingDeck setImage:[UIImage imageNamed:firstplayercard]];
             Holdingdeckplayer= Holdingdeckplayer + 2;//adds two cards to the player holding deck
            [cardcounterplayer setText:[NSString stringWithFormat:@"%d",deck1]];//updates deck counters
             [cardcounterai setText:[NSString stringWithFormat:@"%d",deck2]];
             [hldingdeck1counter setText:[NSString stringWithFormat:@"%d",Holdingdeckplayer]];//updates holding deck counter
         }
         else
         {
             [HoldingDeck2 setImage:[UIImage imageNamed:cId]];
             [cardcounterai setText:[NSString stringWithFormat:@"%d",deck2]];
             [cardcounterplayer setText:[NSString stringWithFormat:@"%d",deck1]];
             holdingdeckai= holdingdeckai+2;
             [holdeck2counter setText:[NSString stringWithFormat:@"%d",holdingdeckai]];
            
             
         }
             
         }
         if(deck1==0)//emptys holding pile into deck.
         {
             deck1=Holdingdeckplayer;
             Holdingdeckplayer=0;
         }
         if(deck2==0)
         {
             deck2=holdingdeckai;
             holdingdeckai=0;
         }
        if(holdingdeckai==0 && deck2==0)//detrimes if sombody has won
         {
             WinLabel.alpha=1;
            
         }
         else
         {
             WinLabel.alpha=0;
         }
       if(Holdingdeckplayer==0 && deck1==0)
         {
             
             LoseLabel.alpha = 1;
             deck1=0;
             deck2=0;
             Holdingdeckplayer=0;
             holdingdeckai=0;
             freedeck(cards);
             cards = createdeck();
             shuffledeck(cards);
         }
         else
            {
                LoseLabel.alpha=0;
            }
        
         if(WinLabel.alpha==1)
         {
             deck1=0;
             deck2=0;
             Holdingdeckplayer=0;
             holdingdeckai=0;
             freedeck(cards);
             cards = createdeck();
             shuffledeck(cards);
             
         }
         
         count ++;
             
         
         
         
         
     }




-(IBAction)playit:(id)sender{//user mode
    quitbutton.alpha = 1;
  
    [self.navigationController setNavigationBarHidden:YES];
    arrowpoint.alpha = 0;
    automodewaring.alpha =0;
    [self.cardTimer invalidate];//stops automode
    static int deck1=0;// sets deck 1 to 0
    static int deck2=0;// sets deck two to 0
    static int count = 0;
    deck1 = deck1 == 0 ? DECK_CNT/2 : deck1;//if deck 1 =0 deck 1 =26
    deck2 = deck2 == 0 ? DECK_CNT/2 : deck2;// if deck 2 =0 deck2 =26
    long a = count % DECK_CNT;
    if((holdingdeckai>26 && Holdingdeckplayer>26) || deck1+deck2>52)//makes sure deck not over 52
              {
                  deck1=26;
                  holdingdeckai=0;
                  Holdingdeckplayer=0;
                  deck2=26;
                  
              }
   
    NSString *cId = [NSString stringWithFormat:@"card%s.png" , cards[a].cImage];
    if((a%2)==0)
    {
        Player1Battle.image = [UIImage imageNamed:@"card0.png"];
          
         // do some animation stuff
         [UIView animateWithDuration:animSpeed animations:^{
           self->Player1Battle.transform = CGAffineTransformMakeScale(-1,1);
         }];
         dispatch_time_t changeTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(animSpeed/2 * NSEC_PER_SEC));
         dispatch_after(changeTime, dispatch_get_main_queue(), ^(void){
           [self->Player1Battle setImage:[UIImage imageNamed:cId]];
         });
         dispatch_after(changeTime, dispatch_get_main_queue(), ^(void){
          [UIView animateWithDuration:animSpeed animations:^{
           self->Player1Battle.transform = CGAffineTransformMakeScale(1,1);
          }];
         });
        firstplayercard=cId;
        fristvaule = cards[a].symbol == Ace ? SYMBOL_CNT : cards[a].value;
        deck1--;
       
        
    }
    else
    {
        Player2Battle.image = [UIImage imageNamed:@"card0.png"];
          
         // do some animation stuff
         [UIView animateWithDuration:animSpeed animations:^{
           self->Player2Battle.transform = CGAffineTransformMakeScale(-1,1);
         }];
         dispatch_time_t changeTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(animSpeed/2 * NSEC_PER_SEC));
         dispatch_after(changeTime, dispatch_get_main_queue(), ^(void){
           [self->Player2Battle setImage:[UIImage imageNamed:cId]];
         });
         dispatch_after(changeTime, dispatch_get_main_queue(), ^(void){
          [UIView animateWithDuration:animSpeed animations:^{
           self->Player2Battle.transform = CGAffineTransformMakeScale(1,1);
          }];
         });
        
        
    int secondvuale = cards[a].symbol == Ace ? SYMBOL_CNT : cards[a].value;
    NSLog(@"%d,%d",cards[a].value,fristvaule);
          deck2--;
   
    
        if(fristvaule>secondvuale)
    {
        [HoldingDeck setImage:[UIImage imageNamed:firstplayercard]];
        Holdingdeckplayer= Holdingdeckplayer + 2;
       [cardcounterplayer setText:[NSString stringWithFormat:@"%d",deck1]];
        [cardcounterai setText:[NSString stringWithFormat:@"%d",deck2]];
        [hldingdeck1counter setText:[NSString stringWithFormat:@"%d",Holdingdeckplayer]];
    }
    else
    {
        [HoldingDeck2 setImage:[UIImage imageNamed:cId]];
        [cardcounterai setText:[NSString stringWithFormat:@"%d",deck2]];
        [cardcounterplayer setText:[NSString stringWithFormat:@"%d",deck1]];
        holdingdeckai= holdingdeckai+2;
        [holdeck2counter setText:[NSString stringWithFormat:@"%d",holdingdeckai]];
       
        
    }
        
    }
    if(deck1==0)
    {
        deck1=Holdingdeckplayer;
        Holdingdeckplayer=0;
    }
    if(deck2==0)
    {
        deck2=holdingdeckai;
        holdingdeckai=0;
    }
    if(holdingdeckai==0 && deck2==0)
    {
        WinLabel.alpha=1;
        deck1=0;
        deck2=0;
        Holdingdeckplayer=0;
        holdingdeckai=0;
      freedeck(cards);
      cards = createdeck();
      shuffledeck(cards);
    }
    else
    {
        WinLabel.alpha=0;
    }
    if(Holdingdeckplayer==0 && deck1==0)
    {
        
        LoseLabel.alpha = 1;
        deck1=0;
        deck2=0;
        Holdingdeckplayer=0;
        holdingdeckai=0;
        freedeck(cards);
        cards = createdeck();
        shuffledeck(cards);
    }
    else
       {
           LoseLabel.alpha=0;
       }
   
    
    
    count ++;
        
    
    
    
    
}
-(IBAction)quitit:(id)sender{
    quitbutton.alpha= 0;//quits manual mode
    [self centercontroll];
}
-(void)centercontroll
{
     self.cardTimer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(automode) userInfo:nil repeats:YES];//restartes the timer for automode
    
    [self automode];//calls automode code
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
