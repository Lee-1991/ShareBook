//
//  SBBorrowBookCellTopView.m
//  ShareBook
//
//  Created by Lee on 2017/8/14.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBBorrowBookCellTopView.h"

@interface SBBorrowBookCellTopView()
@property (weak, nonatomic) IBOutlet UIButton *mHeadIcon;
@property (weak, nonatomic) IBOutlet UILabel *mNickName;
@property (weak, nonatomic) IBOutlet UILabel *mLevelLbl;
@property (weak, nonatomic) IBOutlet UILabel *mSignLbl;

@property (weak, nonatomic) IBOutlet UILabel *mDistanceLbl;
@property (weak, nonatomic) IBOutlet UILabel *mCountLbl;



@end


@implementation SBBorrowBookCellTopView

+(instancetype)borrowBookCellTopView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"SBBorrowBookCellTopView" owner:nil options:nil]lastObject];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
}

- (IBAction)onClickHeadIcon:(id)sender {
}

@end
