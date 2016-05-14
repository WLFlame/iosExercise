//
//  UIEventVC.m
//  UIKit
//
//  Created by wanli.yang on 16/5/14.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UIEventVC.h"

@interface UIEventVC ()

@end

@implementation UIEventVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", event);
    NSLog(@"%ld", (long)event.type);
    NSLog(@"%ld", (long)event.subtype);
    NSLog(@"%f", event.timestamp);
    NSLog(@"%@", event.allTouches);
    NSLog(@"%@", [event touchesForWindow:self.view.window]);
    NSLog(@"%@", [event touchesForView:self.view]);
//    touchesForGestureRecognizer
}



@end
