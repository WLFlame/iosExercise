//
//  UIGestureRecognizerVC.m
//  UIKit
//
//  Created by wanli.yang on 16/5/15.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UIGestureRecognizerVC.h"

@interface UIGestureRecognizerVC () <UIGestureRecognizerDelegate>

@end

@implementation UIGestureRecognizerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGesture.delegate = self;
    [self.view addGestureRecognizer:tapGesture];
    // 取消点击
    [tapGesture setCancelsTouchesInView:NO];
    // 双击失败才会触发单击
//    requireGestureRecognizerToFail
    
}

- (void)tap:(UITapGestureRecognizer *)gesture
{
    self.view.backgroundColor = [UIColor redColor];
    NSLog(@"tap");
    NSLog(@"%@", gesture.view);
    NSLog(@"x %f y %f", [gesture locationInView:self.view].x, [gesture locationInView:self.view].y);
    NSLog(@"%lu", (unsigned long)[gesture numberOfTouches]);
    NSLog(@"x %f y %f", [gesture locationOfTouch:0 inView:self.view].x, [gesture locationOfTouch:0 inView:self.view].y);
    
}

#pragma mark -- UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    CGPoint p = [gestureRecognizer locationInView:self.view];
    if (p.y < self.view.bounds.size.height / 2) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

// 多手势处理
// 前一个生效，后一个失效
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

// 后一个生效，前一个失效
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

// 是否接受点击
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    UIView *tapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    tapView.backgroundColor = [UIColor cyanColor];
    tapView.center = [touch locationInView:self.view];
    [self.view addSubview:tapView];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

}



@end
