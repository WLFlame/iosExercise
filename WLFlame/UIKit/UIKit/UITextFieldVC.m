//
//  UITextFieldVC.m
//  UIKit
//
//  Created by wanli.yang on 16/5/15.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UITextFieldVC.h"

@interface UITextFieldVC ()

@end

@implementation UITextFieldVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    [self.view addSubview:textField];
    textField.center = self.view.center;
    textField.textColor = [UIColor redColor];
//    textField.font
//    textField.textAlignment
    textField.borderStyle = UITextBorderStyleBezel;
    textField.defaultTextAttributes = @{
                                        NSForegroundColorAttributeName : [UIColor cyanColor]
                                        };
    textField.placeholder = @"动洽洽";
    NSAttributedString *attri = [[NSAttributedString alloc] initWithString:@"动洽洽" attributes:@{
                                                                                               NSForegroundColorAttributeName : [UIColor redColor],
                                                                                               NSFontAttributeName : [UIFont systemFontOfSize:17]
                                                                                               }];
    textField.attributedPlaceholder = attri;
    textField.clearsOnBeginEditing = YES;
    // 根据field宽度自动调整字体大小
    textField.adjustsFontSizeToFitWidth = YES;
    // 最小的字体大小
    textField.minimumFontSize = 11;
    // 背景图
//    textField.background
    // disable情况下背景图
    // disabledBackground
    textField.clearButtonMode = UITextFieldViewModeAlways;
    UIView *red = [UIView new];
    red.backgroundColor = [UIColor redColor];
    red.frame = CGRectMake(0, 0, 30, 30);
    textField.leftView = red;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *green = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    green.backgroundColor = [UIColor greenColor];
//    textField.rightView = green;
    textField.rightViewMode = UITextFieldViewModeAlways;
    
    // 子TextField重写 实现细微控制
    // 重写来重置边缘区域
    //    public func borderRectForBounds(bounds: CGRect) -> CGRect
     // 重写来重置文字区域
//    public func textRectForBounds(bounds: CGRect) -> CGRect
    // 重写来重置占位符区域
//    public func placeholderRectForBounds(bounds: CGRect) -> CGRect
    //重写来重置编辑区域
//    public func editingRectForBounds(bounds: CGRect) -> CGRect
//    重写来重置clearButton位置,改变size可能导致button的图片失真
//    public func clearButtonRectForBounds(bounds: CGRect) -> CGRect
//    public func leftViewRectForBounds(bounds: CGRect) -> CGRect
//    public func rightViewRectForBounds(bounds: CGRect) -> CGRect
//    改变绘文字属性.重写时调用super可以按默认图形属性绘制,若自己完全重写绘制函数，就不用调用super了.
//    public func drawTextInRect(rect: CGRect)
//    重写改变绘制占位符属性.重写时调用super可以按默认图形属性绘制,若自己完全重写绘制函数，就不用调用super了.
//    public func drawPlaceholderInRect(rect: CGRect)
}



@end
