//
//  SBBookDetailBottomView.m
//  ShareBook
//
//  Created by Lee on 2017/8/17.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBBookDetailBottomView.h"
#import "UIButton+LSAdd.h"

@interface SBBookDetailBottomView()

@property (strong,nonatomic) UILabel *mPriceLbl;
@property (strong,nonatomic) UILabel *mDiscountPriLbl;

@end

@implementation SBBookDetailBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupContentView];
    }
    return self;
}

+(CGFloat)heightOfBottomView{
    return 98*Fit_RATE;
}

//MARK: 点击事件
-(void)onClcikTakeBookBtn:(UIButton *)sender{
    
}

-(void)onClickBorrowBoolBtn:(UIButton *)sender{
    
}

//MARK: UI
-(void)setupContentView{
    
    UIView* separateTop = [[UIView alloc] init];
    [self addSubview:separateTop];
    separateTop.backgroundColor = ColorSeparateLine;
    [separateTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(5*Fit_RATE);
    }];
    
    UILabel* firstDayLbl = [[UILabel alloc] init];
    [self addSubview:firstDayLbl];
    firstDayLbl.font = FONT(12);
    firstDayLbl.textColor = [Utils getUIColorFromHex:0xff424242];
    firstDayLbl.text = @"借书首日：";
    [firstDayLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(separateTop.mas_bottom).offset(6*Fit_RATE);
        make.left.equalTo(self.mas_centerX).offset(80*Fit_RATE);
    }];
    
    _mPriceLbl = [[UILabel alloc] init];
    [self addSubview:_mPriceLbl];
    _mPriceLbl.font = FONT(12);
    _mPriceLbl.textColor = [Utils getUIColorFromHex:0xffff5753];
    _mPriceLbl.text = @"¥7.0";
    [_mPriceLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(firstDayLbl.mas_right);
        make.centerY.equalTo(firstDayLbl.mas_centerY);
    }];
    
    UILabel* everyDayLbl = [[UILabel alloc] init];
    [self addSubview:everyDayLbl];
    everyDayLbl.font = FONT(12);
    everyDayLbl.textColor = [Utils getUIColorFromHex:0xff424242];
    everyDayLbl.text = @"后每日：";
    [everyDayLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(firstDayLbl.mas_right);
        make.top.equalTo(firstDayLbl.mas_bottom).offset(6*Fit_RATE);
    }];
    
    _mDiscountPriLbl = [[UILabel alloc] init];
    [self addSubview:_mDiscountPriLbl];
    _mDiscountPriLbl.font = FONT(12);
    _mDiscountPriLbl.textColor = [Utils getUIColorFromHex:0xffff5753];
    _mDiscountPriLbl.text = @"¥0.8";
    [_mDiscountPriLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(everyDayLbl.mas_right);
        make.centerY.equalTo(everyDayLbl.mas_centerY);
    }];
    
    UIView *separateLine = [[UIView alloc] init];
    [self addSubview:separateLine];
    separateLine.backgroundColor = ColorSeparateLine;
    [separateLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(everyDayLbl.mas_bottom).offset(5*Fit_RATE);
        make.height.mas_equalTo(1*Fit_RATE);
    }];
    
    CGFloat widthBtn = 90*Fit_RATE;
    CGFloat heightBtn = 47*Fit_RATE;
    UIButton *takeBookBtn = [[UIButton alloc] init];
    [self addSubview:takeBookBtn];
    [takeBookBtn setTitleColor:[Utils getUIColorFromHex:0xff959595] forState:UIControlStateNormal];
    [takeBookBtn.titleLabel setFont:FONT(12)];
    [takeBookBtn setImage:[UIImage imageNamed:@"tab_take_book_normal"] forState:UIControlStateNormal];
    [takeBookBtn setTitle:@"取书" forState:UIControlStateNormal];
    [takeBookBtn addTarget:self action:@selector(onClcikTakeBookBtn:) forControlEvents:UIControlEventTouchUpInside];
    [takeBookBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(widthBtn, heightBtn));
    }];
    [takeBookBtn layoutButtonWithStyle:LSButtonStyleImageTop imageTitleSpace:0];
    
    UIButton *borrowBtn = [[UIButton alloc] init];
    [self addSubview:borrowBtn];
    [borrowBtn setBackgroundColor:[Utils getUIColorFromHex:0xff00bafd]];
    [borrowBtn setTitleColor:[Utils getUIColorFromHex:0xffffffff] forState:UIControlStateNormal];
    [borrowBtn.titleLabel setFont:FONT(12)];
    [borrowBtn setImage:[UIImage imageNamed:@"borrow_book_iocn"] forState:UIControlStateNormal];
    [borrowBtn setTitle:@"借书" forState:UIControlStateNormal];
    [borrowBtn addTarget:self action:@selector(onClickBorrowBoolBtn:) forControlEvents:UIControlEventTouchUpInside];
    [borrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(widthBtn, heightBtn));
    }];
    [borrowBtn layoutButtonWithStyle:LSButtonStyleImageTop imageTitleSpace:0];
    
    
}

@end
