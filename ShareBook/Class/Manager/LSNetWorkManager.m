//
//  LSNetWorkManager.m
//  ShareBook
//
//  Created by Lee on 2017/8/13.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "LSNetWorkManager.h"

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

@end
