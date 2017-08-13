//
//  LSNetWorkManager.m
//  ShareBook
//
//  Created by Lee on 2017/8/13.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "LSNetWorkManager.h"
#import "LSNetWorkHelper.h"
#import "BookInfoRespModel.h"
#import "SimpleRespModel.h"
#import "SendVCodelReqModel.h"
#import "CheckVcodeReqModel.h"

@implementation LSNetWorkManager

+(instancetype)shareInstance{
    
    static LSNetWorkManager* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
    
}

+(BOOL)isDevStatus{
    return YES;
}



-(void)getBookInfoWithBookId:(NSString *)bookId success:(void (^)(BookInfoRespModel *))success failure:(void (^)(NetWorkErrorModel *))failure{
    
    NSString* path = [NSString stringWithFormat:@"/v1.0/book/%@",bookId];
    
    [[LSNetWorkHelper shareInstance] getDataWithPath:path parameters:nil success:^(NSDictionary *dict) {
        BookInfoRespModel* model = [BookInfoRespModel mj_objectWithKeyValues:dict];
        success(model);
    } failure:^(NetWorkErrorModel *netError) {
        failure(netError);
    }];
}

-(void)postVcodeFrom:(NSString *)from mobile:(NSString *)mobile success:(void (^)(SimpleRespModel *))success failure:(void (^)(NetWorkErrorModel *))failure{
    
    SendVCodelReqModel* req = [[SendVCodelReqModel alloc] init];
    req.from = from;
    req.mobile = mobile;
    NSDictionary* para = req.mj_keyValues;
    
    NSString* path = [NSString stringWithFormat:@"/v1.0/user/vcode"];
    
    [[LSNetWorkHelper shareInstance] postDataWithPath:path parameters:para success:^(NSDictionary *dict) {
        SimpleRespModel* model = [SimpleRespModel mj_objectWithKeyValues:dict];
        success(model);
    } failure:^(NetWorkErrorModel *netError) {
        failure(netError);
    }];
    
}

-(void)putCheckVcode:(NSString *)mobile vcode:(NSString *)vcode success:(void (^)(SimpleRespModel *))success failure:(void (^)(NetWorkErrorModel *))failure{

    CheckVcodeReqModel* req = [[CheckVcodeReqModel alloc] init];
    req.mobile = mobile;
    req.vcode = vcode;
    NSDictionary* para = req.mj_keyValues;
    
    NSString* path = @"/v1.0/user/vcode";
    
    [[LSNetWorkHelper shareInstance] putDataWithPath:path parameters:para success:^(NSDictionary *dict) {
        SimpleRespModel* model = [SimpleRespModel mj_objectWithKeyValues:dict];
        success(model);
    } failure:^(NetWorkErrorModel *netError) {
        failure(netError);
    }];
}



@end
