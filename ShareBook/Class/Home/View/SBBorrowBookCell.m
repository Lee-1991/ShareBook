//
//  SBBorrowBookCell.m
//  ShareBook
//
//  Created by Lee on 2017/8/14.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBBorrowBookCell.h"
#import "SBBorrowBookCellTopView.h"

@interface SBBorrowBookCell()

@property (strong,nonatomic) SBBorrowBookCellTopView *mTopView;

@end

@implementation SBBorrowBookCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpContentView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(CGFloat)heightOfCell{
    return 200;
}

-(void)setUpContentView{
    
    _mTopView = [SBBorrowBookCellTopView borrowBookCellTopView];
    _mTopView.frame = CGRectMake(0, 0, ScreenW, 50);
//    _mTopView.backgroundColor = [UIColor lightGrayColor];
//    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:_mTopView];
    
}



@end
