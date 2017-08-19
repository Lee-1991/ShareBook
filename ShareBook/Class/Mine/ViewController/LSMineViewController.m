//
//  LSMineViewController.m
//  ShareBook
//
//  Created by Lee on 2017/8/19.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "LSMineViewController.h"
#import "SBMineNormalCell.h"

@interface LSMineViewController ()

@end

@implementation LSMineViewController

-(instancetype)init{
    self = [super initWithStyle:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger cellNum = 0;
    if (section == 1) {
        cellNum = 5;
    }
    return cellNum;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat heightCell = 0;
    if (indexPath.section == 1) {
        heightCell = [SBMineNormalCell heightOfCell];
    }
    
    return heightCell;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = nil;
    if (indexPath.section == 1) {
        cell = [self cellNormalTableView:tableView rowIndexPath:indexPath];
    }
    
    // Configure the cell...
    
    return cell;
}

-(UITableViewCell *)cellNormalTableView:(UITableView *)tableView rowIndexPath:(NSIndexPath *)indexPath{
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








@end
