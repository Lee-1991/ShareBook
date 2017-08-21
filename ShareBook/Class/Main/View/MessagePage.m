//
//  MessagePage.m
//  CocoaPods
//
//  Created by 李四 on 16/2/25.
//  Copyright © 2016年 李四. All rights reserved.
//

#import "MessagePage.h"
#import <MJRefresh.h>

@interface MessagePage()
{
    UIActivityIndicatorView* mProgressView;
    UILabel* mProgressLabel;
    UIImageView* mEmptyImageView;
    UIButton* mRetryBtn;
    
    UIImage* mEmptyImg;
}

@end

@implementation MessagePage

//数据源的set方法
-(void)setMDataArray:(NSMutableArray *)mDataArray
{
    if (_mDataArray != mDataArray)
    {
        _mDataArray = mDataArray;
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.showsVerticalScrollIndicator = NO;
        
        mEmptyImg = [UIImage imageNamed:@"empty_data"];
        self.mDataArray = [[NSMutableArray alloc] init];
        
        [self initViews];
    }
    return self;
}

//初始化ui，包括菊花，页面空白和页面失败的情况
-(void) initViews
{
    //菊花
    mProgressView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    CGRect rect = mProgressView.frame;
    rect.origin.x = (self.frame.size.width - mProgressView.frame.size.width) * 0.5;
    rect.origin.y = (self.frame.size.height) * 0.5;
    mProgressView.frame = rect;

    //加载文字
    mProgressLabel = [Utils getAutoWrapLabel:[UIFont systemFontOfSize:12] text:@"正在加载..."];

    rect = mProgressLabel.frame;
    rect.origin.x = (self.frame.size.width - mProgressLabel.frame.size.width) * 0.5;
    rect.origin.y = CGRectGetMaxY(mProgressView.frame) + NormalMargin * 1.5;
    mProgressLabel.frame = rect;
    mProgressLabel.hidden = YES;
    
    //无数据时的图片
    mEmptyImageView = [[UIImageView alloc]initWithImage:mEmptyImg];
    rect = mEmptyImageView.frame;
    
    rect.origin.x = (ScreenW - mEmptyImg.size.width/2*Fit_RATE)/2;
    rect.origin.y = (ScreenH - mEmptyImg.size.height/2*Fit_RATE)/2 - NormalMargin * 5;
    rect.size.width = mEmptyImg.size.width/2*Fit_RATE;
    rect.size.height = mEmptyImg.size.height /2*Fit_RATE;
    mEmptyImageView.frame = rect;
    mEmptyImageView.hidden = YES;
    mEmptyImageView.userInteractionEnabled = NO;
    UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageView)];
    [mEmptyImageView addGestureRecognizer:singleTap];
    
    //点击重试
    UIImage* reTryImg = [UIImage imageNamed:@"empty_network"];
    mRetryBtn = [Utils get3xAutoWrapButtonWithIconNormal:reTryImg iconHighlighted:nil size:CGSizeMake(reTryImg.size.width/2*Fit_RATE, reTryImg.size.height/2*Fit_RATE)];
    
    rect.origin.x = (ScreenW - reTryImg.size.width/2*Fit_RATE)/2;
    rect.origin.y = (ScreenH - reTryImg.size.height/2*Fit_RATE)/2 - NormalMargin * 5;
    mRetryBtn.frame = rect;

    mRetryBtn.hidden = YES;
    [mRetryBtn addTarget:self action:@selector(doRetryRefresh) forControlEvents:UIControlEventTouchUpInside];
 
    [self addSubview:mProgressView];
    [self addSubview:mProgressLabel];
    [self addSubview:mEmptyImageView];
    [self addSubview:mRetryBtn];
    
    [self setHeader];
    [self setFooter];
    
    [self bringSubviewToFront:mProgressView];
    [self bringSubviewToFront:mProgressLabel];
}

#pragma mark -
#pragma mark - 设置刷新控件的头部和底部
-(void)setHeader
{
    // 设置回调
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        [self.mMessagePageDelegate doRefresh];
    }];
    
//    //设置下拉状态的图片
//    NSMutableArray* pullDownImgs = [[NSMutableArray alloc] init];
//    UIImage* img = [UIImage imageNamed:@"refresh_1"];
//    [pullDownImgs addObject:img];
//    
//    // 设置刷新状态的动画图片
//    NSMutableArray *refreshImages = [NSMutableArray array];
//    //这个6为提供的图片个数，要与之对应
//    for (int i = 1; i<=8; i++)
//    {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"refresh_%d", i]];
//        [refreshImages addObject:image];
//    }
//    
//    // 设置普通状态的动画图片
//    [header setImages:pullDownImgs forState:MJRefreshStateIdle];
//    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
//    [header setImages:refreshImages forState:MJRefreshStatePulling];
//    // 设置正在刷新状态的动画图片
//    [header setImages:refreshImages forState:MJRefreshStateRefreshing];
//    
//    header.lastUpdatedTimeLabel.hidden = YES;
//    header.stateLabel.hidden = YES;
    
    // 设置header
    self.mj_header = header;
}

