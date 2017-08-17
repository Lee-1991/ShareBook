//
//  SBBorrowBookCellTopView.h
//  ShareBook
//
//  Created by Lee on 2017/8/14.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBBorrowBookCellTopView : UIView

@property (strong,nonatomic) UILabel *mCountLbl;
@property (strong,nonatomic) UILabel *mDistanceLbl;

+ (CGFloat)heightOfCellTopView;


@end
