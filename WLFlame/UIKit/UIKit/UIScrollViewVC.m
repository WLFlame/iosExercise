//
//  UIScrollViewVC.m
//  UIKit
//
//  Created by ywl on 16/5/11.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UIScrollViewVC.h"

@interface UIScrollViewVC () <UIScrollViewDelegate>

@end

@implementation UIScrollViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIScrollView *scroll = [[UIScrollView alloc] init];
    scroll.frame = self.view.bounds;
    [self.view addSubview:scroll];
    
    scroll.backgroundColor = [UIColor orangeColor];
    scroll.contentSize = CGSizeMake(self.view.bounds.size.width * 2, self.view.bounds.size.height * 2);
    scroll.contentInset = UIEdgeInsetsMake(50, 50, 50, 50);
    scroll.contentOffset = CGPointMake(100, 100);
    scroll.delegate = self;
    // 只能往一个方向
    scroll.directionalLockEnabled = YES;
    // 是否具有弹性
    scroll.bounces = NO;
    // 是否在垂直方向总是有弹性
    scroll.alwaysBounceVertical = YES;
    // 是否在水平方向总是有弹性
    scroll.alwaysBounceHorizontal = YES;
    // 是否分页
    scroll.pagingEnabled = YES;
    // 是否能滚动
    scroll.scrollEnabled = YES;
    // 是否显示水平滚动条
    scroll.showsHorizontalScrollIndicator = YES;
    // 是否显示垂直
    scroll.showsVerticalScrollIndicator = YES;
    // 滚动条内距
    scroll.scrollIndicatorInsets = UIEdgeInsetsMake(20, 20, 20, 20);
    // 滚动条样式
    scroll.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    // 停止滚动速度
    scroll.decelerationRate = UIScrollViewDecelerationRateFast;
    // 设置内容偏移
//    scroll setContentOffset:<#(CGPoint)#>
//    scroll setContentOffset:<#(CGPoint)#> animated:<#(BOOL)#>
    // 滚动到指定可见区域
//    [scroll scrollRectToVisible:<#(CGRect)#> animated:<#(BOOL)#>]
    // 使滚动条闪现
    [scroll flashScrollIndicators];
    // 手指是否触摸
    NSLog(@"%d", [scroll isTracking]);
    // 是否拖动
    NSLog(@"%d", [scroll isDragging]);
    // 是否减速
    NSLog(@"%d", [scroll isDecelerating]);
    // 延迟调用touchbegin （如果是的话则拖动的时候才调用touchbegin）
    // 缩放比例
    scroll.minimumZoomScale = 0.5;
    scroll.maximumZoomScale = 2.0;
    
    // 设置缩放比例
//    [scroll setZoomScale:<#(CGFloat)#>]
    // 缩放到矩形位置
//    [scroll zoomToRect:<#(CGRect)#> animated:<#(BOOL)#>]
    // 是否启用缩放
    scroll.bouncesZoom = YES;
    
    NSLog(@"%d", scroll.zooming);
    NSLog(@"%d", scroll.zoomBouncing);
    
    NSLog(@"%@", scroll.panGestureRecognizer);
    NSLog(@"%@", scroll.pinchGestureRecognizer);
    // 拖动的时候是否隐藏键盘
    scroll.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
}

#pragma mark --- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"%s", __func__);
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"%s", __func__);
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
    return nil;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    NSLog(@"%s", __func__);
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"%s", __func__);
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
    return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}








@end





























