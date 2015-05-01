//
//  GGFontStyleCell.h
//  GGFontSylelist
//
//  Created by __无邪_ on 15/5/1.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGFontStyleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *textStyleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

- (void)setStyleText:(NSString *)text name:(NSString *)name withFont:(UIFont *)font;

@end
