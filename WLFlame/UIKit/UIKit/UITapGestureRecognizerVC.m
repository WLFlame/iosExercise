//
//  UITapGestureRecognizerVC.m
//  UIKit
//
//  Created by wanli.yang on 16/5/15.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UITapGestureRecognizerVC.h"

@interface UITapGestureRecognizerVC ()

@end

@implementation UITapGestureRecognizerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
    // 点击数
    tap.numberOfTapsRequired = 2;
    //要求手指数
    tap.numberOfTouchesRequired = 2;
}

- (void)tap
{
    NSLog(@"tap");
}

@end
