//
//  BlodTextContainer.m
//  UIKit
//
//  Created by ywl on 16/5/13.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "BlodTextContainer.h"
#import "BlodTextStorage.h"
@implementation BlodTextContainer

- (instancetype)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        
    }
    return self;
}

- (CGRect)lineFragmentRectForProposedRect:(CGRect)proposedRect atIndex:(NSUInteger)characterIndex writingDirection:(NSWritingDirection)baseWritingDirection remainingRect:(CGRect *)remainingRect
{
    CGRect rect = [super lineFragmentRectForProposedRect:proposedRect atIndex:characterIndex writingDirection:baseWritingDirection remainingRect:remainingRect];
    CGSize size = [self size];
    CGFloat radius = fmin(size.width, size.height) / 2;
    CGFloat ypos = fabs((proposedRect.origin.y + proposedRect.size.height/2) - radius);
    CGFloat width = (ypos < radius) ? 2.0 * sqrt(radius * radius - ypos * ypos) : 0.0;
     CGRect circleRect = CGRectMake(radius - width / 2.0, proposedRect.origin.y, width, proposedRect.size.height);
      return CGRectIntersection(rect, circleRect);
}

@end
