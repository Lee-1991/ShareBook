//
//  Utils.m
//  ShareBook
//
//  Created by Lee on 2017/8/13.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "Utils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Utils

+ (BOOL) isEmpty : (NSString*) str
{
    if (str == nil || str.length == 0 || str == NULL)
    {
        return  YES;
    }
    else
    {
        return NO;
    }
}

+ (NSString *)md5HexDigest:(NSString*)input
{
    int length = CC_MD5_DIGEST_LENGTH;
    const char* str = [input UTF8String];
    unsigned char result[length];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:length];
    
    for(int i = 0; i < length; i++)
    {
        [ret appendFormat:@"%02X",result[i]];
    }
    
    return [ret lowercaseString];
}

+ (int)bundleVersion
{
    return [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"] intValue];
}

@end
