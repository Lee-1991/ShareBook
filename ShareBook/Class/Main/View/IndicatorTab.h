//
//  IndicatorTab.h
//  PlatformGL
//
//  Created by phil on 16/4/1.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IndicatorTabDelegete <NSObject>

@required

///  选中列表中的某一项的响应事件
-(void)onIndicatorSelected:(int)index;

@end


@interface IndicatorTab : UIView

/**
 代理
 */
@property (nonatomic, weak) id<IndicatorTabDelegete> mDelegate;

/**
 选中项字体,默认FONT(14)
 */
@property(strong,nonatomic) UIFont* mSelectedFont;

/**
 选中项字体颜色，默认0xfffbbc0e
 */
@property(strong,nonatomic) UIColor* mSelectColor;

/**
 非选中项的字体，默认FONT(12)
 */
@property(strong,nonatomic)UIFont* mNormalFont;

/**
 非选中项的字体颜色，默认0xff8f8f8f
 */
@property(strong,nonatomic) UIColor* mNormalColor;
@property(assign,nonatomic)UIControlContentVerticalAlignment mContentVerticalAlignment;

/**
 字体距离底部的距离
 */
@property(assign,nonatomic) int mBottomOffset;

@property(assign,nonatomic) int mRightOffset;


/**
 选中项底部下划线默认的颜色
 */
@property(nonatomic, strong) UIColor* mSelectLineColor;

/**
 是否展示底部分割线
 */
@property(nonatomic, assign) BOOL mShowSeperateLine;

/**
 赋值，这个方法会刷新UI，需要在各种设置项后面调用，
 */
-(void)setData:(NSArray*)dataArray;

-(void)setDataNoEvent:(NSArray*)dataArray;
-(void)setData:(NSArray *)dataArray selectedIndex:(int)selectedIndex;

-(void)refreshRedHot:(int)index isHidden:(BOOL)isHidden;

//选中当前选择项
-(void)setCurrentSelectedIndex:(int)selectedIndex;

//选中当前的选择项，不需要事件派发出来
-(void)setCurrentSelectionIndexNoEvent:(int)selectedIndex;

//隐藏选择下划线
- (void)setSelectLineHidden:(BOOL)isHidden;

@end
