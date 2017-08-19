//
//  LSMineViewController.m
//  ShareBook
//
//  Created by Lee on 2017/8/19.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "LSMineViewController.h"
#import "SBMineNormalCell.h"
#import "SBMineUserInfoCell.h"
#import "SBMineBookStoreCell.h"

@interface LSMineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *mTableView;

@end

@implementation LSMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat heighHeader = 0;
    if (section == 1) {
        heighHeader = 10*Fit_RATE;
    }
    return heighHeader;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 10*Fit_RATE)];
    header.backgroundColor = ColorSeparateLine;
    return header;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger cellNum = 2;
    if (section == 1) {
        cellNum = 5;
    }
    return cellNum;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat heightCell = 0;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            heightCell = [SBMineUserInfoCell heightOfCell];
        }else if (indexPath.row == 1){
            heightCell = [SBMineBookStoreCell heightOfCell];
        }
    }else if (indexPath.section == 1) {
        heightCell = [SBMineNormalCell heightOfCell];
    }
    
    return heightCell;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        cell = [self cellSectionUserTableView:tableView indexPath:indexPath];
    }else if (indexPath.section == 1) {
        cell = [self cellSectionNormalTableView:tableView rowIndexPath:indexPath];
    }
    
    // Configure the cell...
    
    return cell;
}

-(UITableViewCell *)cellSectionUserTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = nil;
    if (indexPath.row == 0) {
        cell = [self cellUserInfoTableView:tableView indexPath:indexPath];
    }else if (indexPath.row == 1){
        cell = [self cellBookStoreTableView:tableView indexPath:indexPath];
    }
    return cell;
}

-(UITableViewCell *)cellUserInfoTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    static NSString* cellId = @"mineCellUserInfo";
    SBMineUserInfoCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[SBMineUserInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    return cell;
}

-(UITableViewCell *)cellBookStoreTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    static NSString* cellId = @"mineCellBookStore";
    SBMineBookStoreCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[SBMineBookStoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

-(UITableViewCell *)cellSectionNormalTableView:(UITableView *)tableView rowIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellId = @"mineCellNormal";
    SBMineNormalCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[SBMineNormalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    switch (indexPath.row) {
        case 0:
            [cell setDataWitmName:@"我的钱包" tipsText:@"9999"];
            break;
            
        case 1:
            [cell setDataWitmName:@"历史记录" tipsText:nil];
            break;
            
        case 2:
            [cell setDataWitmName:@"联系客服" tipsText:nil];
            break;
            
        case 3:
            [cell setDataWitmName:@"充值协议" tipsText:nil];
            break;
            
        case 4:
            [cell setDataWitmName:@"设置" tipsText:nil];
            break;
        default:
            break;
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
        } else if(indexPath.row == 1) {
            [[SBPageJumpManager shareInstance] pushToUserInfoVCWithUid:000];
        }
    } else if(indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                
                break;
                
            case 1:
                
                break;
                
            case 2:
                
                break;
                
            case 3:
                
                break;
                
            case 4:
                
                break;
            default:
                break;
        }
    }
}

-(void)setupContentView{
    _mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH-49)];
    [self.view addSubview:_mTableView];
    _mTableView.delegate = self;
    _mTableView.dataSource = self;
}

@end
