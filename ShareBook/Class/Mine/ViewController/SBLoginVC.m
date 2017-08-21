//
//  SBLoginVC.m
//  ShareBook
//
//  Created by Lee on 2017/8/21.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBLoginVC.h"

@interface SBLoginVC ()<UITextFieldDelegate>

@property (strong,nonatomic) UITextField *mPhoneNumField;
@property (strong,nonatomic) UITextField *mPasswordFied;

@end

@implementation SBLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mHeaderView.mTitleLbl.text = @"登录";
    self.mHeaderView.mBackBtn.hidden = YES;
    [self setupContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self resignFirstResponderPhoneAndPasswordField];
}

-(void)resignFirstResponderPhoneAndPasswordField{
    [_mPasswordFied resignFirstResponder];
    [_mPhoneNumField resignFirstResponder];
}

//MARK: UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField == _mPhoneNumField) {
//        textField
    }
}

-(void)onClickLoginBtn:(UIButton *)sender{
    
    if (_mPhoneNumField.text.length == 0) {
        [ITOToast show:@"手机号不能为空" toastType:TOAST_SHORT dy:ScreenH*0.5];
        [_mPhoneNumField becomeFirstResponder];
        return;
    }
    if(_mPasswordFied.text.length == 0){
        [ITOToast show:@"密码不能为空" toastType:TOAST_SHORT dy:ScreenH*0.5];
        [_mPasswordFied becomeFirstResponder];
        return;
    }
    
    [self resignFirstResponderPhoneAndPasswordField];
}

-(void)onClickWeChatLoginBtn:(UIButton *)sender{
    [self resignFirstResponderPhoneAndPasswordField];
}

-(void)onClickRegisterBtn:(UIButton *)sender{
    [self resignFirstResponderPhoneAndPasswordField];
    [[SBPageJumpManager shareInstance] pushToRegisterVC];
}

-(void)setupContentView{
    
    UIView* topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 64+20, ScreenW, 1*Fit_RATE)];
    [self.view addSubview:topLine];
    topLine.backgroundColor = ColorSeparateLine;
    
    CGFloat heightLbl = 44*Fit_RATE;
    UILabel* phoneNumLbl = [[UILabel alloc] init];
    [self.view addSubview:phoneNumLbl];
    phoneNumLbl.font = FONT(14);
    phoneNumLbl.textColor = ColorTextLightGray;
    phoneNumLbl.text = @"手机号：";
    [phoneNumLbl sizeToFit];
    [phoneNumLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(NormalMargin);
        make.top.equalTo(topLine.mas_bottom);
        make.height.mas_equalTo(heightLbl);
        make.width.mas_equalTo(phoneNumLbl.width);
    }];
    
    _mPhoneNumField = [[UITextField alloc] init];
    [self.view addSubview:_mPhoneNumField];
    _mPhoneNumField.font = FONT(14);
    _mPhoneNumField.textColor = ColorTextBlack;
    _mPhoneNumField.placeholder = @"请输入手机号";
    _mPhoneNumField.keyboardType = UIKeyboardTypeNumberPad;
    _mPhoneNumField.delegate = self;
    [_mPhoneNumField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneNumLbl.mas_right);
        make.top.equalTo(phoneNumLbl.mas_top);
        make.bottom.equalTo(phoneNumLbl.mas_bottom);
        make.right.equalTo(self.view.mas_right).offset(-NormalMargin);
    }];
    
    UIView *separateLine = [[UIView alloc] initSeparateLineDefault];
    [self.view addSubview:separateLine];
    [separateLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneNumLbl.mas_left);
        make.right.equalTo(self.view.mas_right).offset(-NormalMargin);
        make.top.equalTo(phoneNumLbl.mas_bottom);
        make.height.mas_equalTo(1*Fit_RATE);
    }];
    
    UILabel* passwordLbl = [[UILabel alloc] init];
    [self.view addSubview:passwordLbl];
    passwordLbl.font = FONT(14);
    passwordLbl.textColor = ColorTextLightGray;
    passwordLbl.text = @"密码：";
    [passwordLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(NormalMargin);
        make.top.equalTo(phoneNumLbl.mas_bottom);
        make.height.mas_equalTo(heightLbl);
    }];
    
    _mPasswordFied = [[UITextField alloc] init];
    [self.view addSubview:_mPasswordFied];
    _mPasswordFied.font = FONT(14);
    _mPasswordFied.textColor = ColorTextBlack;
    _mPasswordFied.placeholder = @"请输入密码";
    _mPasswordFied.secureTextEntry = YES;
    _mPasswordFied.delegate = self;
    [_mPasswordFied mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passwordLbl.mas_right);
        make.top.equalTo(passwordLbl.mas_top);
        make.bottom.equalTo(passwordLbl.mas_bottom);
        make.right.equalTo(self.view.mas_right).offset(-NormalMargin);
    }];
    
    UIView *bottomLine = [[UIView alloc] initSeparateLineDefault];
    [self.view addSubview:bottomLine];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(passwordLbl.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(1*Fit_RATE);
    }];

    UIButton *loginBtn = [[UIButton alloc] init];
    [self.view addSubview:loginBtn];
    loginBtn.titleLabel.font = FONT(16);
    loginBtn.backgroundColor = ColorBlue;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(onClickLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(NormalMargin);
        make.top.equalTo(bottomLine.mas_bottom).offset(15*Fit_RATE);
        make.height.mas_equalTo(heightLbl);
        make.right.equalTo(self.view.mas_right).offset(-NormalMargin);
    }];
    
    UIButton *weChatBtn = [[UIButton alloc] init];
    [self.view addSubview:weChatBtn];
    weChatBtn.titleLabel.font = FONT(14);
    [weChatBtn setTitleColor:ColorTextLightGray forState:UIControlStateNormal];
    [weChatBtn setTitle:@"微信登录" forState:UIControlStateNormal];
    [weChatBtn addTarget:self action:@selector(onClickWeChatLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    [weChatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(loginBtn.mas_left);
        make.top.equalTo(loginBtn.mas_bottom).offset(NormalMargin);
    }];
    
    UIButton *registerBtn = [[UIButton alloc] initWithFont:FONT(14) titleColor:ColorTextOrange title:@"免费注册"];
    [self.view addSubview:registerBtn];
    registerBtn.layer.borderWidth = 1*Fit_RATE;
    registerBtn.layer.borderColor = ColorTextOrange.CGColor;
    registerBtn.layer.cornerRadius = 4*Fit_RATE;
    registerBtn.layer.masksToBounds = YES;
    [registerBtn addTarget:self action:@selector(onClickRegisterBtn:) forControlEvents:UIControlEventTouchUpInside];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(loginBtn.mas_bottom).offset(120*Fit_RATE);
        make.size.mas_equalTo(CGSizeMake(100*Fit_RATE, 36*Fit_RATE));
    }];
}

@end
