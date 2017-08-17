//
//  SBBookDetailBottomView.m
//  ShareBook
//
//  Created by Lee on 2017/8/17.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBBookDetailBottomView.h"
#import "UIButton+LSAdd.h"

@interface SBBookDetailBottomView()

@property (strong,nonatomic) UILabel *mPriceLbl;
@property (strong,nonatomic) UILabel *mDiscountPriLbl;

@end

@implementation SBBookDetailBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupContentView];
    }
    return self;
}

//MARK: 点击事件
-(void)onClcikTakeBookBtn:(UIButton *)sender{
    
}

-(void)onClickBorrowBoolBtn:(UIButton *)sender{
    
}

//MARK: UI
-(void)setupContentView{
    
}

@end
