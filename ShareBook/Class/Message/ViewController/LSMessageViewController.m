//
//  LSMessageViewController.m
//  ShareBook
//
//  Created by Lee on 2017/8/12.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "LSMessageViewController.h"
#import "MessagePage.h"
#import "SBHomeMessageCell.h"

@interface LSMessageViewController ()<MessagePageDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) MessagePage *mTableView;

@end

@implementation LSMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    return [SBHomeMessageCell heightOfCell];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"homeMessageCell";
    SBHomeMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[SBHomeMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    return cell;
}


//MARK: MessagePageDelegate
-(void)doRefresh{
    [_mTableView comepleteRefreshAndLoadMore];
}

-(void)doLoadMore{
    
}

-(void)setupContentView{
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 66)];
    [self.view addSubview:headerView];
    headerView.backgroundColor = [Utils getUIColorFromHex:0xff43c6ff];
    
    UILabel* titleLbl = [[UILabel alloc] init];
    [self.view addSubview:titleLbl];
    titleLbl.font = FONT(16);
    titleLbl.textColor = [Utils getUIColorFromHex:0xffffffff];
    titleLbl.text = @"消息";
    [titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(headerView.mas_bottom).offset(-13*Fit_RATE);
    }];
    
    _mTableView = [[MessagePage alloc] initWithFrame:CGRectMake(0, 66, ScreenW, ScreenH-66)];
    [self.view addSubview:_mTableView];
    [_mTableView setRefreshType:SetRefreshTypeHeaderOnly];
    _mTableView.mMessagePageDelegate = self;
    _mTableView.delegate = self;
    _mTableView.dataSource = self;
}


@end
