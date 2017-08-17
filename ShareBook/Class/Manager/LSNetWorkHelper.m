//
//  LSNetWorkHelper.m
//  ShareBook
//
//  Created by Lee on 2017/8/13.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "LSNetWorkHelper.h"
#import <AFHTTPSessionManager.h>
//#import "OpenUDID.h"

//paas的appkey 太阳tv
#define APP_KEY    @"3ab50bee7fdd35c198dda3837d457b32"
#define APP_SECRET @"f7769715dd7d65e92de9pd8aa8e7asae1x5f"

//host
#define SHAREBOOK_SERVER_OFFICAL @""
#define SHAREBOOK_SERVER_TEST    @""

#define HTTP_GET  @"GET"
#define HTTP_POST @"POST"
#define HTTP_DELETE @"DELETE"
#define HTTP_PUT @"PUT"

@interface LSNetWorkHelper()

@property (nonatomic, strong) AFHTTPSessionManager* mManager;

@end

@implementation LSNetWorkHelper

+(instancetype)shareInstance{

    static LSNetWorkHelper* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

-(instancetype)init{
    
    if (self = [super init]) {
        [self initManager];
    }
    
    return self;
}

-(void)initManager
{
    self.mManager = [AFHTTPSessionManager manager];
    //请求参数序列化类型
    self.mManager.requestSerializer = [AFJSONRequestSerializer serializer];
    //响应结果序列化类型
    self.mManager.responseSerializer = [AFJSONResponseSerializer serializer];
    [self.mManager.requestSerializer setTimeoutInterval:15];
    //[self.manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    self.mManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    //
    self.mManager.requestSerializer.cachePolicy=NSURLRequestReloadIgnoringCacheData;
    
}


//获取请求的完整url路径
/**
 获取请求路径，用于请求参数放在query中的情况
 */
-(NSString *)getRequestUrlWithMethod:(NSString *)method path:(NSString *)path paraDic:(NSDictionary *)paraDic
{
    NSString* orderStr = [self getOrderStringFromDictionary:paraDic];
    //时间戳
    NSString* timestamp = [NSString stringWithFormat:@"%ld",(long)[[NSDate date] timeIntervalSince1970]];
    //签名
    NSString* sign = [self getSignStringHttpMethod:method path:path query:orderStr timestamp:timestamp appSecert:APP_SECRET];
    
    NSString* host = [self getGoServerURL];
    NSString* requestURL = [NSString stringWithFormat:@"%@%@?sign=%@&ts=%@&app_key=%@",host,path,sign,timestamp,APP_KEY];
    
    return requestURL;
}

/**
 获取请求路径，用于请求参数放在body中的情况
 */
-(NSString *)getRequestUrlWithMethod:(NSString*)method path:(NSString *)path bodyDic:(NSDictionary *)bodyDic
{
    NSString* paraStr = [bodyDic mj_JSONString];
    
    //时间戳
    NSString* timestamp = [NSString stringWithFormat:@"%ld",(long)[[NSDate date] timeIntervalSince1970]];
    //签名
    NSString* sign = [self getSignStringHttpMethod:method path:path query:paraStr timestamp:timestamp appSecert:APP_SECRET];
    
    NSString* host = [self getGoServerURL];
    NSString* requestURL = [NSString stringWithFormat:@"%@%@?sign=%@&ts=%@&app_key=%@",host,path,sign,timestamp,APP_KEY];
    
    return requestURL;
}

//从字典中获取有序的key－value字符串
-(NSString *)getOrderStringFromDictionary:(NSDictionary *)dic
{
    NSArray* keyList = [dic allKeys];
    NSMutableString* resultStr = [NSMutableString string];
    NSArray *sortedArray = [keyList sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    
    for (int i = 0; i< sortedArray.count; ++i)
    {
        NSString* key = sortedArray[i];
        
        if (i == sortedArray.count-1)
        {
            [resultStr appendString:[NSString stringWithFormat:@"%@=%@",key,[dic objectForKey:key]]];
        }
        else
        {
            [resultStr appendString:[NSString stringWithFormat:@"%@=%@&",key,[dic objectForKey:key]]];
        }
    }
    
    return resultStr;
}

//获取签名
-(NSString *)getSignStringHttpMethod:(NSString*)method path:(NSString *)path query:(NSString *)query timestamp:(NSString *)ts appSecert:(NSString *)secert
{
    UInt64 userId = [AppEngine shareInstance].mUserId > 0 ? [AppEngine shareInstance].mUserId : 1;
    NSString* sid = [AppEngine shareInstance].mSid == nil? @"":[AppEngine shareInstance].mSid;
    
    NSString* src = nil;
    
    if (![Utils isEmpty:query])
    {
        src = [NSString stringWithFormat:@"%@%@%llu%@%@%@%@",method,path,userId,sid,query,ts,secert];
    }
    else
    {
        src = [NSString stringWithFormat:@"%@%@%llu%@%@%@",method,path,userId,sid,ts,secert];
    }
    
    ITOLOG(@"\nsrc = %@",src);
    NSString* sign = [Utils md5HexDigest:src];
    
    return sign;
}

//获取根域名
-(NSString*)getGoServerURL
{
    if([LSNetWorkManager isDevStatus])
    {
        return SHAREBOOK_SERVER_TEST;
    }
    else
    {
        return SHAREBOOK_SERVER_OFFICAL;
    }
}

//设置基础参数
-(void)setAFNRequestHeader:(AFHTTPSessionManager *)manager
{
    UInt64 userId = [AppEngine shareInstance].mUserId > 0 ? [AppEngine shareInstance].mUserId : 1;
    NSString* sid = [AppEngine shareInstance].mSid == nil? @"":[AppEngine shareInstance].mSid;
    
    [manager.requestSerializer setValue:[[NSNumber numberWithInteger:userId] stringValue] forHTTPHeaderField:@"uid"];

    //FIXME: udid的问题
//    [manager.requestSerializer setValue:[OpenUDID value] forHTTPHeaderField:@"imei"];
    [manager.requestSerializer setValue:[[NSNumber numberWithInt:[Utils bundleVersion]] stringValue] forHTTPHeaderField:@"version"];
    [manager.requestSerializer setValue:[[NSNumber numberWithInt:2] stringValue] forHTTPHeaderField:@"platform"];
    [manager.requestSerializer setValue:@"AppStore" forHTTPHeaderField:@"channel"];
    [manager.requestSerializer setValue:sid forHTTPHeaderField:@"sid"];
}



-(void)getDataWithPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary *))success failure:(void (^)(NetWorkErrorModel *))failure{
    
    NSString* requestURL = [self getRequestUrlWithMethod:HTTP_GET path:path paraDic:parameters];
    
    [self setAFNRequestHeader:self.mManager];
    
    [self.mManager GET:requestURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //成功
        NSDictionary* respDic = responseObject;
        success(respDic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NetWorkErrorModel* netError = [[NetWorkErrorModel alloc] init];
        netError.errorCode = NetWorkErrorCode_NetError;
        netError.errorDescribe = @"网络错误";
        failure(netError);
    }];
}