-(void)setFooter
{
    MJRefreshBackNormalFooter* footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.mMessagePageDelegate doLoadMore];
    }];
    
    // 设置文字
    [footer setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
    [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"没有更多了" forState:MJRefreshStateNoMoreData];
    
    //文字颜色
    footer.stateLabel.textColor = [Utils getUIColorFromHex:0xff999999];
    
    self.mj_footer = footer;
}

#pragma mark
#pragma mark - 定制界面的接口
//设置刷新控件样式
-(void)setRefreshType:(SetRefreshType)refreshType
{
    //只有头部刷新,把底部加载置为nil
    if ((NSInteger)refreshType == SetRefreshTypeHeaderOnly)
    {
        self.mj_footer = nil;
        [self setHeader];
    }
    //只有底部加载，把头部刷新置为nil
    else if((NSInteger)refreshType == SetRefreshTypeFooterOnly)
    {
        self.mj_header = nil;
        [self setFooter];
    }
    else if ((NSInteger)refreshType == SetRefreshTypeNone)
    {
        self.mj_header = nil;
        self.mj_footer = nil;
    }
    //同时开启头部与底部刷新
    else
    {
        //不需要操作，初始化的时候已默认初始化了头部刷新与底部加载
    }
}

-(void)setNotShowProgressView
{
    [mProgressView removeFromSuperview];
    [mProgressLabel removeFromSuperview];
}

//定制空白页面
-(void)setEmptyViewType:(SetEmptyType)emptyType
{
    switch (emptyType) {
        case SetEmptyTypeNoDataOnly:
            mRetryBtn = nil;
            break;
            
        case SetEmptyTypeNetErrorOnly:
            mEmptyImageView = nil;
            break;
            
        case SetEmptyTypeBothNoDataAndNetError:
            break;
            
        case SetEmptyTypeNoNeedEmpty:
            mEmptyImageView = nil;
            mRetryBtn = nil;
            break;
            
        default:
            break;
    }
}

//空数据页面图片定制
-(void)setEmptyImageWithImageName:(NSString *)imageName
{
    mEmptyImg = [UIImage imageNamed:imageName];
    mEmptyImageView.image = mEmptyImg;
    CGRect rect = mEmptyImageView.frame;
    rect.origin.x = (ScreenW - mEmptyImg.size.width/2*Fit_RATE)/2;
    rect.origin.y = (ScreenH - mEmptyImg.size.height/2*Fit_RATE)/2 - NormalMargin * 5;
    rect.size.width = mEmptyImg.size.width/2*Fit_RATE;
    rect.size.height = mEmptyImg.size.height /2*Fit_RATE;
    mEmptyImageView.frame = rect;
    mEmptyImageView.hidden = YES;
}

//手动管理无数据时的空白页面
-(void)setEmptyViewIsShow:(BOOL)isShow
{
    if (isShow)
    {
        mEmptyImageView.hidden = NO;
    } else
    {
        mEmptyImageView.hidden = YES;
    }
}

//隐藏网络错误的图
-(void)setEmptyViewNetErrorHidden
{
    mRetryBtn.hidden = YES;
}

///  隐藏无数据时的界面
- (void)setEmptyViewNoDataHidden
{
    mEmptyImageView.hidden = YES;
}

-(void)setContentViewOriginYMoveUp:(int)moveUp
{
    //无数据时的空白界面
    CGRect rect = mEmptyImageView.frame;
    rect.origin.y -= moveUp;
    mEmptyImageView.frame = rect;
    
    //网络错误重试界面
    rect = mRetryBtn.frame;
    rect.origin.y -= moveUp;
    mRetryBtn.frame = rect;
    
    //菊花
    rect = mProgressView.frame;
    rect.origin.y -= moveUp;
    mProgressView.frame = rect;
    
    //加载文字
    rect = mProgressLabel.frame;
    rect.origin.y -= moveUp;
    mProgressLabel.frame = rect;
    
}

