//
//  QFFileDownloadRequestPacket.h
//  TCPServer
//
//  Created by chen cheng on 14-9-26.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFPacket.h"

@interface QFFileDownloadRequestPacket : QFPacket
{
    uint32_t  _fileNameLength; //要下载的文件的文件名的长度
    uint8_t   *_fileName;
}

- (id)initWithFileName:(NSString *)fileName;

@end
