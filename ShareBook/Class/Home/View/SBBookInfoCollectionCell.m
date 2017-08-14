//
//  SBBookInfoCollectionCell.m
//  ShareBook
//
//  Created by Lee on 2017/8/15.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBBookInfoCollectionCell.h"

@interface SBBookInfoCollectionCell()

@property (strong,nonatomic) UIImageView *mCoverImgView;

@property (strong,nonatomic) UILabel *mTitleLbl;

@end

@implementation SBBookInfoCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupContentView];
    }
    return self;
}

+(CGSize)sizeOfCell{
    CGSize size = CGSizeMake((ScreenW - 10*3 - 10*2)/4, 120);
    
    return size;
}


- (void)setupContentView{
    _mCoverImgView = [[UIImageView alloc] init];
    [self addSubview:_mCoverImgView];
    _mCoverImgView.backgroundColor = [UIColor lightGrayColor];
    [_mCoverImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(100);
    }];
    
    _mTitleLbl = [[UILabel alloc] init];
    [self addSubview:_mTitleLbl];
    _mTitleLbl.font = FONT(12);
    _mTitleLbl.tintColor = [UIColor lightGrayColor];
    _mTitleLbl.text = @"明朝那些事儿";
    _mTitleLbl.textAlignment = NSTextAlignmentCenter;
    [_mTitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mCoverImgView.mas_bottom).offset(8);
    }];
}

@end
