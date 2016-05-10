//
//  UIViewController+Config.m
//  UIKit
//
//  Created by ywl on 16/5/10.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UIViewController+Config.h"
#import "objc/runtime.h"
#import "ViewController.h"

@implementation UIViewController (Config)
+ (void)load
{
    Method original = class_getInstanceMethod(self, @selector(viewWillAppear:));
    Method swizzedMethod = class_getInstanceMethod(self, @selector(wl_viewWillAppear:));
    method_exchangeImplementations(original, swizzedMethod);
}

- (void)wl_viewWillAppear:(BOOL)animated
{
   
    [self wl_viewWillAppear:animated];
//    NSLog(@"%@", self);
//    if (![self isMemberOfClass:[ViewController class]]) {
////         self.view.backgroundColor = [UIColor redColor];
//    }
   
}

@end
