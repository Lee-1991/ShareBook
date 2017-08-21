//
//  SBPageJumpManager.m
//  ShareBook
//
//  Created by Lee on 2017/8/17.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBPageJumpManager.h"
#import "SBBookDetailVC.h"
#import "SBUserInfoVC.h"
#import "SBSettingVC.h"
#import "SBPurseVC.h"
#import "SBHistoryVC.h"
#import "SBChargeVC.h"
#import "SBModifyInfoVC.h"
#import "SBAddBookVC.h"
#import "SBLoginVC.h"
#import "SBRegisterVC.h"
#import "SBContactCustomerVC.h"
#import "SBChargeProtocolVC.h"

@implementation SBPageJumpManager

+(instancetype)shareInstance{
    static SBPageJumpManager* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

-(UIViewController *)currentVC
{
    UIViewController *currentVC = [[(UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController viewControllers] lastObject];
    return currentVC;
}

-(void)pushToBookDetailVCBookId:(NSString *)bookId{
    SBBookDetailVC *vc = [[SBBookDetailVC alloc] init];
    vc.mHeaderView.mTitleLbl.text = @"书籍详情";
    vc.mBookId = bookId;
    [[self currentVC].navigationController pushViewController:vc animated:YES];
}

-(void)pushToUserInfoVCWithUid:(UInt64)uid{
    SBUserInfoVC *vc = [[SBUserInfoVC alloc] init];
    vc.mUid = uid;
    [[self currentVC].navigationController pushViewController:vc animated:YES];
}

-(void)pushToSettingVC{
    SBSettingVC *vc = [[SBSettingVC alloc] init];
    [[self currentVC].navigationController pushViewController:vc animated:YES];
}

-(void)pushToPurseVC{
    SBPurseVC* vc = [[SBPurseVC alloc] init];
    [[self currentVC].navigationController pushViewController:vc animated:YES];
}

-(void)pushToHistoryVC{
    SBHistoryVC *vc = [[SBHistoryVC alloc] init];
    [[self currentVC].navigationController pushViewController:vc animated:YES];
}

-(void)pushToChargeVC{
    SBChargeVC *vc = [[SBChargeVC alloc] init];
    [[self currentVC].navigationController pushViewController:vc animated:YES];
}

-(void)pushToModifyInfoVC{
    SBModifyInfoVC *vc = [[SBModifyInfoVC alloc] init];
    [[self currentVC].navigationController pushViewController:vc animated:YES];
}

-(void)pushToAddBookVCTitle:(NSString *)title{
    SBAddBookVC *vc = [[SBAddBookVC alloc] init];
    vc.mTitleStr = title;
    [[self currentVC].navigationController pushViewController:vc animated:YES];
}

-(void)pushToLoginVC{
    SBLoginVC *vc = [[SBLoginVC alloc] init];
    [[self currentVC].navigationController pushViewController:vc animated:YES];
}

-(void)pushToRegisterVC{
    SBRegisterVC *vc = [[SBRegisterVC alloc] init];
    [[self currentVC].navigationController pushViewController:vc animated:YES];
}

-(void)pushToContactCustomerVC{
    SBContactCustomerVC* vc = [[SBContactCustomerVC alloc] init];
    [[self currentVC].navigationController pushViewController:vc animated:YES];
}

-(void)pushToChargeProtocolVC{
    SBChargeProtocolVC *vc = [[SBChargeProtocolVC alloc] init];
    [[self currentVC].navigationController pushViewController:vc animated:YES];
}

@end
