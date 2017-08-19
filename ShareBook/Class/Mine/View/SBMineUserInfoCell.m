//
//  SBMineUserInfoCell.m
//  ShareBook
//
//  Created by Lee on 2017/8/19.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBMineUserInfoCell.h"
#import "SBUserInfoView.h"

@interface SBMineUserInfoCell()

@property (strong,nonatomic) SBUserInfoView *mUserInfoView;

@end

@implementation SBMineUserInfoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupContentView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(CGFloat)heightOfCell{
    return [SBUserInfoView heightOfInfoView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupContentView{
    _mUserInfoView = [[SBUserInfoView alloc] init];
    [self addSubview:_mUserInfoView];
    [_mUserInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top);
        make.height.mas_equalTo([SBUserInfoView heightOfInfoView]);
    }];
}

@end
