//
//  UIControlVC.m
//  UIKit
//
//  Created by wanli.yang on 16/5/14.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UIControlVC.h"

@interface UIControlVC ()

@end

@implementation UIControlVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIControl *control = [[UIControl alloc] init];
    // 是否启用
    control.enabled = YES;
    // 是否选中
    control.selected = NO;
    // 高亮
    control.highlighted = NO;
    // 内容对齐方式
    control.contentVerticalAlignment = UIControlContentHorizontalAlignmentLeft;
    control.contentHorizontalAlignment = UIControlContentVerticalAlignmentTop;
    // 状态
    NSLog(@"%lu", (unsigned long)control.state);
    // 跟踪
    NSLog(@"%d", control.tracking);
    // 按下
     NSLog(@"%d", control.touchInside);
    [control addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
//    [control removeTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    NSLog(@"%@", [control allTargets]);
    NSLog(@"%lu", (unsigned long)[control allControlEvents]);
    // 返回方法名称
    NSLog(@"%@", [control actionsForTarget:self forControlEvent:UIControlEventTouchUpInside]);
    [control sendActionsForControlEvents:UIControlEventTouchUpInside];
    [control sendAction:@selector(test) to:self forEvent:nil];
}

- (void)test
{
    NSLog(@"test");
}

@end