-(void)setContentViewLoadingViewOriginYMoveUp:(int)moveUp
{
    //菊花
    CGRect rect = mProgressView.frame;
    rect.origin.y -= moveUp;
    mProgressView.frame = rect;
    
    //加载文字
    rect = mProgressLabel.frame;
    rect.origin.y -= moveUp;
    mProgressLabel.frame = rect;
}

-(void)setRefreshType:(SetRefreshType)refreshType emptyViewType:(SetEmptyType)emptyType
{
    
    [self setRefreshType:refreshType];
    
    [self setEmptyViewType:emptyType];
}

//定制空数据时图片点击事件开关
- (void)setEmptyImageClickSwitch:(BOOL)isSwitch
{
    mEmptyImageView.userInteractionEnabled = isSwitch;
}

#pragma mark
#pragma maek - 数据操作
//更新数据源数据
-(void)addDataWithList:(NSArray *)dataList isNeedClearOldData:(BOOL)isNeedClear
{
    if(isNeedClear)
    {
        [self.mDataArray removeAllObjects];
    }
    
    [self.mDataArray addObjectsFromArray:dataList];
    [self reloadData];
}

-(void) setDataList:(NSArray*)dataList
{
    [self.mDataArray removeAllObjects];
    [self.mDataArray addObjectsFromArray:dataList];
    [self reloadData];
    
}

-(NSMutableArray*) getDataList
{
    //返回一个全新的数组
    NSMutableArray* dataList = [[NSMutableArray alloc]init];
    [dataList addObjectsFromArray:self.mDataArray];
    
    return dataList;
}

#pragma mark
#pragma mark - 完成刷新
//完成刷新或者加载
-(void)completeIsRefresh:(BOOL)isRefresh isHasMoreData:(BOOL)isHasMoreData isSucc:(BOOL)isSucc
{
    if (isRefresh)
    {
        if (isHasMoreData)
        {
            [self.mj_header endRefreshing];
            //结束刷新后要将底部加载控件置为闲置状态（即可以进行加载操作）
            [self.mj_footer setState:MJRefreshStateIdle];
        } else
        {
            [self.mj_header endRefreshing];
            [self.mj_footer setState:MJRefreshStateNoMoreData];
        }

    }else
    {
        if (isHasMoreData)
        {
            [self.mj_footer endRefreshing];
        }else
        {
            [self.mj_footer endRefreshingWithNoMoreData];
        }
    }
    
    [mProgressView stopAnimating];
    mProgressLabel.hidden = YES;
    
    [self refreshEmptyViewIsLoadingSuc:isSucc];
}

//同时结束刷新与加载
-(void)comepleteRefreshAndLoadMore
{
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
    
    [mProgressView stopAnimating];
    mProgressLabel.hidden = YES;
}

-(void) refreshEmptyViewIsLoadingSuc:(BOOL)isLoadingSuc
{
    if(self.mDataArray.count == 0)
    {
        if(isLoadingSuc)
        {
            //加载成功，没有数据，显示页面空白
            mEmptyImageView.hidden = NO;
            mRetryBtn.hidden = YES;
        }
        else
        {
            //加载失败，没有数据，显示点击重试
            mEmptyImageView.hidden = YES;
            mRetryBtn.hidden = NO;
        }
    } else
    {
        //存在数据
        mEmptyImageView.hidden = YES;
        mRetryBtn.hidden = YES;
    }
}


#pragma mark-
#pragma mark
//用于第一次进入页面刷新
-(void) performRefresh
{
    mRetryBtn.hidden = YES;
    mEmptyImageView.hidden = YES;
    //显示菊花和加载文字
    [mProgressView startAnimating];
    mProgressLabel.hidden = NO;
    [self.mMessagePageDelegate doRefresh];

}

//用于第一次进入的刷新，带动画效果
-(void)performRefreshWithAnimation
{
//    [self setHeader];
    
    //隐藏菊花和加载文字
    [mProgressView stopAnimating];
    mProgressLabel.hidden = YES;
    mRetryBtn.hidden = YES;
    mEmptyImageView.hidden = YES;
    
    [self.mj_header beginRefreshing];
}

//重新加载
-(void)doRetryRefresh
{
    mEmptyImageView.hidden = YES;
    mRetryBtn.hidden = YES;

    [mProgressView startAnimating];
    mProgressLabel.hidden = NO;
    
    [self.mMessagePageDelegate doRefresh];
}

- (void)tapImageView
{
//    [[AppEngine getInstance].mPageJumpHelper gotoRecommendFocusVC:[Utils getBaseViewControllerOfCurrentView:self]];
}

-(void)dealloc
{
    ITOLOG(@"MessagePage dealloc");
}

@end
