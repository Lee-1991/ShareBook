//
//  BookInfoRespModel.h
//  ShareBook
//
//  Created by Lee on 2017/8/13.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "BaseRespModel.h"
#import "UserMiniInfoModel.h"
#import "BookInfoModel.h"

/**
 提示
 */
@interface PromptModel : NSObject

@property (nonatomic, assign) UInt32 everyday_fee;

@property (nonatomic, assign) UInt32 firstday_fee;

@end

@interface BookInfoRespModel : BaseRespModel

@property (nonatomic, strong) BookInfoModel *info;

@property (nonatomic, strong) PromptModel *prompt;

@property (nonatomic, strong) UserMiniInfoModel *user;

@end
