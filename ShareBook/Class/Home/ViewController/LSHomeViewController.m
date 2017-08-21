//
//  LSHomeViewController.m
//  ShareBook
//
//  Created by Lee on 2017/8/12.
//  Copyright © 2017年 Lee. All rights reserved.
//
//  借书

#import "LSHomeViewController.h"
#import "IndicatorTab.h"
#import "MessagePage.h"
#import "SBBorrowBookCell.h"

@interface LSHomeViewController ()<IndicatorTabDelegete,MessagePageDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) MessagePage *mTableView;

@end

@implementation LSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    [self setupContentView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK: IndicatorTabDelegete
-(void)onIndicatorSelected:(int)index{
    
}

//MARK: UItableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellId = @"borrowBookCell";
    SBBorrowBookCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[SBBorrowBookCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [SBBorrowBookCell heightOfCell];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[SBPageJumpManager shareInstance] pushToUserInfoVCWithUid:1111];
}

//MARK: MessagePageDelegate
-(void)doRefresh{
    [_mTableView comepleteRefreshAndLoadMore];
}

-(void)doLoadMore{
    [_mTableView comepleteRefreshAndLoadMore];
}

-(void)setupContentView{
    //
    IndicatorTab* indicator = [[IndicatorTab alloc] initWithFrame:CGRectMake(0, 20, ScreenW, 44)];
    [self.view addSubview:indicator];
    indicator.mDelegate = self;
    indicator.mShowSeperateLine = YES;
    NSArray* items = [NSArray arrayWithObjects:@"距离",@"数量",@"优选",@"好友", nil];
    [indicator setData:items];
    
    _mTableView = [[MessagePage alloc] initWithFrame:CGRectMake(0, 64, ScreenW, ScreenH - 64-49)];
    [self.view addSubview:_mTableView];
    _mTableView.mMessagePageDelegate = self;
    _mTableView.dataSource = self;
    _mTableView.delegate = self;
}

@end
