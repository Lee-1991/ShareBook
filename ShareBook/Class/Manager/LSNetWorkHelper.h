//
//  LSNetWorkHelper.h
//  ShareBook
//
//  Created by Lee on 2017/8/13.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSNetWorkHelper : NSObject

/**
 单例
 */
+(instancetype)shareInstance;




/**
 http请求（get）
 
 @param path 请求路径
 @param parameters 请求参数
 @param success 请求成功
 @param failure 请求失败
 */
-(void)getDataWithPath:(NSString *)path parameters:(NSDictionary* )parameters success:(void (^)(NSDictionary *dict))success failure:(void (^)(NetWorkErrorModel *netError))failure;

/**
 http请求（post）
 
 @param path 请求路径
 @param parameters 请求参数
 @param success 请求成功
 @param failure 请求失败
 */
-(void)postDataWithPath:(NSString *)path parameters:(NSDictionary* )parameters success:(void (^)(NSDictionary *dict))success failure:(void (^)(NetWorkErrorModel *netError))failure;



/**
 http请求（delete）
 
 @param path 请求路径
 @param parameters 请求参数
 @param success 请求成功回调
 @param failure 请求失败的回调
 */
-(void)deleteDataWithPath:(NSString *)path parameters:(NSDictionary* )parameters success:(void (^)(NSDictionary *dict))success failure:(void (^)(NetWorkErrorModel *netError))failure;



/**
 http请求(put) php切Go的新域名
 */
-(void)putDataWithPath:(NSString *)path parameters:(NSDictionary* )parameters success:(void (^)(NSDictionary *dict))success failure:(void (^)(NetWorkErrorModel *netError))failure;




@end
