//
//  Temp.h
//  uilab
//
//  Created by Pegg, Andrew on 11/13/19.
//  Copyright © 2019 Pegg, Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface _Temp : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *FText;
@property (weak, nonatomic) IBOutlet UILabel *FtoC;
@property (weak, nonatomic) IBOutlet UILabel *FtoF;
@property (weak, nonatomic) IBOutlet UILabel *CtoF;

@end

NS_ASSUME_NONNULL_END
