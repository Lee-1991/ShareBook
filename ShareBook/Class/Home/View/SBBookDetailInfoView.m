//
//  SBBookDetailInfoView.m
//  ShareBook
//
//  Created by Lee on 2017/8/17.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBBookDetailInfoView.h"
#import "SBBorrowBookCellTopView.h"

@interface SBBookDetailInfoView()

@property (strong,nonatomic) SBBorrowBookCellTopView *mTopView;
@property (strong,nonatomic) UIImageView *mBookCover;
@property (strong,nonatomic) UILabel *mNameLbl;
@property (strong,nonatomic) UILabel *mAuthorLbl;
@property (strong,nonatomic) UILabel *mPriceTipsLbl;
@property (strong,nonatomic) UILabel *mPriceLbl;
@property (strong,nonatomic) UILabel *mDescribLbl;

@end

@implementation SBBookDetailInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupContentView];
    }
    return self;
}


//MARK: UI
-(void)setupContentView{
    
    _mTopView = [[SBBorrowBookCellTopView alloc] init];
    [self addSubview:_mTopView];
    _mTopView.mCountLbl.hidden = YES;
    [_mTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.size.mas_equalTo(CGSizeMake(ScreenW, [SBBorrowBookCellTopView heightOfCellTopView]));
    }];
    
    _mBookCover = [[UIImageView alloc] init];
    [self addSubview:_mBookCover];
    _mBookCover.backgroundColor = ColorPlaceHolder;
    [_mBookCover mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(17*Fit_RATE);
        make.top.equalTo(_mTopView.mas_bottom).offset(20*Fit_RATE);
        make.size.mas_equalTo(CGSizeMake(103*Fit_RATE, 138*Fit_RATE));
    }];
    
    _mNameLbl = [[UILabel alloc] init];
    [self addSubview:_mNameLbl];
    _mNameLbl.font = FONT(12);
    _mNameLbl.textColor = [Utils getUIColorFromHex:0xff424242];
    _mNameLbl.text = @"吕氏春秋";
    [_mNameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_mBookCover.mas_top);
        make.left.equalTo(_mBookCover.mas_right).offset(13*Fit_RATE);
    }];
    
    _mAuthorLbl = [[UILabel alloc] init];
    [self addSubview:_mAuthorLbl];
    _mAuthorLbl.font = FONT(12);
    _mAuthorLbl.textColor = [Utils getUIColorFromHex:0xff424242];
    _mAuthorLbl.text = @"作者：李四";
    [_mAuthorLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mNameLbl.mas_left);
        make.top.equalTo(_mNameLbl.mas_bottom).offset(7*Fit_RATE);
    }];
    
    _mPriceTipsLbl = [[UILabel alloc] init];
    [self addSubview:_mPriceTipsLbl];
    _mPriceTipsLbl.font = FONT(12);
    _mPriceTipsLbl.textColor = [Utils getUIColorFromHex:0xff424242];
    _mPriceTipsLbl.text = @"价格：";
    [_mPriceTipsLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mNameLbl.mas_left);
        make.top.equalTo(_mAuthorLbl.mas_bottom).offset(7*Fit_RATE);
    }];
    
    _mPriceLbl = [[UILabel alloc] init];
    [self addSubview:_mPriceLbl];
    _mPriceLbl.font = FONT(12);
    _mPriceLbl.textColor = [Utils getUIColorFromHex:0xffff4e4e];
    _mPriceLbl.text = @"¥29.0";
    [_mPriceLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mPriceTipsLbl.mas_right);
        make.bottom.equalTo(_mPriceTipsLbl.mas_bottom);
    }];
    
    _mDescribLbl = [[UILabel alloc] init];
    [self addSubview:_mDescribLbl];
    _mDescribLbl.font = FONT(11);
    _mDescribLbl.textColor = [Utils getUIColorFromHex:0xff929292];
    _mDescribLbl.numberOfLines = 0;
    _mDescribLbl.text = @"《吕氏春秋》是在秦国丞相吕不韦主持下，集合门客们编撰的一部黄老道家名著。成书于秦始皇统一中国前夕。此书以儒家学说为主干，以道家理论为基础，以名、法、墨、农、兵、阴阳家思想学说为素材，熔诸子百家学说为一炉，闪烁着博大精深的智慧之光。";
    [_mDescribLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mNameLbl.mas_left);
        make.right.equalTo(self.mas_right).offset(-11*Fit_RATE);
        make.top.equalTo(_mPriceTipsLbl.mas_bottom).offset(8*Fit_RATE);
    }];
}

@end
