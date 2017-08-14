//
//  MessagePage.h
//  CocoaPods
//
//这是封装的一个列表的组件
//  Created by 李四 on 16/2/25.
//  Copyright © 2016年 李四. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 刷新控件样式
typedef NS_ENUM(NSInteger, SetRefreshType)
{
    ///  只有下拉刷新
    SetRefreshTypeHeaderOnly = 1,
    ///  只有上拉加载
    SetRefreshTypeFooterOnly,
    ///  下拉刷新与上拉加载
    SetRefreshTypeBothHeaderAndFooter,
    ///  不需要刷新
    SetRefreshTypeNone

};

/// 空白界面样式
typedef NS_ENUM(NSInteger, SetEmptyType)
{
    ///  只需要无数据时的空白界面
    SetEmptyTypeNoDataOnly = 1,
    ///  只需要网络错误的空白界面
    SetEmptyTypeNetErrorOnly,
    ///  两种空白界面都需要显示
    SetEmptyTypeBothNoDataAndNetError,
    ///  两种空白界面都不需要显示
    SetEmptyTypeNoNeedEmpty
    
};

///  messagepage的代理协议
@protocol MessagePageDelegate<NSObject>

@optional
///  刷新数据，用于下拉刷新
-(void)doRefresh;

///  加载数据，用于上拉加载
-(void)doLoadMore;

@end

@interface MessagePage : UITableView<UITableViewDelegate>

///  messagepage刷新协议
@property (nonatomic,weak) id<MessagePageDelegate> mMessagePageDelegate;

///  数据源
@property (nonatomic,strong,readonly) NSMutableArray* mDataArray;


///  设置刷新控件的样式  默认都开启
-(void)setRefreshType:(SetRefreshType)refreshType;

///  空白页面样式定制
-(void)setEmptyViewType:(SetEmptyType)emptyType;

///  不显示菊花加载进度
-(void)setNotShowProgressView;

///  空数据时页面图片定制    默认empty_data
-(void)setEmptyImageWithImageName:(NSString *)imageName;

///  手动管理无数据时的空白页面
-(void)setEmptyViewIsShow:(BOOL)isShow;

///  隐藏网络错误时的界面
-(void)setEmptyViewNetErrorHidden;

///  隐藏无数据时的界面
- (void)setEmptyViewNoDataHidden;

///  在现有基础上调整整体调整界面的Y值(空白界面、网络错误、加载界面)
-(void)setContentViewOriginYMoveUp:(int)moveUp;

/**
 上移加载UI
 */
-(void)setContentViewLoadingViewOriginYMoveUp:(int)moveUp;

///  设置刷新控件的样式,是否显示空白页面
-(void)setRefreshType:(SetRefreshType)refreshType emptyViewType:(SetEmptyType)emptyType;

//定制空数据时图片点击事件开关
- (void)setEmptyImageClickSwitch:(BOOL)isSwitch;
/**
 *  添加数据
 *
 *  @param isNeedClear 是否需要清除老数据
 *  @param dataList    需要添加的数据
 */
-(void)addDataWithList:(NSArray* _Nullable)dataList isNeedClearOldData:(BOOL)isNeedClear;

/**
 *  设置数据，清除现有列表数据，直接使用新的数据源数据
 *
 *  @param dataList 新的数据源数据
 */
-(void) setDataList:(NSArray*_Nullable)dataList;

/**
 *  获取列表对应的数据源，返回一个新的数组，性能没有指针效率高，
 *  适用于获得列表，并且修改，然后在通过@setDataList 重新设置
 *  如果只是取得数据不修改，请直接使用mDataArray访问数据
 */
-(NSMutableArray*_Nullable) getDataList;



/**
 *  一般用于进入页面的时候的刷新
 */
-(void) performRefresh;

/**
 *  用于第一次进入的刷新，带动画效果
 */
-(void)performRefreshWithAnimation;

/**
 *  刷新完成调用的接口
 */
-(void) completeIsRefresh:(BOOL)isRefresh isHasMoreData:(BOOL)isHasMoreData isSucc:(BOOL)isSucc;

//一般用于不用接收回包的情况，比如社区界面刷新或是加载的时候点击tag进行页面切换的时候
///  结束刷新与加载动作
-(void)comepleteRefreshAndLoadMore;
@end


