//
//  NSTextStorageVC.m
//  UIKit
//
//  Created by ywl on 16/5/13.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "NSTextStorageVC.h"
#import "BlodTextStorage.h"
@interface NSTextStorageVC ()

@end

@implementation NSTextStorageVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // 懒惰去修复属性
//    fixesAttributesLazily
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleBody]
                                 };
    NSString *content = @"人生有酒须当醉 一滴何曾到九泉";
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:content attributes:attributes];
    BlodTextStorage *storage = [[BlodTextStorage alloc] init];
    [storage setAttributedString:attributedString];
    
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height)];
    [layoutManager addTextContainer:textContainer];
    [storage addLayoutManager:layoutManager];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:self.view.bounds textContainer:textContainer];
    [self.view addSubview:textView];
}

@end
