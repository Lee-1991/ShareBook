//
//  SBMineNormalCell.h
//  ShareBook
//
//  Created by Lee on 2017/8/19.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBMineNormalCell : UITableViewCell

-(void)setDataWitmName:(NSString *)name tipsText:(NSString *)tips;

+(CGFloat)heightOfCell;

@end
