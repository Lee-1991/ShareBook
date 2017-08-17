//
//  SBBookDetailVC.m
//  ShareBook
//
//  Created by Lee on 2017/8/17.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBBookDetailVC.h"
#import "SBBookDetailInfoView.h"
#import "SBBookDetailBottomView.h"

@interface SBBookDetailVC ()

@property (strong,nonatomic) SBBookDetailInfoView *mBookInfoView;
@property (strong,nonatomic) SBBookDetailBottomView *mBottomView;

@end

@implementation SBBookDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mHeaderView.mTitleLbl.text = @"书籍详情";
    [self setupContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setupContentView{
    _mBookInfoView = [[SBBookDetailInfoView alloc] init];
    [self.view addSubview:_mBookInfoView];
    [_mBookInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.mHeaderView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(ScreenW, 217*Fit_RATE));
    }];
    
    _mBottomView = [[SBBookDetailBottomView alloc] init];
    [self.view addSubview:_mBottomView];
    [_mBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.mas_equalTo([SBBookDetailBottomView heightOfBottomView]);
    }];
}


@end
