//
//  ViewController.h
//  uilab
//
//  Created by Pegg, Andrew on 11/12/19.
//  Copyright © 2019 Pegg, Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface  PythoController: UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *awnser;
@property (weak, nonatomic) IBOutlet UITextField *side1;
@property (weak, nonatomic) IBOutlet UITextField *side2;


@end

NS_ASSUME_NONNULL_END
