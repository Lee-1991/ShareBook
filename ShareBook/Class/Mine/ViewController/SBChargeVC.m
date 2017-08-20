//
//  SBChargeVC.m
//  ShareBook
//
//  Created by Lee on 2017/8/20.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBChargeVC.h"

@interface SBChargeVC ()

@property (strong,nonatomic) UILabel *mSumLbl;
@property (nonatomic,assign) NSInteger mChargeSum;

@end

@implementation SBChargeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mHeaderView.mTitleLbl.text = @"微信充值";
    [self setupContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setMChargeSum:(NSInteger)mChargeSum{
    _mChargeSum = mChargeSum;
    _mSumLbl.textColor = ColorTextBlack;
    if (mChargeSum == 50) {
        _mSumLbl.text = @"50元";
    } else if(mChargeSum == 100) {
        _mSumLbl.text = @"100元";
    }else if(mChargeSum == 200) {
        _mSumLbl.text = @"200元";
    }else if(mChargeSum == 300) {
        _mSumLbl.text = @"300元";
    }
}

-(void)onClickSum50Btn:(UIButton *)sender{
    self.mChargeSum = 50;
}

-(void)onClickSum100Btn:(UIButton *)sender{
    self.mChargeSum = 100;
}

-(void)onClickSum200Btn:(UIButton *)sender{
    self.mChargeSum = 200;
}

-(void)onClickSum300Btn:(UIButton *)sender{
    self.mChargeSum = 300;
}

-(void)onClickWeChatChargeBtn:(UIButton *)sender{
    
    
}

-(void)setupContentView{
    
    CGFloat margin = 10*Fit_RATE;
    UILabel*tipsLbl = [[UILabel alloc] init];
    [self.view addSubview:tipsLbl];
    tipsLbl.font = FONT(12);
    tipsLbl.textColor = ColorTextLightGray;
    tipsLbl.text = @"充值金额";
    [tipsLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(margin);;
        make.top.equalTo(self.mHeaderView.mas_bottom);
        make.height.mas_equalTo(30*Fit_RATE);
    }];
    
    _mSumLbl = [[UILabel alloc] init];
    [self.view addSubview:_mSumLbl];
    _mSumLbl.font = FONT(12);
    _mSumLbl.textColor = ColorTextLightGray;
    _mSumLbl.textAlignment = NSTextAlignmentCenter;
    _mSumLbl.layer.borderWidth = 1.0;
    _mSumLbl.layer.borderColor = ColorBlue.CGColor;
    _mSumLbl.layer.cornerRadius = 4*Fit_RATE;
    _mSumLbl.layer.masksToBounds = YES;
    _mSumLbl.text = @"请选择下方额度";
    [_mSumLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tipsLbl.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(margin);
        make.right.equalTo(self.view.mas_right).offset(-margin);
        make.height.mas_equalTo(34*Fit_RATE);
    }];
    
    CGFloat heightBtn = 44*Fit_RATE;
    UIButton *sum50Btn = [self createBaseSumBtn];
    [self.view addSubview:sum50Btn];
    [sum50Btn setTitle:@"50元" forState:UIControlStateNormal];
    [sum50Btn addTarget:self action:@selector(onClickSum50Btn:) forControlEvents:UIControlEventTouchUpInside];
    [sum50Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(margin);
        make.top.equalTo(_mSumLbl.mas_bottom).offset(margin);
        make.right.equalTo(self.view.mas_centerX).offset(-0.5*margin);
        make.height.mas_equalTo(heightBtn);
    }];
    
    UIButton *sum100Btn = [self createBaseSumBtn];
    [self.view addSubview:sum100Btn];
    [sum100Btn setTitle:@"100元" forState:UIControlStateNormal];
    [sum100Btn addTarget:self action:@selector(onClickSum100Btn:) forControlEvents:UIControlEventTouchUpInside];
    [sum100Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_centerX).offset(0.5*margin);
        make.top.equalTo(_mSumLbl.mas_bottom).offset(margin);
        make.right.equalTo(self.view.mas_right).offset(-margin);
        make.height.mas_equalTo(heightBtn);
    }];
    
    UIButton *sum200Btn = [self createBaseSumBtn];
    [self.view addSubview:sum200Btn];
    [sum200Btn setTitle:@"200元" forState:UIControlStateNormal];
    [sum200Btn addTarget:self action:@selector(onClickSum200Btn:) forControlEvents:UIControlEventTouchUpInside];
    [sum200Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(margin);
        make.top.equalTo(sum50Btn.mas_bottom).offset(margin);
        make.right.equalTo(self.view.mas_centerX).offset(-0.5*margin);
        make.height.mas_equalTo(heightBtn);
    }];
    
    UIButton *sum300Btn = [self createBaseSumBtn];
    [self.view addSubview:sum300Btn];
    [sum300Btn setTitle:@"300元" forState:UIControlStateNormal];
    [sum300Btn addTarget:self action:@selector(onClickSum300Btn:) forControlEvents:UIControlEventTouchUpInside];
    [sum300Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_centerX).offset(0.5*margin);
        make.top.equalTo(sum100Btn.mas_bottom).offset(margin);
        make.right.equalTo(self.view.mas_right).offset(-margin);
        make.height.mas_equalTo(heightBtn);
    }];

    
    UIButton *chargeBtn = [[UIButton alloc] init];
    [self.view addSubview:chargeBtn];
    chargeBtn.titleLabel.font = FONT(14);
    [chargeBtn setTitleColor:[Utils getUIColorFromHex:0xffffffff] forState:UIControlStateNormal];
    [chargeBtn setBackgroundColor:ColorBlue];
    [chargeBtn setTitle:@"微信充值" forState:UIControlStateNormal];
    [chargeBtn addTarget:self action:@selector(onClickWeChatChargeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [chargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-2*margin);
        make.left.equalTo(self.view.mas_left).offset(margin);
        make.right.equalTo(self.view.mas_right).offset(-margin);
        make.height.mas_equalTo(44*Fit_RATE);
    }];
}

-(UIButton *)createBaseSumBtn{
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = FONT(14);
    [button setTitleColor:ColorTextLightGray forState:UIControlStateNormal];
    [button setBackgroundColor:ColorSeparateLine];
    return button;
}

@end
