//
//  UITextViewVC.m
//  UIKit
//
//  Created by ywl on 16/5/13.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UITextViewVC.h"

@interface UITextViewVC ()
@property (nonatomic, strong) UITextView *textView;
@end

@implementation UITextViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    self.textView = textView;
    [self.view addSubview:textView];
    
    textView.text = @"曾经沧海难为水 除却巫山不是云 http://www.baidu.com 18512519140";
    textView.font = [UIFont systemFontOfSize:15];
    textView.textColor = [UIColor cyanColor];
    textView.textAlignment = NSTextAlignmentLeft;
    NSLog(@"loc %lu len %lu", textView.selectedRange.location, textView.selectedRange.length);
    
    // 是否能编辑 如果YES 则不能处理数据监测
    textView.editable = NO;
    // 是否能选中, false 不能交互
    textView.selectable = YES;
    textView.dataDetectorTypes = UIDataDetectorTypeLink | UIDataDetectorTypeAddress | UIDataDetectorTypePhoneNumber | UIDataDetectorTypeCalendarEvent;
    // 选中菜单中出现BIU
    textView.allowsEditingTextAttributes = YES;
    textView.typingAttributes = @{
                                  NSFontAttributeName : [UIFont systemFontOfSize:20]
                                  };
    // 滚动到指定文字范围
//    scrollRangeToVisible
    // 输入view
    NSLog(@"%@", textView.inputView);
    // 输入辅助view
    NSLog(@"%@", textView.inputAccessoryView);
// 是否全选
    textView.clearsOnInsertion = YES;
    
    // 监测到的文字样式
    textView.linkTextAttributes = @{
                                    NSFontAttributeName : [UIFont systemFontOfSize:13],
                                    NSForegroundColorAttributeName : [UIColor redColor]
                                    };
}





@end
