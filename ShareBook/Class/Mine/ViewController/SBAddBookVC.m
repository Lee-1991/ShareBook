//
//  SBAddBookVC.m
//  ShareBook
//
//  Created by Lee on 2017/8/21.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBAddBookVC.h"

@interface SBAddBookVC ()

@end

@implementation SBAddBookVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mHeaderView.mTitleLbl.text = _mTitleStr;
    self.mHeaderView.mFinishBtn.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