-(void)postDataWithPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary *))success failure:(void (^)(NetWorkErrorModel *))failure{
    
    NSString* requestURL = [self getRequestUrlWithMethod:HTTP_POST path:path bodyDic:parameters];
    
    [self setAFNRequestHeader:self.mManager];
    
    [self.mManager POST:requestURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary* respDic = responseObject;
        success(respDic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NetWorkErrorModel* netError = [[NetWorkErrorModel alloc] init];
        netError.errorCode = NetWorkErrorCode_NetError;
        netError.errorDescribe = @"网络错误";
        failure(netError);
    }];
    
}

-(void)putDataWithPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary *))success failure:(void (^)(NetWorkErrorModel *))failure{
    
    NSString* requestURL = [self getRequestUrlWithMethod:HTTP_PUT path:path bodyDic:parameters];
    
    [self setAFNRequestHeader:self.mManager];
    
    [self.mManager PUT:requestURL parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSDictionary* respDic = responseObject;
        success(respDic);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NetWorkErrorModel* netError = [[NetWorkErrorModel alloc] init];
        netError.errorCode = NetWorkErrorCode_NetError;
        netError.errorDescribe = @"网络错误";
        failure(netError);
        
    }];
}

-(void)deleteDataWithPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary *))success failure:(void (^)(NetWorkErrorModel *))failure{

    NSString* requestURL = [self getRequestUrlWithMethod:HTTP_DELETE path:path paraDic:parameters];
    
    [self setAFNRequestHeader:self.mManager];
    
    [self.mManager DELETE:requestURL parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSDictionary* respDic = responseObject;
        success(respDic);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NetWorkErrorModel* netError = [[NetWorkErrorModel alloc] init];
        netError.errorCode = NetWorkErrorCode_NetError;
        netError.errorDescribe = @"网络错误";
        failure(netError);
    }];
}

@end
