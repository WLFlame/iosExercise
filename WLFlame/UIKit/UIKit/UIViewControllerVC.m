//
//  UIViewControllerVC.m
//  UIKit
//
//  Created by ywl on 16/5/16.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UIViewControllerVC.h"

@interface UIViewControllerVC ()

@end

@implementation UIViewControllerVC

- (void)loadView
{
    UITableView *red = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    red.backgroundColor = [UIColor redColor];
    self.view = red;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"%@", self.view);
    NSLog(@"%@", self.traitCollection);
    // 是否包含其他样式
    NSLog(@"%d", [self.traitCollection containsTraitsInCollection:nil]);
    NSLog(@"%ld", (long)self.traitCollection.userInterfaceIdiom);
    // 显示尺寸
    NSLog(@"%f", self.traitCollection.displayScale);
    // 水平的sizeclass
    NSLog(@"%ld", (long)self.traitCollection.horizontalSizeClass);
    // 垂直的sizeclass
     NSLog(@"%ld", (long)self.traitCollection.verticalSizeClass);
    // 是否加载到了缓存中, 调用[super viewdidload] 就加载到了缓存中
    NSLog(@"%d", self.isViewLoaded);
    // 从nib中加载的nibname
    NSLog(@"%@", self.nibName);
    // 从nib加载的nibBundle(非nib也不为nil)
    NSLog(@"%@", self.nibBundle);
    // 从storyboard加载
    NSLog(@"%@", self.storyboard);
    [self forsegue];
}

// segue跳转之前执行
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}

- (void)forsegue
{
    // 通过segue跳转, should方法有bug
    
//    if ([self shouldPerformSegueWithIdentifier:@"sdfasf" sender:nil]) {
//        [self performSegueWithIdentifier:@"sdasf" sender:nil];
//    }
    
}

// 样式发生改变
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection
{
    NSLog(@"previousTraitCollection %@", previousTraitCollection);
}



@end
