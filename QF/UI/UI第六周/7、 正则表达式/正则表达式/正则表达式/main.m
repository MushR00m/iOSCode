//
//  main.m
//  正则表达式
//
//  Created by chen cheng on 14-7-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL isValidateEmail(NSString *email)
{
    NSString *emailRegex = @"[A-Z0-9a-z]+@[A-Za-z0-9]+\\.[A-Za-z]{2,4}";
    
    
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc] initWithPattern:emailRegex options:NSRegularExpressionCaseInsensitive error:nil];
    
    /*NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:email options:NSMatchingReportProgress range:NSMakeRange(0, email.length)];*/
    
    NSRange range = [regularexpression rangeOfFirstMatchInString:email options:NSMatchingReportProgress range:NSMakeRange(0, email.length)];
    
    NSLog(@"range.location = %lu, range.length = %lu email.length = %lu", range.location, range.length, email.length);
    
    if (range.location == 0
        && range.length == email.length)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


NSArray *findEmojiRanges(NSString *chatText)
{
    NSString *emojiRegex = @"\\[+[0-9]+\\]";
    
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc] initWithPattern:emojiRegex options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSArray *matchesArray = [regularexpression matchesInString:chatText options:NSMatchingReportProgress range:NSMakeRange(0, chatText.length)];
    
    return matchesArray;
}

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
       /* BOOL ret = isValidateEmail(@"chen@cheng0305@gmail.com");
        
        if (ret)
        {
            NSLog(@"合法邮箱\n");
        }
        else
        {
            NSLog(@"非法邮箱\n");
        }
        
        return 0;*/
        
        
        NSString  *chatText = @"[1]nihao[45]67";
        
        NSArray *matchesArray = findEmojiRanges(chatText);
        
        for (int i=0; i<[matchesArray count]; i++)
        {
            
            NSTextCheckingResult *matcheResult = [matchesArray objectAtIndex:i];
            
            NSLog(@"matcheResult = %@", matcheResult);
        }
    }
    return 0;
}

