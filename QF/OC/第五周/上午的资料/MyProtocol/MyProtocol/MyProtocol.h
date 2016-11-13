//
//  QFCoder.h
//  MyProtocol
//
//  Created by bencai on 14-8-13.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QFCoder <NSObject>
  //@required
- (void) code;
- (void) debug;
@optional
- (void) report;
@end

@protocol QFDocer <NSObject>

- (void) writeDocument;

@end
