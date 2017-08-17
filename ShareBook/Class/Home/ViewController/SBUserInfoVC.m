//
//  SBUserInfoVC.m
//  ShareBook
//
//  Created by Lee on 2017/8/17.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBUserInfoVC.h"
#import "SBUserInfoView.h"

@interface SBUserInfoVC ()

@property (strong,nonatomic) SBUserInfoView *mUserInfoView;

@end

@implementation SBUserInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mHeaderView.mTitleLbl.text = @"借书";
    self.mHeaderView.mSeparateLine.hidden = YES;
    [self setupContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupContentView{
    _mUserInfoView = [[SBUserInfoView alloc] init];
    [self.view addSubview:_mUserInfoView];
    [_mUserInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.mHeaderView.mas_bottom);
        make.height.mas_equalTo([SBUserInfoView heightOfInfoView]);
    }];
}

@end
