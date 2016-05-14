//
//  AlignmentView.m
//  UIKit
//
//  Created by wanli.yang on 16/5/14.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "AlignmentView.h"

@implementation AlignmentView

- (CGRect)alignmentRectForFrame:(CGRect)frame
{
    return CGRectMake(0, 0, 100, 100);
}

- (CGRect)frameForAlignmentRect:(CGRect)alignmentRect
{
     return CGRectMake(0, 0, 100, 100);
}

// 固有尺寸大小
- (CGSize)intrinsicContentSize
{
    return CGSizeMake(100, 200);
}

@end
