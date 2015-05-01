//
//  GGFontStyleCell.m
//  GGFontSylelist
//
//  Created by __无邪_ on 15/5/1.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "GGFontStyleCell.h"

@implementation GGFontStyleCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setStyleText:(NSString *)text name:(NSString *)name withFont:(UIFont *)font{
    [self.textStyleLabel setFont:font];
    [self.textStyleLabel setText:text];
    [self.nameLabel setText:name];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
