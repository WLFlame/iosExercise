//
//  UITextInputVC.m
//  UIKit
//
//  Created by wanli.yang on 16/5/10.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UITextInputVC.h"

@interface UITextInputVC () <UITextInputDelegate>

@end

@implementation UITextInputVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextView *textView = [[UITextView alloc] init];
    textView.text = @"曾经沧海难为水， 除却巫山不是云";
    textView.frame = self.view.bounds;
    [self.view addSubview:textView];
    // 是否有内容
    NSLog(@"%d", [textView hasText]);
    // 插入文本
    [textView insertText:@"hehe"];
    // 删除最后一个
    [textView deleteBackward];
    // 选中范围
    NSLog(@"loc %lu length %lu", (unsigned long)textView.selectedRange.location, (unsigned long)textView.selectedRange.length);
    // 标记范围
    NSLog(@"%@", textView.markedTextRange);
    
//    NSLog(@"%@", [textView textInRange:NSMakeRange(0, 3)]);
    // 标记样式
    textView.markedTextStyle = @{
                                 NSForegroundColorAttributeName : [UIColor cyanColor],
                                 NSBackgroundColorAttributeName : [UIColor redColor]
                                 };
    // 标记文本和范围
    [textView setMarkedText:@"曾经" selectedRange:NSMakeRange(0, 2)];
    // 文本开始位置
    NSLog(@"%@", textView.beginningOfDocument);
    // 文本结束为位置
    NSLog(@"%@", textView.endOfDocument);
    // 根据位置返回UITextRange
    NSLog(@"%@", [textView textRangeFromPosition:textView.beginningOfDocument toPosition:textView.endOfDocument]);
    
    NSLog(@"%@", [textView textInRange:[textView textRangeFromPosition:textView.beginningOfDocument toPosition:textView.endOfDocument]]);
    
    UITextPosition *pos = [textView positionFromPosition:textView.beginningOfDocument offset:3];
    NSLog(@"%@", [textView textInRange:[textView textRangeFromPosition:pos toPosition:textView.endOfDocument]]);
    
    NSLog(@"%ld", (long)[textView comparePosition:textView.beginningOfDocument toPosition:textView.endOfDocument]);
    
    NSLog(@"%ld", [textView offsetFromPosition:textView.beginningOfDocument toPosition:textView.endOfDocument]);
    
    textView.inputDelegate = self;
   
    //分词
    NSLog(@"%@", textView.tokenizer);
    
    NSLog(@"%@", [textView.tokenizer rangeEnclosingPosition:textView.beginningOfDocument withGranularity:UITextGranularityWord inDirection:UITextLayoutDirectionLeft]);
    
    NSLog(@"%@", [textView positionWithinRange:[textView textRangeFromPosition:textView.beginningOfDocument toPosition:textView.endOfDocument] farthestInDirection:UITextLayoutDirectionLeft]);
    
    CGRect firstRect = [textView firstRectForRange:[textView textRangeFromPosition:textView.beginningOfDocument toPosition:textView.endOfDocument]];
    // 文字frame
    UIView *firstRectView = [[UIView alloc] initWithFrame:firstRect];
    firstRectView.backgroundColor = [UIColor redColor];
//    [textView addSubview:firstRectView];
    //分割线
    CGRect caretRect = [textView caretRectForPosition:[textView positionFromPosition:textView.beginningOfDocument offset:3]];
    UIView *caretRectView = [[UIView alloc] initWithFrame:caretRect];
    caretRectView.backgroundColor = [UIColor cyanColor];
    [textView addSubview:caretRectView];
    
    NSLog(@"%@", [textView selectionRectsForRange:[textView textRangeFromPosition:textView.beginningOfDocument toPosition:textView.endOfDocument]]);;
    
    // Hit Testing
    // 最靠近某个点的postion
    NSLog(@"%@", [textView closestPositionToPoint:self.view.center]);
    // 在某个范围内最靠近的点
    NSLog(@"%@", [textView closestPositionToPoint:self.view.center withinRange:[textView textRangeFromPosition:textView.beginningOfDocument toPosition:[textView positionFromPosition:textView.beginningOfDocument offset:3]]]);
    
    NSLog(@"%@", [textView characterRangeAtPoint:self.view.center]);
    
    NSLog(@"%@", [textView textInputView]);
}

#pragma mark -- UITextInputDelegate
- (void)selectionDidChange:(id<UITextInput>)textInput
{
    NSLog(@"%s", __func__);
}

- (void)selectionWillChange:(id<UITextInput>)textInput
{
     NSLog(@"%s", __func__);
}

- (void)textWillChange:(id<UITextInput>)textInput
{
     NSLog(@"%s", __func__);
}

- (void)textDidChange:(id<UITextInput>)textInput
{
     NSLog(@"%s", __func__);
}



@end
