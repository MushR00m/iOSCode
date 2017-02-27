//
//  main.m
//  Key模糊处理
//
//  Created by chensongqi on 17/2/27.
//  Copyright © 2017年 chensongqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>


@interface NSString (NWDHash)

- (NSString *)nwdsha1;
+ (NSString *)obfuscate:(NSString *)string withKey:(NSString *)key;

@end

@implementation NSString (NWDHash)

- (NSString *)nwdsha1
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (int)data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return output;
}

+ (NSString *)obfuscate:(NSString *)string withKey:(NSString *)key
{
    // Create data object from the string
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    // Get pointer to data to obfuscate
    char *dataPtr = (char *) [data bytes];
    
    // Get pointer to key data
    char *keyData = (char *) [[key dataUsingEncoding:NSUTF8StringEncoding] bytes];
    
    // Points to each char in sequence in the key
    char *keyPtr = keyData;
    int keyIndex = 0;
    
    // For each character in data, xor with current value in key
    for (int x = 0; x < [data length]; x++)
    {
        // Replace current character in data with
        // current character xor'd with current key value.
        // Bump each pointer to the next character
        // *dataPtr = *dataPtr++ ^ *keyPtr++;
        *dataPtr = *dataPtr ^ *keyPtr;
        dataPtr++;
        keyPtr++;
        
        // If at end of key data, reset count and
        // set key pointer back to start of key value
        if (++keyIndex == [key length])
            keyIndex = 0, keyPtr = keyData;
    }
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end

/*
 <56000e73 24200c71 7c527323 77035221 52757d07 72270c07 7e765104 02740b0b 5b>
 
 unsigned char obfuscatedKey1[] = {
 0X56, 0X00, 0X0E, 0X73, 0X24, 0X20, 0X0C, 0X71, 0X7C, 0X52, 0X73, 0X23,
 0X77, 0X03, 0X52, 0X21, 0X52, 0X75, 0X7D, 0X07, 0X72, 0X27, 0X0C, 0X07,
 0X7E, 0X76, 0X51, 0X04, 0X02, 0X74, 0X0B, 0X0B, 0X5B
 };

 */

//
// Obfuscate / Encrypt a String (NSString)
// http://www.cnblogs.com/KiloNet/archive/2011/01/12/1823480.html
//
// Storing obfuscated secret keys in your iOS app
// http://www.splinter.com.au/2014/09/16/storing-secret-keys/
//

#import <dlfcn.h>
#import <sys/types.h>

typedef int (*ptrace_ptr_t)(int _request, pid_t _pid, caddr_t _addr, int _data);
#if !defined(PT_DENY_ATTACH)
#define PT_DENY_ATTACH 31
#endif  // !defined(PT_DENY_ATTACH)

void disable_gdb() {
    void* handle = dlopen(0, RTLD_GLOBAL | RTLD_NOW);
    ptrace_ptr_t ptrace_ptr = dlsym(handle, "ptrace");
    ptrace_ptr(PT_DENY_ATTACH, 0, 0, 0);
    dlclose(handle);
}

int main(int argc, const char * argv[]) {
#if !(DEBUG) // Don't interfere with Xcode debugging sessions.
    disable_gdb();
#endif
    @autoreleasepool {
        NSString *someStr = @"376BAF4DE4BAB26C6AD7EE83FD334E39n";
        NSString *someStr2 = [someStr nwdsha1];
        NSString *someStr3 = [NSString obfuscate:someStr withKey:@"e781ef859f1b51dbd4907b4482b761825421b5d4"];
        NSLog(@"someStr2 = %@,  someStr3 = %@",someStr2,someStr3);
    }
    return 0;
}
