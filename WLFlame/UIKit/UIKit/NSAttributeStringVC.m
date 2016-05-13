//
//  NSAttributeStringVC.m
//  UIKit
//
//  Created by ywl on 16/5/10.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "NSAttributeStringVC.h"

@interface NSAttributeStringVC ()

@end

@implementation NSAttributeStringVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 段落样式
    NSMutableParagraphStyle *paragraph      = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing                   = 10;
    paragraph.paragraphSpacing              = 20;
    paragraph.alignment                     = NSTextAlignmentLeft;
//    paragraph.headIndent = 15;
//    paragraph.tailIndent = 15;
    paragraph.firstLineHeadIndent           = 10;
    paragraph.lineBreakMode                 = NSLineBreakByCharWrapping;
    paragraph.baseWritingDirection          = NSWritingDirectionLeftToRight;
    paragraph.paragraphSpacingBefore        = 10;
    // tab
    NSTextTab *tab                          = [[NSTextTab alloc] initWithTextAlignment:NSTextAlignmentRight location:20 options:@{ NSFontAttributeName : [UIFont systemFontOfSize:30] }];

    [paragraph addTabStop:tab];

    NSShadow *shadownStyle = [[NSShadow alloc] init];
    shadownStyle.shadowColor = [UIColor blueColor];
    shadownStyle.shadowOffset = CGSizeMake(1, 1);
    shadownStyle.shadowBlurRadius = 0.3;
    
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed:@"text"];
    attachment.bounds = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width);
    
    NSDictionary *attrs                     = @{
                            // 字体样式
                            NSFontAttributeName : [UIFont systemFontOfSize:15],
                            // 段落样式
                            NSParagraphStyleAttributeName : [paragraph copy],
                            // 字色
                            NSForegroundColorAttributeName : [UIColor orangeColor],
                            // 背景色
                            NSBackgroundColorAttributeName : [UIColor cyanColor],
                            // 字间距
                            NSKernAttributeName : @5,
                            // 删除线
                            NSStrikethroughStyleAttributeName : @(NSUnderlineStyleThick),
                            // 下划线
                            NSUnderlineStyleAttributeName :  @(NSUnderlineStyleThick),
                            // 描边颜色
                            NSStrokeColorAttributeName : [UIColor redColor],
                            // 描边宽度
                            NSStrokeWidthAttributeName : @3,
                            // 阴影
                            NSShadowAttributeName : shadownStyle,
                            // 文字效果
//                            NSTextEffectAttributeName : NSTextEffectLetterpressStyle
                            // 附件
                            NSAttachmentAttributeName : attachment,
                            // 链接
//                            NSLinkAttributeName :
                            NSBaselineOffsetAttributeName : @(1),
                            // 下滑线颜色
                            NSUnderlineColorAttributeName : [UIColor greenColor],
                            // 删除线颜色
                            NSStrikethroughColorAttributeName : [UIColor orangeColor],
                            // 倾斜角度
                            NSObliquenessAttributeName : @1,
                            // 横向拉升, 扁平化
                            NSExpansionAttributeName : @1,
                            // 字形方向
                            NSVerticalGlyphFormAttributeName : @0
                            };
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:@"据新华社兰州5月9日电 5月9日上午，在黄河兰州段地面以下40米深处，中国铁建十四局集团“金城四号”盾构机从黄河北岸中间风井缓缓破洞而出，我国首条“穿黄”地铁——兰州地铁隧道1号线右线顺利贯通。兰州轨道交通成功穿越黄河河床、大堤等重大风险源，为年底全线洞通奠定了基础。\n据新华社兰州5月9日电 5月9日上午，在黄河兰州段地面以下40米深处，中国铁建十四局集团“金城四号”盾构机从黄河北岸中间风井缓缓破洞而出，我国首条“穿黄”地铁——兰州地铁隧道1号线右线顺利贯通。兰州轨道交通成功穿越黄河河床、大堤等重大风险源，为年底全线洞通奠定了基础。" attributes:attrs];
    

    [attributeStr appendAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
    
    UITextView *textView                    = [[UITextView alloc] init];
    textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    textView.attributedText                 = attributeStr;
    textView.frame                          = self.view.bounds;
    [self.view addSubview:textView];
}


@end
