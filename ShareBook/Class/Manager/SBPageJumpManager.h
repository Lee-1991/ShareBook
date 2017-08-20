//
//  SBPageJumpManager.h
//  ShareBook
//
//  Created by Lee on 2017/8/17.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBPageJumpManager : NSObject

/**
 单列
 */
+ (instancetype)shareInstance;


-(void)pushToBookDetailVCBookId:(NSString *)bookId;

-(void)pushToUserInfoVCWithUid:(UInt64)uid;

-(void)pushToSettingVC;

-(void)pushToPurseVC;

-(void)pushToHistoryVC;

-(void)pushToChargeVC;

@end
