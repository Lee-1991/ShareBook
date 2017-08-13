//
//  ImageInfoModel.h
//  ShareBook
//
//  Created by Lee on 2017/8/13.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageInfoModel : NSObject

/**
 图片高
 */
@property (nonatomic, assign) UInt32 height;

/**
 图片链接
 */
@property (nonatomic, copy) NSString* image_url;


/**
 图片宽
 */
@property (nonatomic, assign) UInt32 width;


@end
