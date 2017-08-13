//
//  AppEngine.h
//  ShareBook
//
//  Created by Lee on 2017/8/13.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppEngine : NSObject

/**
 用户uid
 */
@property (nonatomic, assign) NSInteger mUserId;

/**
 登陆校验
 */
@property (nonatomic, copy) NSString* mSid;


/**
 单例
 */
+(instancetype)shareInstance;

@end
