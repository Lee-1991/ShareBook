//
//  LSNetWorkHelper.m
//  ShareBook
//
//  Created by Lee on 2017/8/13.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "LSNetWorkHelper.h"

@implementation LSNetWorkHelper

+(instancetype)shareInstance{

    static LSNetWorkHelper* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

@end
