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

@end
