//
//  UIViewVC.m
//  UIKit
//
//  Created by ywl on 16/5/11.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UIViewVC.h"
#import "AlignmentView.h"

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
    // 清空上下文对象在绘制之前
//    clearsContextBeforeDrawing
    // 蒙板view
    UIView *green = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    green.backgroundColor = [UIColor greenColor];
//    redView.maskView = green;
    
    // tintColor 线条颜色
    UISwitch *sw = [UISwitch new];
    sw.center = self.view.center;
    [self.view addSubview:sw];
    sw.tintColor = [UIColor redColor];
    sw.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    // tintColor发生变化
    // 返回当前的动画时间
//    inheritedAnimationDuration
    
    // 添加到view的手势
    NSLog(@"gestureRecognizers %@", self.view.gestureRecognizers);
    // 添加手势
//    addGestureRecognizer
    // 移除手势
//    removeGestureRecognizer
    // 是否接受手势, 如果不接受则不做接下来的点击
//    gestureRecognizerShouldBegin
    // 操作约束
    
//    public var constraints: [NSLayoutConstraint] { get }
//    
//    
//    public func addConstraint(constraint: NSLayoutConstraint) // This method will be deprecated in a future release and should be avoided.  Instead, set NSLayoutConstraint's active property to YES.
//    
//    public func addConstraints(constraints: [NSLayoutConstraint]) // This method will be deprecated in a future release and should be avoided.  Instead use +[NSLayoutConstraint activateConstraints:].
//    
//    public func removeConstraint(constraint: NSLayoutConstraint) // This method will be deprecated in a future release and should be avoided.  Instead set NSLayoutConstraint's active property to NO.
//    
//    public func removeConstraints(constraints: [NSLayoutConstraint])
    // 当一个自定义view的某个属性发生改变， 并且可能影响到constraint时需要调用此方法去标记constraint需要在未来的某个点更新, 系统然后调用updateConstraints
//    [redView setNeedsUpdateConstraints];
    // constraint-based layout system 使用此返回值去决定是否需要调用updateConstraints作为正常布局过程的一部分
//    [redView needsUpdateConstraints];
    // 自定义view应该重写此方法在其中建立constraints ，注意: 要在实现的最后调用[super updateConstraints]
//    [redView updateConstraints];
    // 立即触发约束更新， 自动更新布局
//    [redView updateConstraintsIfNeeded];
    // 禁用autoresing
//    redView.translatesAutoresizingMaskIntoConstraints = NO;
//    意思就是基于约束的布局是懒触发的，只有在添加了约束的情况下，系统才会自动调用 -updateConstraints 方法，如果把所有的约束放在 updateConstraints中，那么系统将会不知道你的布局方式是基于约束的，所以 重写+requiresConstraintBasedLayout 返回YES就是明确告诉系统：虽然我之前没有添加约束,但我确实是基于约束的布局！这样可以保证系统一定会调用 -updateConstraints 方法 从而正确添加约束.
    
//    requiresConstraintBasedLayout
    
    AlignmentView *alignmentView = [[AlignmentView alloc] init];
    alignmentView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:alignmentView];
    alignmentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[alignmentView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor]];
    [self.view addConstraint:[alignmentView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100]];
//    [alignmentView addConstraint:[alignmentView.heightAnchor constraintEqualToConstant:20]] ;
//    [alignmentView addConstraint:[alignmentView.widthAnchor constraintEqualToConstant:20]] ;
    // 返回满足约束条件的大小
    CGSize size = [alignmentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    CGSize size = [alignmentView systemLayoutSizeFittingSize:<#(CGSize)#> withHorizontalFittingPriority:<#(UILayoutPriority)#> verticalFittingPriority:<#(UILayoutPriority)#>]
    // 返回某个方向的约束
    NSLog(@"%@", [alignmentView constraintsAffectingLayoutForAxis:UILayoutConstraintAxisHorizontal]);
    // 是否有冲突越苏
    NSLog(@"%d", [alignmentView hasAmbiguousLayout]);
    [alignmentView exerciseAmbiguityInLayout];
    // 生成位图拷贝
    UIView *snap = [alignmentView snapshotViewAfterScreenUpdates:YES];
    [self.view addSubview: snap];
    // 截取部分视图显示
//    [self.view resizableSnapshotViewFromRect:<#(CGRect)#> afterScreenUpdates:<#(BOOL)#> withCapInsets:<#(UIEdgeInsets)#>]
    // 将上下文写入当前上下文对象
//    drawViewHierarchyInRect
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    UIView *orange = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    orange.backgroundColor = [UIColor orangeColor];
    orange.center = self.view.center;
    [self.view addSubview:orange];
//    [UIView animateWithDuration:0.25 animations:^{
//        orange.frame = CGRectMake(self.view.center.x, self.view.center.y, 100, 100);
//    }];
    
//    [UIView animateWithDuration:0.25 animations:^{
//          orange.frame = CGRectMake(self.view.center.x, self.view.center.y, 100, 100);
//    } completion:^(BOOL finished) {
//        [orange removeFromSuperview];
//    }];
    
//    [UIView animateWithDuration:0.25 delay:0.25 options:UIViewAnimationOptionShowHideTransitionViews animations:^{
//         orange.frame = CGRectMake(self.view.center.x, self.view.center.y, 100, 100);
//    } completion:^(BOOL finished) {
//        [orange removeFromSuperview];
//    }];
    
//    Spring 动画
//    [UIView animateWithDuration:0.25 delay:0.25 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionRepeat animations:^{
//        orange.frame = CGRectMake(self.view.center.x, self.view.center.y, 100, 100);
//    } completion:^(BOOL finished) {
//         [orange removeFromSuperview];
//    }];
    
//    [orange removeFromSuperview];
//    orange.frame = self.view.bounds;
//     [self.view addSubview:orange];
//    UIView *black = [[UIView alloc] initWithFrame:self.view.bounds];
//    black.backgroundColor = [UIColor blueColor];
//    
//    转场动画
//    [UIView transitionFromView:orange toView:black duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
//        [orange removeFromSuperview];
//        [self.view addSubview:black];
//    }];
    //系统动画
//    [UIView performSystemAnimation:UISystemAnimationDelete onViews:@[orange] options:UIViewAnimationOptionCurveLinear animations:^{
//        orange.frame = self.view.bounds;
//    } completion:^(BOOL finished) {
//        
//    }];
    // 关键帧动画
//    [UIView animateKeyframesWithDuration:6 delay:1 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
//        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1/3 animations:^{
//            orange.backgroundColor = [UIColor blueColor];
//        }];
//        [UIView addKeyframeWithRelativeStartTime:1/3 relativeDuration:1/3 animations:^{
//            orange.backgroundColor = [UIColor redColor];
//        }];
//        [UIView addKeyframeWithRelativeStartTime:2/3 relativeDuration:1 animations:^{
//           orange.backgroundColor = [UIColor cyanColor];
//        }];
//    } completion:^(BOOL finished) {
//        orange.backgroundColor = [UIColor whiteColor];
//    }];
    // Motion
//    UIInterpolatingMotionEffect * xEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
//    xEffect.minimumRelativeValue =  [NSNumber numberWithFloat:-40.0];
//    xEffect.maximumRelativeValue = [NSNumber numberWithFloat:40.0];
//    [orange addMotionEffect:xEffect];
}



@end
