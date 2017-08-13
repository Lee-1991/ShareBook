//
//  NetWorkErrorModel.h
//  PlatformGL
//
//  Created by lee on 16/12/23.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 错误提示码

 - NetWorkErrorCode_NetError: 网络错误
 */
typedef NS_ENUM(NSInteger, NetWorkErrorCode)
{
    NetWorkErrorCode_NetError = -1,
};

@interface NetWorkErrorModel : NSObject

/**
 错误码
 */
@property (nonatomic, assign) NetWorkErrorCode errorCode;

/**
 错误描述
 */
@property (nonatomic, copy) NSString* errorDescribe;

@end
