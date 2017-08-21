//
//  SBRegisterVC.m
//  ShareBook
//
//  Created by Lee on 2017/8/21.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBRegisterVC.h"
#import "SBMineNormalCell.h"

@interface SBRegisterVC ()

@property (strong,nonatomic) UITextField *mPhoneNumField;

@end

@implementation SBRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mHeaderView.mTitleLbl.text = @"注册";
    [self setupContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_mPhoneNumField resignFirstResponder];
}

-(void)onClickNextBtn:(UIButton *)sender{
    if (_mPhoneNumField.text.length == 0) {
        [ITOToast show:@"手机号不能为空" toastType:TOAST_SHORT dy:ScreenH*0.5];
        [_mPhoneNumField becomeFirstResponder];
        return;
    }
    
}

-(void)setupContentView{
    
    UIView* topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 64+20, ScreenW, 1*Fit_RATE)];
    [self.view addSubview:topLine];
    topLine.backgroundColor = ColorSeparateLine;
    
    CGFloat heightLbl = 44*Fit_RATE;
    SBMineNormalCell* locationView = [[SBMineNormalCell alloc] init];
    [self.view addSubview:locationView];
    [locationView setDataWitmName:@"国家地区" tipsText:@"中国大陆+86"];
    [locationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(topLine.mas_bottom);
        make.height.mas_equalTo(heightLbl);
    }];
    
    UILabel* phoneNumLbl = [[UILabel alloc] init];
    [self.view addSubview:phoneNumLbl];
    phoneNumLbl.font = FONT(16);
    phoneNumLbl.textColor = ColorTextBlack;
    phoneNumLbl.text = @"手机号：";
    [phoneNumLbl sizeToFit];
    [phoneNumLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(NormalMargin);
        make.top.equalTo(locationView.mas_bottom);
        make.height.mas_equalTo(heightLbl);
        make.width.mas_equalTo(phoneNumLbl.width);
    }];
    
    _mPhoneNumField = [[UITextField alloc] init];
    [self.view addSubview:_mPhoneNumField];
    _mPhoneNumField.font = FONT(14);
    _mPhoneNumField.textColor = ColorTextBlack;
    _mPhoneNumField.placeholder = @"请输入手机号";
    _mPhoneNumField.keyboardType = UIKeyboardTypeNumberPad;
    [_mPhoneNumField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneNumLbl.mas_right);
        make.top.equalTo(phoneNumLbl.mas_top);
        make.bottom.equalTo(phoneNumLbl.mas_bottom);
        make.right.equalTo(self.view.mas_right).offset(-NormalMargin);
    }];
    
    
    UIView *bottomLine = [[UIView alloc] initSeparateLineDefault];
    [self.view addSubview:bottomLine];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(phoneNumLbl.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(1*Fit_RATE);
    }];
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [self.view addSubview:loginBtn];
    loginBtn.titleLabel.font = FONT(16);
    loginBtn.backgroundColor = ColorBlue;
    [loginBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(onClickNextBtn:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(NormalMargin);
        make.top.equalTo(bottomLine.mas_bottom).offset(15*Fit_RATE);
        make.height.mas_equalTo(heightLbl);
        make.right.equalTo(self.view.mas_right).offset(-NormalMargin);
    }];
}


@end
