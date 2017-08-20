//
//  Utils.h
//  ShareBook
//
//  Created by Lee on 2017/8/13.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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

+ (int) getScreenWidth;

+ (int) getScreenHeight;

+ (UIColor*) getUIColorFromHex : (unsigned) argb;

+ (void) removeAllChildren:(UIView*)view;

+ (CGSize)sizeWithString:(NSString *)_string andFont:(UIFont *)_font;

+ (CGSize)sizeWithString:(NSString *)_string andFont:(UIFont *)_font andBoundeSize:(CGSize)_size;

+ (UILabel*) getAutoWrapLabel : (UIFont*) font  text : (NSString*) _text;

+ (UILabel*) getAutoWrapLabel : (UIFont*) font  text : (NSString*) _text  width : (float) _width;


+ (UILabel*) getAutoWrapLabel : (UIFont*) font text : (NSString*) _text  size: (CGSize) _size;

+ (UIButton*)get3xAutoWrapButtonWithIconNormal:(UIImage*)_iconNormal iconHighlighted:(UIImage*)_iconHighlighted size:(CGSize)_size;

/**
 获取指定大小的按钮
 */
+ (UIButton*)getAutoWrapButtonWithIconNormal:(UIImage*)_iconNormal iconHighlighted:(UIImage*)_iconHighlighted size:(CGSize)_size;


/**
 获取一个随机整数，范围在[from,to），包括from，不包括to
 */
+(int)getRandomNumber:(int)fromNum to:(int)toNum;

@end
