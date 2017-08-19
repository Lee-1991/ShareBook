//
//  LSBookViewController.m
//  ShareBook
//
//  Created by Lee on 2017/8/12.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "LSBookViewController.h"

@interface LSBookViewController ()

@end

@implementation LSBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupContentView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupContentView{
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 66)];
    [self.view addSubview:headerView];
    headerView.backgroundColor = [Utils getUIColorFromHex:0xff43c6ff];
    
    UILabel* titleLbl = [[UILabel alloc] init];
    [self.view addSubview:titleLbl];
    titleLbl.font = FONT(16);
    titleLbl.textColor = [Utils getUIColorFromHex:0xffffffff];
    titleLbl.text = @"取书";
    [titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(headerView.mas_bottom).offset(-13*Fit_RATE);
    }];
}

@end
