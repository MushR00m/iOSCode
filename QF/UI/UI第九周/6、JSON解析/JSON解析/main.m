//
//  main.m
//  JSON解析
//
//  Created by chen cheng on 14-9-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSString  *jsonString = @"{ \"firstName\": \"Brett\", \"lastName\":\"McLaughlin\",\"email\": \"aaaa\" }";
        
        NSData  *jsonData = [NSData dataWithBytes:[jsonString UTF8String] length:strlen([jsonString UTF8String])];
        
        NSError *error = nil;
        
        //把JSON格式的数据转化成OC对象（不是字典就是数组）
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        if (error == nil)//解析成功
        {
            NSLog(@"email = %@", [jsonObject objectForKey:@"email"]);
        }
        else//解析失败
        {
            NSLog(@"error = %@", error);
        }
        
        
        NSString  *jsonString2 = @"[{ \"firstName\": \"Brett\", \"lastName\":\"McLaughlin\",\"email\": \"aaaa\" }, { \"firstName\": \"Brett2\", \"lastName\":\"McLaughlin2\",\"email\": \"aaaa2\" }]";
        
        NSData  *jsonData2 = [NSData dataWithBytes:[jsonString2 UTF8String] length:strlen([jsonString2 UTF8String])];
        
        NSArray *jsonObject2 = [NSJSONSerialization JSONObjectWithData:jsonData2 options:NSJSONReadingMutableContainers error:&error];
        if (error == nil)//解析成功
        {
            NSDictionary *dictionaryJsonObject = [jsonObject2 objectAtIndex:1];
            NSLog(@"22 email = %@", [dictionaryJsonObject objectForKey:@"email"]);
        }
        else//解析失败
        {
            NSLog(@"error = %@", error);
        }

        
       NSString  *jsonString3 = @"{\"people\": [ {  \"Name\": \"Bill\", \"Birthday\":\"1989/11/12\", \"Email\": \"bill@zte.com\"}, {  \"Name\": \"Biller\", \"Birthday\":\"1989/11/12\", \"Email\": \"bill@zte.com\" }, {  \"Name\": \"Aill\", \"Birthday\":\"1989/11/13\", \"Email\": \"bill@zte.com\" }]}";
        
        NSData  *jsonData3 = [NSData dataWithBytes:[jsonString3 UTF8String] length:strlen([jsonString3 UTF8String])];
        
        NSDictionary *jsonObject3 = [NSJSONSerialization JSONObjectWithData:jsonData3 options:NSJSONReadingMutableContainers error:&error];
        if (error == nil)//解析成功
        {
            NSArray  *peopleArray = [jsonObject3 objectForKey:@"people"];
            
            NSDictionary *people = [peopleArray objectAtIndex:1];
            
            NSString *name =  [people objectForKey:@"Name"];
            
            NSLog(@"name = %@", name);
        }
        else//解析失败
        {
            NSLog(@"error = %@", error);
        }
        
        
        
        NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"v1", @"k1", @"v2", @"k2", @"v3", @"k3", nil];
        
        // 把字典转化成JSON格式的数据
        NSData *jsonData4 = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
        if (error == nil)
        {
            NSString *jsonString4 = [[NSString alloc] initWithData:jsonData4 encoding:NSUTF8StringEncoding];
            
            NSLog(@"jsonString4  = %@", jsonString4);
            
            [jsonString4 release];
        }
        
        
    }
    return 0;
}

