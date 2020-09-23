//
//  Rectangle.h
//  uilab
//
//  Created by Pegg, Andrew on 11/13/19.
//  Copyright © 2019 Pegg, Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Rectangle : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *side1;
@property (weak, nonatomic) IBOutlet UITextField *side2;
@property (weak, nonatomic) IBOutlet UILabel *area;
@property (weak, nonatomic) IBOutlet UILabel *permiter;


@end

NS_ASSUME_NONNULL_END
