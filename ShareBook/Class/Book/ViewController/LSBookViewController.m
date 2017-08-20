//
//  LSBookViewController.m
//  ShareBook
//
//  Created by Lee on 2017/8/12.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "LSBookViewController.h"
#import "IndicatorTab.h"
#import "MessagePage.h"

@interface LSBookViewController ()<IndicatorTabDelegete,MessagePageDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) MessagePage *mTableView;

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

//MARK: UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    return cell;
}


//MARK: IndicatorTabDelegete
-(void)onIndicatorSelected:(int)index{
    
}

//MARK: MessagepageDelegate
-(void)doRefresh{
    
}

-(void)doLoadMore{}

-(void)setupContentView{
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 64)];
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
    
    IndicatorTab* indicator = [[IndicatorTab alloc] initWithFrame:CGRectMake(0, 64, ScreenW, 44)];
    [self.view addSubview:indicator];
    indicator.mDelegate = self;
    indicator.mShowSeperateLine = YES;
    NSArray* items = [NSArray arrayWithObjects:@"借入",@"借出", nil];
    [indicator setData:items];
    
    _mTableView = [[MessagePage alloc] initWithFrame:CGRectMake(0, 108, ScreenW, ScreenH - 108 - 49)];
    [self.view addSubview:_mTableView];
    [_mTableView setRefreshType:SetRefreshTypeHeaderOnly];
    _mTableView.mMessagePageDelegate = self;
    _mTableView.dataSource = self;
    _mTableView.delegate = self;
}

@end
