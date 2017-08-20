//
//  SBPurseVC.m
//  ShareBook
//
//  Created by Lee on 2017/8/20.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBPurseVC.h"

@interface SBPurseVC ()

@property (strong,nonatomic) UILabel *mBalanceLbl;

@end

@implementation SBPurseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mHeaderView.mTitleLbl.text = @"钱包";
    [self setupContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onClickChargeBtn:(UIButton *)sender{
    [[SBPageJumpManager shareInstance] pushToChargeVC];
}

-(void)setupContentView{
    
    UIView *backView = [[UIView alloc] init];
    [self.view addSubview:backView];
    backView.backgroundColor = [Utils getUIColorFromHex:0xff43c6ff];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.mHeaderView.mas_bottom);
        make.bottom.equalTo(self.view.mas_centerY);
    }];
    
    _mBalanceLbl = [[UILabel alloc] init];
    [self.view addSubview:_mBalanceLbl];
    _mBalanceLbl.font = FONT(16);
    _mBalanceLbl.textColor = [Utils getUIColorFromHex:0xffffffff];
    _mBalanceLbl.text = @"9999.0";
    [_mBalanceLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backView.mas_centerY);
        make.centerX.equalTo(backView.mas_centerX);
    }];
    
    UILabel* tipsLbl = [[UILabel alloc] init];
    [self.view addSubview:tipsLbl];
    tipsLbl.font = FONT(11);
    tipsLbl.textColor = [Utils getUIColorFromHex:0xffffffff];
    tipsLbl.text = @"租书费用余额（元）";
    [tipsLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_mBalanceLbl.mas_centerX);
        make.top.equalTo(_mBalanceLbl.mas_bottom).offset(6*Fit_RATE);
    }];
    
    CGFloat margin = 10*Fit_RATE;
    UIButton *chargeBtn = [[UIButton alloc] init];
    [self.view addSubview:chargeBtn];
    chargeBtn.titleLabel.font = FONT(14);
    [chargeBtn setTitleColor:[Utils getUIColorFromHex:0xffffffff] forState:UIControlStateNormal];
    [chargeBtn setBackgroundColor:ColorBlue];
    [chargeBtn setTitle:@"充值" forState:UIControlStateNormal];
    [chargeBtn addTarget:self action:@selector(onClickChargeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [chargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_bottom).offset(2*margin);
        make.left.equalTo(self.view.mas_left).offset(margin);
        make.right.equalTo(self.view.mas_right).offset(-margin);
        make.height.mas_equalTo(44*Fit_RATE);
    }];
}

@end
