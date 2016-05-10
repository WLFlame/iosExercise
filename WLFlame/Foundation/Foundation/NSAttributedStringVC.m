//
//  NSAttributedStringVC.m
//  Foundation
//
//  Created by ywl on 16/5/10.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "NSAttributedStringVC.h"

@interface NSAttributedStringVC ()

@end

@implementation NSAttributedStringVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:@"曾经沧海难为水，除却巫山不是云" attributes:@{
                                                                                                                  NSFontAttributeName : [UIFont systemFontOfSize:14],
                                                                                                                  NSForegroundColorAttributeName: [UIColor redColor]
                                                                                                                  }];
    NSLog(@"%@", attributeStr.string);
    NSRange range = NSMakeRange(0, attributeStr.string.length);
    NSDictionary *attritues = [attributeStr attributesAtIndex:0 effectiveRange:&range];
    NSLog(@"%@", attritues);
    
    [attributeStr enumerateAttribute:NSFontAttributeName inRange:range options:NSAttributedStringEnumerationReverse usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
        NSLog(@"%@", value);
        NSLog(@"location %lu length %lu", (unsigned long)range.location, (unsigned long)range.length);
    }];
    
    [attributeStr enumerateAttributesInRange:range options:NSAttributedStringEnumerationReverse usingBlock:^(NSDictionary<NSString *,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
        NSLog(@"%@", attrs);
        NSLog(@"location %lu length %lu", (unsigned long)range.location, (unsigned long)range.length);
    }];
    
    NSMutableAttributedString *mutableAttributedStr = [[NSMutableAttributedString alloc] initWithAttributedString:attributeStr];
    
    [mutableAttributedStr replaceCharactersInRange:NSMakeRange(0, 3) withString:@"abc"];
    [mutableAttributedStr setAttributes:@{
                                          NSForegroundColorAttributeName : [UIColor blueColor]
                                          } range:NSMakeRange(0, 3)];
    [mutableAttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, 3)];
     [mutableAttributedStr removeAttribute:NSFontAttributeName range:NSMakeRange(0, 3)];
    UITextView *textView = [[UITextView alloc] init];
    textView.frame = self.view.bounds;
    [self.view addSubview:textView];
    textView.attributedText = [mutableAttributedStr copy];
    
   
    NSMutableAttributedString *updateAttribute = [[NSMutableAttributedString alloc] initWithAttributedString:textView.attributedText];
    NSAttributedString *insertAttr = [[NSAttributedString alloc] initWithString:@"test" attributes:@{
                                                                                                     NSForegroundColorAttributeName : [UIColor cyanColor]
                                                                                                     }];
    [updateAttribute insertAttributedString:insertAttr atIndex:3];
    textView.attributedText = [updateAttribute copy];
}


@end








