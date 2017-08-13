//
//  LSNetWorkManager.h
//  ShareBook
//
//  Created by Lee on 2017/8/13.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkErrorModel.h"

@interface LSNetWorkManager : NSObject

/**
 单例
 */
+(instancetype)shareInstance;

/**
 服务器环境是否是测试环境

 @return YES：测试环境  NO：正式环境
 */
+(BOOL)isDevStatus;

@end
