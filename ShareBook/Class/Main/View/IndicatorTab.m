//
//  IndicatorTab.m
//  PlatformGL
//
//  Created by phil on 16/4/1.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "IndicatorTab.h"
#define TAB_BTN  4000
#define TAG_UNDER_LINE 5000
#define TAG_RED_HOT  6000
@interface IndicatorTab()
{
    NSMutableArray* mDataArray;
    UIView* mSelectedLine;
  
}

@end

@implementation IndicatorTab
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        [self initialization];
      
    }
    return self;
}


-(void)initialization
{
    mDataArray = [[NSMutableArray alloc] init];
    self.mSelectedFont = FONT(14);
    self.mNormalFont = FONT(14);
    
    self.mNormalColor = [Utils getUIColorFromHex:0xff999999];
    self.mSelectColor = [Utils getUIColorFromHex:0xff00bdfd];
    
    self.mContentVerticalAlignment =UIControlContentVerticalAlignmentCenter;
    self.mBottomOffset = 8;
    
    self.mRightOffset = 2*NormalMargin;
    
    self.mSelectLineColor = [Utils getUIColorFromHex:0xff00bdfd];//选中项下划线默认色
    
}

-(void)setDataNoEvent:(NSArray*)dataArray
{
    [mDataArray removeAllObjects];
    [mDataArray addObjectsFromArray:dataArray];
    
    [self refreshUI];
}

-(void)setData:(NSArray*)dataArray
{
    [mDataArray removeAllObjects];
    [mDataArray addObjectsFromArray:dataArray];
    
    [self refreshUI];
    UIButton* selectedBtn = (UIButton*)[self viewWithTag:TAB_BTN];
    [self onTabClicked:selectedBtn];
    
}

-(void)setData:(NSArray *)dataArray selectedIndex:(int)selectedIndex
{
    [mDataArray removeAllObjects];
    [mDataArray addObjectsFromArray:dataArray];
    
    [self refreshUI];
    if(selectedIndex < mDataArray.count)
    {
        UIButton* selectedBtn = (UIButton*)[self viewWithTag:TAB_BTN+selectedIndex];
        [self onTabClicked:selectedBtn];
    }
}

-(void)setMSelectLineColor:(UIColor *)mSelectLineColor
{
    _mSelectLineColor = mSelectLineColor;
}

-(void)refreshUI
{
    [Utils removeAllChildren:self];
    
    int eachOfWidth = self.frame.size.width / mDataArray.count;

    for(int i = 0; i < mDataArray.count ;i ++)
    {
        NSString* tabName = [mDataArray objectAtIndex:i];
        UIButton* tabBtn = [[UIButton alloc] initWithFrame:CGRectMake(eachOfWidth * i, 0, eachOfWidth, self.frame.size.height)];
        
        [tabBtn setTitleColor:self.mNormalColor forState:UIControlStateNormal];
        [tabBtn.titleLabel setFont:self.mNormalFont];
        if(self.mContentVerticalAlignment == UIControlContentVerticalAlignmentBottom)
        {
            tabBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
            tabBtn.contentEdgeInsets = UIEdgeInsetsMake(0,0, self.mBottomOffset, 0);

        } else
        {
            tabBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
            
        }
        
        [tabBtn setTitle:tabName forState:UIControlStateNormal];
        tabBtn.tag = TAB_BTN + i;
        [tabBtn addTarget:self action:@selector(onTabClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tabBtn];
        
        if (i == 0)
        {
            //选中按钮的下划线
            mSelectedLine = [[UIView alloc] init];
            mSelectedLine.backgroundColor = _mSelectLineColor;
            [self addSubview:mSelectedLine];
//            
//            CGSize size = [Utils sizeWithString:tabBtn.titleLabel.text andFont:self.mSelectedFont];
            CGRect rect = mSelectedLine.frame;
            rect.size.width = 12;
            rect.size.height = 2;
            rect.origin.y = tabBtn.frame.size.height - 2;
            rect.origin.x = tabBtn.center.x - rect.size.width * 0.5;
            mSelectedLine.frame = rect;
        }
 
        UIImage* redHotImg = [UIImage imageNamed:@"home_notifynum_bg"];
        UIImageView* redHotView = [[UIImageView alloc] init];
        redHotView.translatesAutoresizingMaskIntoConstraints = NO;
        [redHotView setImage:redHotImg];
        redHotView.tag = TAG_RED_HOT + i;
        redHotView.hidden = YES;
        [self addSubview:redHotView];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:redHotView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:tabBtn attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:self.mRightOffset]];
         [self addConstraint:[NSLayoutConstraint constraintWithItem:redHotView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:tabBtn attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:5]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:redHotView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0 constant:redHotImg.size.width/2]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:redHotView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0 constant:redHotImg.size.height/2]];
    }
    
    UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 1)];
    line.backgroundColor = [Utils getUIColorFromHex:0xffdedede];
    [self addSubview:line];
    line.hidden = !self.mShowSeperateLine;
}

-(void)refreshRedHot:(int)index isHidden:(BOOL)isHidden;
{
    if(index < mDataArray.count)
    {
        UIImageView* redHot = [self viewWithTag:TAG_RED_HOT + index];
        if(redHot != nil)
        {
            redHot.hidden = isHidden;
        }
    }
}

- (void)onTabClicked:(UIButton*)_sender
{
     int index = (int)_sender.tag - TAB_BTN;
    
    if(index < mDataArray.count)
    {
        [self refreshSelectedUI:index];
        
        [self.mDelegate onIndicatorSelected:index];
    }
    
}

-(void)setCurrentSelectedIndex:(int)selectedIndex;
{
    if(selectedIndex < mDataArray.count)
    {
        [self refreshSelectedUI:selectedIndex];
        [self.mDelegate onIndicatorSelected:selectedIndex];
    }

}

//选中当前的选择项，不需要事件派发出来
-(void)setCurrentSelectionIndexNoEvent:(int)selectedIndex
{
    if(selectedIndex < mDataArray.count)
    {
        [self refreshSelectedUI:selectedIndex];
    }
}

//隐藏选择下划线
- (void)setSelectLineHidden:(BOOL)isHidden
{
    mSelectedLine.hidden = isHidden;
}


-(void) refreshSelectedUI:(int)selecedIndex
{
    for(int i = 0; i < mDataArray.count;i++)
    {
        UIButton* btn = [self viewWithTag:TAB_BTN + i];
        if(i == selecedIndex)
        {
            [btn setTitleColor:self.mSelectColor forState:UIControlStateNormal];
            [btn.titleLabel setFont:self.mSelectedFont];
            
            //动画稍加延时，避免第一次进入页面时动画无法执行的问题（下划线没有移动）
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
                //移动下滑线
//                CGSize size = [Utils sizeWithString:btn.titleLabel.text andFont:self.mSelectedFont];
                CGRect rect = mSelectedLine.frame;
                rect.size.width = 12;
                rect.origin.x = btn.center.x - rect.size.width * 0.5;
                //动画效果
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:0.2];
                mSelectedLine.frame = rect;
                
                [UIView commitAnimations];
            });
        
        } else
        {
            [btn setTitleColor:self.mNormalColor forState:UIControlStateNormal];
            [btn.titleLabel setFont:self.mNormalFont];
        }
    }
}

@end
