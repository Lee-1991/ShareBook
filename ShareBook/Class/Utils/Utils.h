//
//  Utils.h
//  ShareBook
//
//  Created by Lee on 2017/8/13.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject


/**
 判断字符串是否为空，nil或长度为0都是空
 */
+ (BOOL)isEmpty:(NSString*) str;

/**
 将字符串MD5
 */
+ (NSString*)md5HexDigest:(NSString*)input;


/**
 获取当前的版本号
 */
+ (int)bundleVersion;


@end
