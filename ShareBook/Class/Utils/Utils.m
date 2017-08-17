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

+ (int) getScreenWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}

+ (int) getScreenHeight
{
    return  [UIScreen mainScreen].bounds.size.height;
}

+ (UIColor*) getUIColorFromHex : (unsigned) argb
{
    int alpha = argb >> 24;
    int red = (argb & 0xff0000) >> 16;
    int green = (argb & 0xff00) >> 8;
    int blue = argb & 0xff;
    return [UIColor colorWithRed:((float) red / 255.0f)
                           green:((float) green / 255.0f)
                            blue:((float) blue / 255.0f)
                           alpha:alpha / 255.0f];
}

+ (void) removeAllChildren : (UIView*) view
{
    if (!view)
    {
        return;
    }
    
    for (UIView* child in view.subviews)
    {
        [child removeFromSuperview];
    }
}

+ (CGSize)sizeWithString:(NSString *)_string andFont:(UIFont *)_font{
    CGSize size;
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:_font, NSFontAttributeName,nil];
    size = [_string sizeWithAttributes:attributes];
    
    return size;
}

+ (CGSize)sizeWithString:(NSString *)_string andFont:(UIFont *)_font andBoundeSize:(CGSize)_size
{
    CGSize  size = CGSizeZero;
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:_font, NSFontAttributeName,nil];
    CGRect rect = [_string boundingRectWithSize:_size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    size = rect.size;
    
    return size;
}

+ (UILabel*) getAutoWrapLabel : (UIFont*) font  text : (NSString*) _text
{
    return [self getAutoWrapLabel:font text:_text size:CGSizeMake(ScreenW, ScreenH)];
}

+ (UILabel*) getAutoWrapLabel : (UIFont*) font  text : (NSString*) _text  width : (float) _width
{
    if (font == nil)
    {
        font = [UIFont systemFontOfSize:10];
    }
    
    CGSize lblNumSize = CGSizeZero;
    UILabel* lbl = [[UILabel alloc] init];
    //计算文字占宽
    lblNumSize = [[Utils isEmpty:_text] ? @"国" : _text sizeWithFont:font forWidth:_width lineBreakMode:NSLineBreakByTruncatingTail];  //// 省略尾部,...代替
    lbl.frame = CGRectMake(0, 0, lblNumSize.width, lblNumSize.height);
    lbl.font = font;
    lbl.text = _text;
    lbl.backgroundColor = [UIColor clearColor];
    
    return  lbl;
}


+ (UILabel*) getAutoWrapLabel : (UIFont*) font text : (NSString*) _text  size: (CGSize) _size
{
    if (font == nil)
    {
        font = [UIFont systemFontOfSize:10];
    }
    
    CGSize lblNumSize = CGSizeZero;
    UILabel* lbl = [[UILabel alloc] init];
    //计算文字占宽
    lblNumSize = [[Utils isEmpty:_text] ? @"国" : _text sizeWithFont:font constrainedToSize:CGSizeMake(_size.width, _size.height) lineBreakMode:NSLineBreakByTruncatingTail];  //// 省略尾部,...代替
    lbl.numberOfLines = 0;
    lbl.frame = CGRectMake(0, 0, lblNumSize.width, lblNumSize.height);
    lbl.font = font;
    lbl.text = _text;
    lbl.backgroundColor = [UIColor clearColor];
    
    return  lbl;
}

+ (UIButton*)get3xAutoWrapButtonWithIconNormal:(UIImage*)_iconNormal iconHighlighted:(UIImage*)_iconHighlighted size:(CGSize)_size
{
    if ((_iconNormal == nil && _iconHighlighted == nil) || (_size.width <= 0 && _size.height <= 0))
    {
        return nil;
    }
    
    UIImage* tempImage = _iconNormal == nil ? _iconHighlighted : _iconNormal;
    
    UIButton* tempBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, _size.width, _size.height)];
    [tempBtn setImage:_iconNormal forState:UIControlStateNormal];
    [tempBtn setImage:_iconHighlighted forState:UIControlStateHighlighted];
    [tempBtn setImageEdgeInsets:UIEdgeInsetsMake((tempBtn.frame.size.height - tempImage.size.height/3)/2, (tempBtn.frame.size.width - tempImage.size.width/3)/2, (tempBtn.frame.size.height - tempImage.size.height/3)/2, (tempBtn.frame.size.width - tempImage.size.width/3)/2)];
    
    return tempBtn;
}

+ (UIButton*)getAutoWrapButtonWithIconNormal:(UIImage*)_iconNormal iconHighlighted:(UIImage*)_iconHighlighted size:(CGSize)_size
{
    if ((_iconNormal == nil && _iconHighlighted == nil) || (_size.width <= 0 && _size.height <= 0))
    {
        return nil;
    }
    
    UIImage* tempImage = _iconNormal == nil ? _iconHighlighted : _iconNormal;
    
    UIButton* tempBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, _size.width, _size.height)];
    [tempBtn setImage:_iconNormal forState:UIControlStateNormal];
    [tempBtn setImage:_iconHighlighted forState:UIControlStateHighlighted];
    [tempBtn setImageEdgeInsets:UIEdgeInsetsMake((tempBtn.frame.size.height - tempImage.size.height)/2, (tempBtn.frame.size.width - tempImage.size.width)/2, (tempBtn.frame.size.height - tempImage.size.height)/2, (tempBtn.frame.size.width - tempImage.size.width)/2)];
    
    return tempBtn;
}


@end
