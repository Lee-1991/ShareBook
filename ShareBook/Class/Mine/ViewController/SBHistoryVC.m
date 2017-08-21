//
//  SBHistoryVC.m
//  ShareBook
//
//  Created by Lee on 2017/8/20.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBHistoryVC.h"
#import "MessagePage.h"
#import "SBTakeBookCell.h"

@interface SBHistoryVC ()<MessagePageDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) MessagePage *mTableView;

@end

@implementation SBHistoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mHeaderView.mTitleLbl.text = @"历史记录";
    [self setupContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK: UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [SBTakeBookCell heightOfCell];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"";
    SBTakeBookCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[SBTakeBookCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

-(void)doRefresh{
    [_mTableView comepleteRefreshAndLoadMore];
}

-(void)doLoadMore{
    [_mTableView comepleteRefreshAndLoadMore];
}

-(void)setupContentView{
    _mTableView = [[MessagePage alloc] initWithFrame:CGRectMake(0, 64, ScreenW, ScreenH-64)];
    [self.view addSubview:_mTableView];
    _mTableView.mMessagePageDelegate = self;
    _mTableView.delegate = self;
    _mTableView.dataSource = self;
}

@end
