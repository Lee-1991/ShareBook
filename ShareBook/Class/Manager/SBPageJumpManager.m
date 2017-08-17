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

@end
