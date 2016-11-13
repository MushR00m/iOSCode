//
//  QFAssetsTool.h
//  同步的方式获取系统照片
//
//  Created by chen cheng on 14-9-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QFAssetsTool : NSObject

+ (UIImage *)synchronousImageWithURL:(NSURL *)url;

@end
