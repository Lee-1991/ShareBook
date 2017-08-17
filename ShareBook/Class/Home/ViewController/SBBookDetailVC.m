//
//  SBBookDetailVC.m
//  ShareBook
//
//  Created by Lee on 2017/8/17.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBBookDetailVC.h"
#import "SBBorrowBookCellTopView.h"

@interface SBBookDetailVC ()

@property (strong,nonatomic) SBBorrowBookCellTopView *mTopView;

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
    _mTopView = [[SBBorrowBookCellTopView alloc] init];
    [self.view addSubview:_mTopView];
    [_mTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.mHeaderView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(ScreenW, [SBBorrowBookCellTopView heightOfCellTopView]));
    }];
    
    
}


@end
