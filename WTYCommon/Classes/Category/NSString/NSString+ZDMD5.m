//
//  NSString+ZDMD5.m
//  ZhidianLife
//
//  Created by oujie on 16/7/5.
//  Copyright © 2016年 oujie. All rights reserved.
//

#import "NSString+ZDMD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (ZDMD5)

- (NSString *)md5Value
{
    const char *cStr = [self UTF8String];
    
    unsigned char digest[32];
    
    CC_MD5( cStr, (unsigned)strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}
@end
