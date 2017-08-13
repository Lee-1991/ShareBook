//
//  UserMiniInfoModel.h
//  ShareBook
//
//  Created by Lee on 2017/8/13.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, UserRelation) {
    
    UserRelationNone = 0,
    UserRelationFollowed = 1,
    UserRelationMutualFans = 2,
};


/**
 纬经度
 */
@interface GeoPointModel : NSObject

/**
 纬度
 */
@property (nonatomic, assign) Float64 lat;

/**
 经度
 */
@property (nonatomic, assign) Float64 lon;

@end

@interface UserMiniInfoModel : NSObject


/**
 经纬度
 */
@property (nonatomic, strong) GeoPointModel* geo_point;

/**
 昵称
 */
@property (nonatomic, copy) NSString* nickname;

/**
 头像
 */
@property (nonatomic, copy) NSString* portrait_url;

/**
 关系
 */
@property (nonatomic, assign) UserRelation relation;

/**
 性别
 */
@property (nonatomic, copy) NSString* sex;

/**
 签名
 */
@property (nonatomic, copy) NSString* signature;

/**
 星级
 */
@property (nonatomic, assign) Float32 star;

/**
 用户ID
 */
@property (nonatomic, assign) UInt64 uid;

@end
