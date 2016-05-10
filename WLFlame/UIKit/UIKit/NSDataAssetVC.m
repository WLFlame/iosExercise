//
//  NSDataAssetVC.m
//  UIKit
//
//  Created by ywl on 16/5/10.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "NSDataAssetVC.h"

@interface NSDataAssetVC ()

@end

@implementation NSDataAssetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSDataAsset *asset = [[NSDataAsset alloc] initWithName:@"ppt_dataasset"];
    NSLog(@"name %@", asset.name);
    NSLog(@"typeIdentifier %@", asset.typeIdentifier);
    NSLog(@"%@" , asset);
}


@end
