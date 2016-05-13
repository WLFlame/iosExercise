//
//  BlodTextStorage.m
//  UIKit
//
//  Created by ywl on 16/5/13.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "BlodTextStorage.h"

@interface BlodTextStorage()

@property (nonatomic, strong) NSMutableAttributedString *attributeString;
@property (nonatomic, strong) NSDictionary *replacements;
@end

@implementation BlodTextStorage

- (instancetype)init
{
    self = [super init];
    if (self) {
        _attributeString = [[NSMutableAttributedString alloc] init];
        [self createMarkupStyledPatterns];
    }
    return self;
}

- (NSString *)string
{
    return _attributeString.string;
}

- (NSDictionary<NSString *,id> *)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range
{
    return [_attributeString attributesAtIndex:location effectiveRange:range];
}

- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str
{
    [self beginEditing];
    [_attributeString replaceCharactersInRange:range withString:str];
    [self edited:NSTextStorageEditedAttributes | NSTextStorageEditedCharacters range:range changeInLength:str.length - range.length];
    [self endEditing];
}

- (void)setAttributes:(NSDictionary<NSString *,id> *)attrs range:(NSRange)range
{
    [self beginEditing];
    [_attributeString setAttributes:attrs range:range];
    [self edited:NSTextStorageEditedAttributes range:range changeInLength:0];
    [self endEditing];
}

- (void)processEditing
{
    // 指定范围内的属性无效
//    invalidateAttributesInRange
    // 确定属性fixed
    // ensureAttributesAreFixedInRange
    [self performReplacementsForRange:[self editedRange]];
    [super processEditing];
}
- (void)performReplacementsForRange:(NSRange)changedRange
{
    NSRange extendedRange = NSUnionRange(changedRange, [[_attributeString string]
                                                        lineRangeForRange:NSMakeRange(changedRange.location, 0)]);
    NSLog(@"%lu", _attributeString.length);
    extendedRange = NSUnionRange(changedRange, [[_attributeString string]
                                                lineRangeForRange:NSMakeRange(NSMaxRange(changedRange)-1, 0)]);
    [self applyStylesToRange:extendedRange];
}

- (NSDictionary*)createAttributesForFontStyle:(NSString*)style
                                    withTrait:(uint32_t)trait {
    UIFontDescriptor *fontDescriptor = [UIFontDescriptor
                                        preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    
    UIFontDescriptor *descriptorWithTrait = [fontDescriptor
                                             fontDescriptorWithSymbolicTraits:trait];
    
    UIFont* font =  [UIFont fontWithDescriptor:descriptorWithTrait size: 0.0];
    return @{ NSFontAttributeName : font };
}

- (void)createMarkupStyledPatterns
{
    UIFontDescriptor *scriptFontDescriptor =
    [UIFontDescriptor fontDescriptorWithFontAttributes:
     @{UIFontDescriptorFamilyAttribute: @"Bradley Hand"}];
    
    // 1. base our script font on the preferred body font size
    UIFontDescriptor* bodyFontDescriptor = [UIFontDescriptor
                                            preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    NSNumber* bodyFontSize = bodyFontDescriptor.
    fontAttributes[UIFontDescriptorSizeAttribute];
    UIFont* scriptFont = [UIFont
                          fontWithDescriptor:scriptFontDescriptor size:[bodyFontSize floatValue]];
    
    // 2. create the attributes
    NSDictionary* boldAttributes = [self
                                    createAttributesForFontStyle:UIFontTextStyleBody
                                    withTrait:UIFontDescriptorTraitBold];
    NSDictionary* italicAttributes = [self
                                      createAttributesForFontStyle:UIFontTextStyleBody
                                      withTrait:UIFontDescriptorTraitItalic];
    NSDictionary* strikeThroughAttributes = @{ NSStrikethroughStyleAttributeName : @1,
                                               NSForegroundColorAttributeName: [UIColor redColor]};
    NSDictionary* scriptAttributes = @{ NSFontAttributeName : scriptFont,
                                        NSForegroundColorAttributeName: [UIColor blueColor]
                                        };
    NSDictionary* redTextAttributes =
    @{ NSForegroundColorAttributeName : [UIColor redColor]};
    
    _replacements = @{
                      @"(\\*\\*\\w+(\\s\\w+)*\\*\\*)" : boldAttributes,
                      @"(_\\w+(\\s\\w+)*_)" : italicAttributes,
                      @"(~~\\w+(\\s\\w+)*~~)" : strikeThroughAttributes,
                      @"(`\\w+(\\s\\w+)*`)" : scriptAttributes,
                      @"\\s([A-Z]{2,})\\s" : redTextAttributes
                      };
}

- (void)applyStylesToRange:(NSRange)searchRange
{
    NSDictionary* normalAttrs = @{NSFontAttributeName:
                                      [UIFont preferredFontForTextStyle:UIFontTextStyleBody]};
    for (NSString* key in _replacements) {
        NSRegularExpression *regex = [NSRegularExpression
                                      regularExpressionWithPattern:key
                                      options:0
                                      error:nil];
        
        NSDictionary* attributes = _replacements[key];
        
        [regex enumerateMatchesInString:[_attributeString string]
                                options:0
                                  range:searchRange
                             usingBlock:^(NSTextCheckingResult *match,
                                          NSMatchingFlags flags,
                                          BOOL *stop){
                                 // apply the style
                                 NSRange matchRange = [match rangeAtIndex:1];
                                 [self addAttributes:attributes range:matchRange];
                                 
                                 // reset the style to the original
                                 if (NSMaxRange(matchRange)+1 < self.length) {
                                     [self addAttributes:normalAttrs
                                                   range:NSMakeRange(NSMaxRange(matchRange)+1, 1)];
                                 }
                             }];
    }
}


@end
