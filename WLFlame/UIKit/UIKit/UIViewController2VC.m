//
//  UIViewController2VC.m
//  UIKit
//
//  Created by ywl on 16/5/16.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UIViewController2VC.h"

@interface UIViewController2VC ()

@end

@implementation UIViewController2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender
{
    return YES;
}

@end
