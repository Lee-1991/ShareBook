//
//  SBHomeMessageCell.m
//  ShareBook
//
//  Created by Lee on 2017/8/17.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBHomeMessageCell.h"
#import "SBBorrowBookCellTopView.h"

@interface SBHomeMessageCell()

@property (strong,nonatomic) SBBorrowBookCellTopView *mDetailView;

@end

@implementation SBHomeMessageCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupContentView];
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
    return [SBBorrowBookCellTopView heightOfCellTopView] + 5*Fit_RATE;
}

-(void)setupContentView{
    _mDetailView = [[SBBorrowBookCellTopView alloc] init];
    [self addSubview:_mDetailView];
//    _mDetailView.mDistanceLbl.hidden = YES;
    _mDetailView.mCountLbl.hidden = YES;
    [_mDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top);
        make.height.mas_equalTo([SBBorrowBookCellTopView heightOfCellTopView]);
    }];
    
    UIView* separateLine = [[UIView alloc] init];
    [self addSubview:separateLine];
    separateLine.backgroundColor = ColorSeparateLine;
    [separateLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top);
        make.height.mas_equalTo(1*Fit_RATE);
    }];
}

@end
