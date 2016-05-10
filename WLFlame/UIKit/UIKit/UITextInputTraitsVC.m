//
//  UITextInputTraitsVC.m
//  UIKit
//
//  Created by wanli.yang on 16/5/11.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UITextInputTraitsVC.h"

@interface UITextInputTraitsVC ()

@end

@implementation UITextInputTraitsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITextView *textView = [[UITextView alloc] init];
    textView.text = @"曾经沧海难为水 除却巫山不是云";
    [self.view addSubview:textView];
    textView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[textView.topAnchor constraintEqualToAnchor:self.view.topAnchor]];
    [self.view addConstraint:[textView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor]];
    [self.view addConstraint:[textView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor]];
    [self.view addConstraint:[textView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]];
    // 自动大写
    textView.autocapitalizationType = UITextAutocapitalizationTypeNone;
    // 自动更正
    textView.autocorrectionType = UITextAutocorrectionTypeNo;
    // 键盘类型
    textView.keyboardType = UIKeyboardTypeAlphabet;
    // 键盘样式
    textView.keyboardAppearance = UIKeyboardAppearanceDark;
    // 返回键类型
    textView.returnKeyType = UIReturnKeyGo;
    // 是否自动return
    textView.enablesReturnKeyAutomatically = YES;
    // 支持安全输入
    textView.secureTextEntry = YES;
}

@end
