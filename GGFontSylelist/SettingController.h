//
//  SettingController.h
//  GGFontSylelist
//
//  Created by __无邪_ on 15/5/1.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import <UIKit/UIKit.h>
FOUNDATION_EXTERN NSString const * kNotificationofReloadData;

@interface SettingController : UIViewController

@property (nonatomic, strong)NSString *text;
@property (nonatomic, unsafe_unretained)CGFloat value;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *indicateLabel;

@end
