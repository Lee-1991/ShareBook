//
//  SBVCHeaderView.m
//  ShareBook
//
//  Created by Lee on 2017/8/17.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBVCHeaderView.h"

@implementation SBVCHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, ScreenW, 64)];
    if (self) {
        [self setupContentView];
    }
    return self;
}


- (void)setupContentView{
    self.mBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
    _mBackgroundView.backgroundColor = [Utils getUIColorFromHex:0xfff2f2f2];
    [self addSubview:_mBackgroundView];
    
    UIImage *backImg = [UIImage imageNamed:@"back_btn_icon"];
    _mBackBtn = [Utils getAutoWrapButtonWithIconNormal:backImg iconHighlighted:nil size:CGSizeMake(44, 44)];
    _mBackBtn.frame = CGRectMake(5, 20, 44, 44);
    [self addSubview:_mBackBtn];
    
    _mTitleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenW*0.5, 44)];
    _mTitleLbl.center = CGPointMake(0.5*ScreenW, 20+22);
    _mTitleLbl.font = FONT(16);
    _mTitleLbl.textColor = [Utils getUIColorFromHex:0xff424242];
    _mTitleLbl.textAlignment = NSTextAlignmentCenter;
    _mTitleLbl.numberOfLines = 1;
    [self addSubview:_mTitleLbl];
    
    _mFinishBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW - 44 -10*Fit_RATE, 20, 44, 44)];
    [self addSubview:_mFinishBtn];
    [_mFinishBtn setTitleColor:[Utils getUIColorFromHex:0xff424242] forState:UIControlStateNormal];
    _mFinishBtn.titleLabel.font = FONT(12);
    _mFinishBtn.hidden = YES;
    [_mFinishBtn setTitle:@"完成" forState:UIControlStateNormal];
    
    _mSeparateLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1)];
    _mSeparateLine.backgroundColor = [Utils getUIColorFromHex:0xffdedede];
    _mSeparateLine.hidden = YES;
    [self addSubview:_mSeparateLine];
}

@end
