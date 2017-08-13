//
//  BookInfoModel.h
//  ShareBook
//
//  Created by Lee on 2017/8/13.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageInfoModel.h"

typedef NS_ENUM(NSInteger, BookFlag) {
    
    ///无
    BookFlagNone = 0,
    BookFlagNew,
    BookFlagHotest,
    BookFlagFine,
};


/**
 书的状态
 */
typedef NS_ENUM(NSInteger, BookStatus) {
    ///闲置
    BookStatusIdle = 0,
    ///已预借
    BookStatusPreBorrow,
    ///已借出
    BookStatusBorrowed,
    ///已售
    BookStatusSold,
};

@interface BookInfoModel : NSObject

@property (nonatomic, strong) NSArray *authors;

@property (nonatomic, copy) NSString *book_id;

@property (nonatomic, strong) ImageInfoModel *cover;

@property (nonatomic, assign) Float32 discount;

/**
 书的标记，0: 无, 1：新上架，2: 最热，3: 精选
 */
@property (nonatomic, assign) BookFlag flag;

/**
 书名
 */
@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) BOOL on_sale;

@property (nonatomic, assign) UInt32 orig_fen_price;

@property (nonatomic, assign) UInt64 owner_uid;

@property (nonatomic, assign) UInt32 read_days;

@property (nonatomic, assign) UInt32 sell_fen_price;

@property (nonatomic, assign) BookStatus status;

@property (nonatomic, copy) NSString *summary;

/**
 update_time (int64, optional): 更新时间，主要用于计算阅读的天数
 */
@property (nonatomic, assign) int64_t update_time;

@end
