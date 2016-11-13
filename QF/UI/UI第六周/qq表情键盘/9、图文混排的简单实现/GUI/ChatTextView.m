//
//  ChatTextView.m
//  图文混排的简单实现
//
//  Created by chen cheng on 14-8-25.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "ChatTextView.h"

@implementation ChatTextView


- (NSArray *)findEmojiRanges:(NSString *)chatText
{
    NSString *emojiRegex = @"\\[+[0-9]+\\]";
    
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc] initWithPattern:emojiRegex options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSArray *matchesArray = [regularexpression matchesInString:chatText options:NSMatchingReportProgress range:NSMakeRange(0, chatText.length)];
    
    return matchesArray;
    
}

- (void)setText:(NSString *)text
{
    NSString *newString = [text copy];
    [_text release];
    _text = newString;
    
    
    NSArray *subviews = [self subviews];
    for (int i=0; i < [subviews count]; i++)
    {
        UIView  *subview = [subviews objectAtIndex:i];
        
        if (subview != _backgroundImageView)
        {
            [subview removeFromSuperview];
        }
    }
    
    if (_text == nil || [_text length] == 0)
    {
        return;
    }
    
    
    CGFloat currentX = 10;
    CGFloat currentY = 0;
    
    CGFloat emojiWidth = 20;
    CGFloat emojiHeight = 20;
    
    
    NSArray *matchRanges = [self findEmojiRanges:text];
    
    for (int i=0; i<[matchRanges count]+1; i++)
    {
        int beginIndex = 0;
        int endIndex = 0;
        

        if ([matchRanges count] == 0)
        {
            beginIndex = 0;
            endIndex = [_text length]-1;
        }
        else if (i == 0)
        {
            beginIndex = 0;
            
            NSTextCheckingResult *result = [matchRanges objectAtIndex:0];
            endIndex = result.range.location-1;
        }
        else if (i == [matchRanges count])
        {
            NSTextCheckingResult *result = [matchRanges objectAtIndex:[matchRanges count]-1];
            
            beginIndex = result.range.location + result.range.length;
            endIndex = [_text length]-1;
        }
        else
        {
            NSTextCheckingResult *result1 = [matchRanges objectAtIndex:i-1];
            
            beginIndex = result1.range.location + result1.range.length;
            
            NSTextCheckingResult *result2 = [matchRanges objectAtIndex:i];
            
            endIndex = result2.range.location - 1;
        }
        
        for (int j=beginIndex; j<=endIndex; j++)
        {
            unichar ch = [_text characterAtIndex:j];
            
            NSString *tempStr = [NSString stringWithFormat:@"%C", ch];
            
            CGRect tempStrRect = [tempStr boundingRectWithSize:CGSizeMake(1000, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:20], NSFontAttributeName, nil] context:nil];
            
            UILabel  *label = [[UILabel alloc] initWithFrame:CGRectMake(currentX, currentY, tempStrRect.size.width, tempStrRect.size.height)];
            //label.backgroundColor = [UIColor greenColor];
            label.text = tempStr;

            
            [self addSubview:label];
            
            //换行
            if (currentX + tempStrRect.size.width > self.frame.size.width-20)
            {
                currentX = 10;
                currentY += tempStrRect.size.height;
            }
            else
            {
                currentX += tempStrRect.size.width;
            }
        
            [label release];
        }
        
        if (i < [matchRanges count])
        {
            UIImageView *emojiImageView = [[UIImageView alloc] initWithFrame:CGRectMake(currentX, currentY, emojiWidth, emojiHeight)];
            
            NSTextCheckingResult *result = [matchRanges objectAtIndex:i];
            
            NSString *emojiName = [_text substringWithRange:NSMakeRange(result.range.location+1, result.range.length-2)];
            
            emojiImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", emojiName]];
            
            [self addSubview:emojiImageView];
            
            [emojiImageView release];
            
            
            //换行
            if (currentX + emojiWidth > self.frame.size.width-20)
            {
                currentX = 10;
                currentY += emojiHeight;
            }
            else
            {
                currentX += emojiWidth;
            }
        }
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
          _backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        
        UIImage  *image = [UIImage imageNamed:@"balloon_file_right_green.png"];
        
        UIEdgeInsets edgeInsets;
        edgeInsets.left = 20;
        edgeInsets.top = 20;
        edgeInsets.right = 20;
        edgeInsets.bottom = 20;
        
        _backgroundImageView.image = [image resizableImageWithCapInsets:edgeInsets];
        
        [self addSubview:_backgroundImageView];
   }
    return self;
}


@end
