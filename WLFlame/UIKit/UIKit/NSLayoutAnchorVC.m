//
//  NSLayoutAnchorVC.m
//  UIKit
//
//  Created by ywl on 16/5/10.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "NSLayoutAnchorVC.h"

@interface NSLayoutAnchorVC ()

@end

@implementation NSLayoutAnchorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *red = [[UIView alloc] init];
    [self.view addSubview:red];
    red.translatesAutoresizingMaskIntoConstraints = NO;
    red.backgroundColor = [UIColor redColor];
    
    [self.view addConstraint:[red.topAnchor constraintEqualToAnchor:self.view.topAnchor]];
    [self.view addConstraint:[red.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10]];
    [self.view addConstraint:[red.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:10]];
    [red addConstraint:[red.heightAnchor constraintEqualToConstant:100]];
}



@end
