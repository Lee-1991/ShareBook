//
//  LSNetWorkManager.h
//  ShareBook
//
//  Created by Lee on 2017/8/13.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkErrorModel.h"

@class BookInfoRespModel,SimpleRespModel;

/**
 滑动方向
 
 - Slide_Up: 向上滑动 = 1
 - Slide_Down: 向下滑动 = 2
 */
typedef NS_ENUM(NSInteger,Slide)
{
    ///向上滑动
    SlideUp = 1,
    ///向下滑动
    SlideDown = 2
};

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

/*****************************Get请求1.0*************************************/
//MARK: Get请求1.0

/**
 获取书籍信息
 */
- (void)getBookInfoWithBookId:(NSString *)bookId success:(void (^)(BookInfoRespModel *model))success failure:(void (^)(NetWorkErrorModel *netError))failure;

/*****************************Post请求1.0*************************************/
//MARK: Post请求1.0
/**
 发送验证码
 */
- (void)postVcodeFrom:(NSString *)from mobile:(NSString *)mobile success:(void (^)(SimpleRespModel *model))success failure:(void (^)(NetWorkErrorModel *netError))failure;

/*****************************Put请求1.0*************************************/
//MARK: Put请求1.0

/**
 校验验证码
 */
- (void)putCheckVcode:(NSString *)mobile vcode:(NSString *)vcode success:(void (^)(SimpleRespModel *model))success failure:(void (^)(NetWorkErrorModel *netError))failure;

@end
