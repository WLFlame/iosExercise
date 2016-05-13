//
//  BoldLayoutManager.m
//  UIKit
//
//  Created by ywl on 16/5/13.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "BoldLayoutManager.h"

@interface BoldLayoutManager() <NSLayoutManagerDelegate>

@end

@implementation BoldLayoutManager

- (instancetype)init
{
    if (self = [super init]) {
        self.delegate = self;
        // 使用特殊字符占用空格位置
        self.showsInvisibleCharacters = YES;
        // 控制字符使用特殊字符替代
        self.showsControlCharacters = YES;
        // 启用断字
        self.hyphenationFactor = 1.0;
        // 根据字体设置边距
        self.usesFontLeading = YES;
        // 允许不连续的布局
        self.allowsNonContiguousLayout = YES;
    }
    return self;
}

#pragma mark --- NSLayoutManagerDelegate
// 行距
- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager lineSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(CGRect)rect
{
    return floorf(glyphIndex / 100);
}

// 断字
- (BOOL)layoutManager:(NSLayoutManager *)layoutManager shouldBreakLineByWordBeforeCharacterAtIndex:(NSUInteger)charIndex
{
    NSRange range;
    NSURL *linkURL = [layoutManager.textStorage attribute:NSLinkAttributeName
                                                  atIndex:charIndex
                                           effectiveRange:&range];
    
    return !(linkURL && charIndex > range.location && charIndex <= NSMaxRange(range));
}
// 形状改变
- (void)layoutManager:(NSLayoutManager *)layoutManager textContainer:(NSTextContainer *)textContainer didChangeGeometryFromSize:(CGSize)oldSize
{
    NSLog(@"width %f height %f", oldSize.width, oldSize.height);
}

// 完成布局
- (void)layoutManager:(NSLayoutManager *)layoutManager didCompleteLayoutForTextContainer:(NSTextContainer *)textContainer atEnd:(BOOL)layoutFinishedFlag
{
    
}

- (NSUInteger)layoutManager:(NSLayoutManager *)layoutManager shouldGenerateGlyphs:(const CGGlyph *)glyphs properties:(const NSGlyphProperty *)props characterIndexes:(const NSUInteger *)charIndexes font:(UIFont *)aFont forGlyphRange:(NSRange)glyphRange
{
    return 0;
}

// 段落间距 在字形之前
- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager paragraphSpacingBeforeGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(CGRect)rect
{
    return 10;
}

// 段落间距 在字形之后
- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager paragraphSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(CGRect)rect
{
    return 1;
}


- (NSControlCharacterAction)layoutManager:(NSLayoutManager *)layoutManager shouldUseAction:(NSControlCharacterAction)action forControlCharacterAtIndex:(NSUInteger)charIndex
{
    return NSControlCharacterActionWhitespace;
}


- (BOOL)layoutManager:(NSLayoutManager *)layoutManager shouldBreakLineByHyphenatingBeforeCharacterAtIndex:(NSUInteger)charIndex
{
    return YES;
}

- (CGRect)layoutManager:(NSLayoutManager *)layoutManager boundingBoxForControlGlyphAtIndex:(NSUInteger)glyphIndex forTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)proposedRect glyphPosition:(CGPoint)glyphPosition characterIndex:(NSUInteger)charIndex
{
    return CGRectZero;
}

- (BOOL)layoutManager:(NSLayoutManager *)layoutManager shouldSetLineFragmentRect:(inout CGRect *)lineFragmentRect lineFragmentUsedRect:(inout CGRect *)lineFragmentUsedRect baselineOffset:(inout CGFloat *)baselineOffset inTextContainer:(NSTextContainer *)textContainer forGlyphRange:(NSRange)glyphRange
{
    return YES;
}


- (void)layoutManagerDidInvalidateLayout:(NSLayoutManager *)sender
{

}


@end











