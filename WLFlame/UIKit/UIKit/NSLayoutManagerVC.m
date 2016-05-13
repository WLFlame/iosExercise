//
//  NSLayoutManagerVC.m
//  UIKit
//
//  Created by ywl on 16/5/13.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "NSLayoutManagerVC.h"

#import "BlodTextStorage.h"
#import "BoldLayoutManager.h"
#import "BlodTextContainer.h"

@interface NSLayoutManagerVC ()

@end

@implementation NSLayoutManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 懒惰去修复属性
    //    fixesAttributesLazily
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleBody]
                                 };
    NSString *content = @"人生有酒须当醉 http://www.qqzq.com 一滴何曾到九泉 曾经沧海难为水 除却巫山不是云 床前明月光 疑是地上霜 举头望明月 地下鞋两双 连天地之悠悠 肚脐盎然儿踢下";
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:content attributes:attributes];
    BlodTextStorage *storage = [[BlodTextStorage alloc] init];
    [storage setAttributedString:attributedString];
    
    BoldLayoutManager *layoutManager = [[BoldLayoutManager alloc] init];
//    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    
    BlodTextContainer *textContainer = [[BlodTextContainer alloc] initWithSize:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height)];
    [layoutManager addTextContainer:textContainer];
    [storage addLayoutManager:layoutManager];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:self.view.bounds textContainer:textContainer];
    [self.view addSubview:textView];
    
}


@end
