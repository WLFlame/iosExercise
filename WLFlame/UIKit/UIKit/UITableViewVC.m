//
//  UITableViewVC.m
//  UIKit
//
//  Created by ywl on 16/5/11.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UITableViewVC.h"

@interface UITableViewVC () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation UITableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];

    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
}



@end
