//
//  SBSettingVC.m
//  ShareBook
//
//  Created by Lee on 2017/8/20.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBSettingVC.h"
#import "SBMineNormalCell.h"
#import <SDImageCache.h>


@interface SBSettingVC ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *mTableView;
@property (nonatomic,assign) NSUInteger mImageCacheSize;

@end


@implementation SBSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mHeaderView.mTitleLbl.text = @"设置";
    _mImageCacheSize = [[SDImageCache sharedImageCache] getSize];
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
    return cellNum;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat heightCell = 0;
    heightCell = [SBMineNormalCell heightOfCell];
    if (indexPath.section == 1 && indexPath.row == 1) {
        heightCell = 60;
    }
    
    return heightCell;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        cell = [self cellSectionFuncTableView:tableView indexPath:indexPath];
    }else if (indexPath.section == 1) {
        cell = [self cellSectionLogoutTableView:tableView rowIndexPath:indexPath];
    }
    
    // Configure the cell...
    
    return cell;
}

-(UITableViewCell *)cellSectionFuncTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = nil;
    
    switch (indexPath.row) {
        case 0:
            cell = [self cellNormalTitle:@"清楚缓存" tableView:tableView indexPath:indexPath];
            break;
            
        case 1:
            cell = [self cellNormalTitle:@"关于" tableView:tableView indexPath:indexPath];
            break;

        default:
            break;
    }
    
    return cell;

}


-(UITableViewCell *)cellSectionLogoutTableView:(UITableView *)tableView rowIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = nil;
    switch (indexPath.row) {
        case 0:
            cell = [self cellNormalTitle:@"用户协议" tableView:tableView indexPath:indexPath];
            break;
            
        case 1:
            cell = [self cellLogout];
            break;
            
        default:
            break;
    }
    
    return cell;
}

-(UITableViewCell *)cellNormalTitle:(NSString *)title tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    static NSString* cellId = @"mineCellNormal";
    SBMineNormalCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[SBMineNormalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    if (indexPath.section == 0 && indexPath.row == 0) {
        NSString*  cacheTips =  [NSString stringWithFormat:@"缓存%dk",(int)(_mImageCacheSize/1024)];
        [cell setDataWitmName:title tipsText:cacheTips];
    }else{
        [cell setDataWitmName:title tipsText:nil];
    }
    
    return cell;
}


-(UITableViewCell *)cellLogout{
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIView* backView = [[UIView alloc] init];
    [cell addSubview:backView];
    backView.backgroundColor = [UIColor orangeColor];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cell.mas_left).offset(10*Fit_RATE);
        make.right.equalTo(cell.mas_right).offset(-10*Fit_RATE);
        make.top.equalTo(cell.mas_top).offset(15*Fit_RATE);
        make.bottom.equalTo(cell.mas_bottom);
    }];
    
    UILabel* titleLbl = [[UILabel alloc] init];
    [cell addSubview:titleLbl];
    titleLbl.font = FONT(16);
    titleLbl.textColor = [Utils getUIColorFromHex:0xffffffff];
    titleLbl.text = @"退出登录";
    [titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(backView.mas_centerX);
        make.centerY.equalTo(backView.mas_centerY);
    }];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self clearImageCache];
        }else{
            
        }
    }else{
        if (indexPath.row == 0) {
            
        }else{
            
        }
    }
}
-(void)clearImageCache
{
    if(_mImageCacheSize > 0)
    {
        _mImageCacheSize = 0;
        
        [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
        [ITOToast show:@"已清理缓存" toastType:TOAST_SHORT];
        
        [_mTableView reloadData];
    }
}


-(void)setupContentView{
    _mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenW, ScreenH - 64)];
    _mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_mTableView];
    _mTableView.dataSource = self;
    _mTableView.delegate = self;
}

@end

