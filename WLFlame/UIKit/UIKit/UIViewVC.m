//
//  UIViewVC.m
//  UIKit
//
//  Created by ywl on 16/5/11.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UIViewVC.h"

@interface UIViewVC ()

@end

@implementation UIViewVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(0, 0, 200, 200);
    redView.center = self.view.center;
    [self.view addSubview:redView];
    
    // 是否处理用户交互事件
    redView.userInteractionEnabled = YES;
    NSLog(@"%@", redView.layer);
    NSLog(@"%f", redView.contentScaleFactor);
    // 是否支持多点
    redView.multipleTouchEnabled = YES;
    // 排他性
    redView.exclusiveTouch = YES;
    // 点击检测
//    [redView hitTest:<#(CGPoint)#> withEvent:<#(nullable UIEvent *)#>]
    // 点是否在范围内
//    [redView pointInside:<#(CGPoint)#> withEvent:<#(nullable UIEvent *)#>]
    // 坐标系转换
//    public func convertPoint(point: CGPoint, toView view: UIView?) -> CGPoint
//    public func convertPoint(point: CGPoint, fromView view: UIView?) -> CGPoint
//    public func convertRect(rect: CGRect, toView view: UIView?) -> CGRect
//    public func convertRect(rect: CGRect, fromView view: UIView?) -> CGRect
//    redView.autoresizesSubviews = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin;
    // autoresizing
//    redView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    UILabel *lb = [[UILabel alloc] init];
    lb.textColor = [UIColor blueColor];
    [self.view addSubview:lb];
    lb.frame = CGRectMake(20, 70, 0, 0);
    lb.text = @"test sizeToFit";
    // sizeToFit 会改变view的Size
//    [lb sizeToFit];
    CGRect rect = lb.frame;
    // sizeThatFits 不会改变view的Size
    rect.size = [lb sizeThatFits:CGSizeMake(1110, 1)];
    lb.frame = rect;
    
    // 对view的操作
    NSLog(@"%@", redView.superview);
    // 子views
    NSLog(@"%@", redView.subviews);
    // 窗口
    NSLog(@"%@", redView.window);
    // 移除
//    [redView removeFromSuperview];
    // 插入view
    UIView *blue = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    blue.center = CGPointMake(100, 100);
    blue.backgroundColor = [UIColor blueColor];
    [redView insertSubview:blue atIndex:0];
    UIView *cyan = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    cyan.backgroundColor = [UIColor cyanColor];
    cyan.center = CGPointMake(100, 100);
    [redView insertSubview:cyan atIndex:1];
    // 交换view的位置
    [redView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    // 将view插到某个view的上面
    [redView insertSubview:cyan aboveSubview:blue];
    // 将view插到某个view下面
    [redView insertSubview:cyan belowSubview:blue];
    // 将view带到最前面
    [redView bringSubviewToFront:cyan];
    // 将view带到最后面
    [redView sendSubviewToBack:cyan];
    // 添加了某个view
//    didAddSubview(subview: UIView)
    // 将移除某个view
//     willRemoveSubview(subview: UIView)
    // 判断是否是子view
    NSLog(@"%d", [redView isDescendantOfView:cyan]);
    NSLog(@"%d", [cyan isDescendantOfView:redView]);
    // 告诉系统一会儿刷新（性能好）
    [redView setNeedsLayout];
    // 立即刷新
    [redView layoutIfNeeded];
    // view 布局代码
//     layoutSubviews(
    // 布局间距 默认 (8,8,8,8)
    UIEdgeInsets layoutMargin = redView.layoutMargins;
 // 是否保留superView的layoutMargin
    redView.preservesSuperviewLayoutMargins = YES;
    //layoutMargin发生变化
//    layoutMarginsDidChange
    // 限制subview不能超出父view的范围
    redView.clipsToBounds = YES;
    // 透明度
    redView.alpha = 0.7;
    // 不透明
    redView.opaque = YES;
}



@end
