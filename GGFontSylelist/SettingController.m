//
//  SettingController.m
//  GGFontSylelist
//
//  Created by __无邪_ on 15/5/1.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "SettingController.h"

NSString const * kNotificationofReloadData = @"kNotificationofReloadData";


@interface SettingController ()

@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.slider setMaximumValue:100.0f];
    [self.slider setMinimumValue:11.0f];
    
    
    NSString *valueStr = [NSString stringWithFormat:@"%.2f",self.value];
    
    [self.slider setValue:self.value animated:YES];
    [self.textView setText:self.text];
    [self.indicateLabel setText:valueStr];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSDictionary *info = @{
                           @"fontSize":@(self.slider.value),
                           @"testText":self.textView.text
                           };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationofReloadData object:info];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action
- (void)valueChanged:(UISlider *)sender{
    NSString *valueStr = [NSString stringWithFormat:@"%.2f",sender.value];
    [self.indicateLabel setText:valueStr];
}

#pragma mark - UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    NSLog(@"---%s---",__func__);
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    NSLog(@"---%s---",__func__);
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    NSLog(@"---%s---",__func__);
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSLog(@"---%s---",__func__);
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView{
    NSLog(@"---%s---",__func__);
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
