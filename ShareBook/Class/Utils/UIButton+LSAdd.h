//
//  UIButton+LSAdd.h
//  ShareBook
//
//  Created by Lee on 2017/8/17.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>


// 定义一个枚举（包含了四种类型的button）
typedef NS_ENUM(NSUInteger, LSButtonStyle) {
    LSButtonStyleImageTop, // image在上，label在下
    LSButtonStyleImageLeft, // image在左，label在右
    LSButtonStyleImageBottom, // image在下，label在上
    LSButtonStyleImageRight // image在右，label在左
};

@interface UIButton (LSAdd)

-(instancetype)initWithFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title;

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithStyle:(LSButtonStyle)style
              imageTitleSpace:(CGFloat)space;



@end
