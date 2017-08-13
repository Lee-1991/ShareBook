//
//  BaseRespModel.h
//  PlatformGL
//
//  Created by lee on 17/2/7.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 请求结果码
 
 - RequestRcode_Success: 处理成功
 - RequestRcode_Fail: 处理失败
 - RequestRcode_Parameter: 参数错误
 - RequestRcode_SystemError: 系统错误
 - RequestRcode_MobileExist: 手机号已占用
 - RequestRcode_NickNameExist: 昵称已占用
 - RequestRcode_Mismatch: 账号密码不匹配
 - RequestRcode_NoAccount: 账号不存在
 - RequestRcode_InvalidSid: 无效的sid
 - RequestRcode_InvalidVcode: 无效的验证码
 - RequestRcode_UpToLimit: 超过量了
 - RequestRcode_PermissionDenied: 无权限
 - RequestRcode_NotBindMobile: 未绑定手机号
 - RequestRcode_InvalidProductID: 无效的产品id
 - RequestRcode_InvalidOrderID: 无效的订单id
 - RequestRcode_OrderDealt: 已处理的订单
 - RequestRcode_DuplicateOperation: 重复操作
 - RequestRcode_AppKeyInvalid: appkey无效
 - RequestRcode_SignInvalid: 签名无效
 - RequestRcode_DirtyWord: 有敏感词
 - RequestRcode_SourceDeleted: 数据源不在了
 - RequestRcode_CoinNotEnough: 货币不足
 - RequestRcode_NoData: 数据为空
 */
typedef NS_ENUM(NSInteger,RequestRcode)
{
    RequestRcode_Success = 0,
    RequestRcode_Fail = 1,
    RequestRcode_Parameter = 2,
    RequestRcode_SystemError = 3,
    RequestRcode_MobileExist = 4,
    RequestRcode_NickNameExist = 5,
    RequestRcode_Mismatch = 6,
    RequestRcode_NoAccount = 7,
    RequestRcode_InvalidSid = 8,
    RequestRcode_InvalidVcode = 9,
    RequestRcode_UpToLimit = 10,
    RequestRcode_PermissionDenied = 11,
    RequestRcode_NotBindMobile = 12,
    RequestRcode_InvalidProductID = 13,
    RequestRcode_InvalidOrderID = 14,
    RequestRcode_OrderDealt = 15,
    RequestRcode_DuplicateOperation = 16,
    RequestRcode_AppKeyInvalid = 17,
    RequestRcode_SignInvalid = 18,
    RequestRcode_DirtyWord = 19,
    RequestRcode_SourceDeleted = 20,
    RequestRcode_CoinNotEnough = 21,
    RequestRcode_NoData = 22,
};


@interface BaseRespModel : NSObject

/**
 请求返回值
 */
@property (nonatomic, assign) RequestRcode rcode;

/**
 错误信息
 */
@property (nonatomic, copy) NSString* err_msg;

/**
 上拉新页参数
 */
@property (nonatomic, copy) NSString* top;

/**
 下拉新页参数
 */
@property (nonatomic, copy) NSString* bottom;

/**
 滑动方向1:向上滑动 2:向下滑动
 */
@property (nonatomic, assign) Slide slide;

/**
 是否有更多
 */
@property (nonatomic, assign) BOOL has_more;

@end
