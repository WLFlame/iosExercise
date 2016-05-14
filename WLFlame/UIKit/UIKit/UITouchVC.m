//
//  UITouchVC.m
//  UIKit
//
//  Created by wanli.yang on 16/5/14.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UITouchVC.h"

@interface UITouchVC ()

@end

@implementation UITouchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.allObjects.lastObject;
    NSLog(@"%f", touch.timestamp);
    NSLog(@"%ld", (long)touch.phase);
    NSLog(@"%lu", (unsigned long)touch.tapCount);
    NSLog(@"%@", touch.gestureRecognizers);
    NSLog(@"%@", touch.view);
    NSLog(@"%@ %@", touch.window, [UIApplication sharedApplication].keyWindow);
     // 上一个点
//    该方法记录了前一个坐标值，函数返回也是一个CGPoint类型的值， 表示触摸在view这个视图上的位置，这里返回的位置是针对view的坐标系的。调用时传入的view参数为空的话，返回的时触摸点在整个窗口的位置。
//    
//    当手指接触到屏幕，不管是单点触摸还是多点触摸，事件都会开始，直到用户所有的手指都离开屏幕。期间所有的UITouch对象都被包含在UIEvent事件对象中，由程序分发给处理者。事件记录了这个周期中所有触摸对象状态的变化。
     NSLog(@"x %f y %f", [touch previousLocationInView:self.view].x, [touch previousLocationInView:self.view].y);
    // 当前点
    NSLog(@"x %f y %f", [touch locationInView:self.view].x, [touch locationInView:self.view].y);
   
    
}


@end
