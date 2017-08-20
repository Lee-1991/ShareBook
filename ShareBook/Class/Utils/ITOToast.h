//
//  ITOToast.h
//  LY
//  一个android toast效果的控件
//  Created by jacktu on 11-10-17.
//  Copyright 2011年 Dotel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

//显示时长

typedef NS_ENUM(NSInteger, Toast_Length) {
    ///较长
    TOAST_LONG = 4,
    ///较短
    TOAST_SHORT = 2,
};

@interface ITOToast : UILabel
{
}

- (id) initWithText : (NSString*) text;

//显示
+ (void) show : (NSString*) text toastType : (Toast_Length) type;

+ (void) show : (NSString*) text toastType : (Toast_Length)type dy:(float)_dy;

+ (void) show : (NSString*) text toastType : (Toast_Length) type position : (CGPoint) point;

@end
