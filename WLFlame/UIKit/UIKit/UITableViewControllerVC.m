//
//  UITableViewControllerVC.m
//  UIKit
//
//  Created by ywl on 16/5/16.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UITableViewControllerVC.h"

@interface UITableViewControllerVC ()

@end

@implementation UITableViewControllerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    self.clearsSelectionOnViewWillAppear = YES;
    self.refreshControl = [[UIRefreshControl alloc] init];
    // 设置颜色
    self.refreshControl.tintColor = [UIColor cyanColor];
    NSAttributedString *attriStr = [[NSAttributedString alloc] initWithString:@"正在拼命加载中" attributes:@{
                                                                                                      NSFontAttributeName : [UIFont systemFontOfSize:12],
                                                                                                      NSForegroundColorAttributeName : [UIColor cyanColor]
                                                                                                      }];
    // 设置这个高度会不正常
//    self.refreshControl.attributedTitle = attriStr;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

@end
