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
@property (strong,nonatomic) UILabel *mArrowRightLbl;

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
    return [SBUserInfoView heightOfInfoView] + 20*Fit_RATE;
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
        make.top.equalTo(self.mas_top).offset(20*Fit_RATE);
        make.height.mas_equalTo([SBUserInfoView heightOfInfoView]);
    }];
    _mUserInfoView.mFollowBtn.hidden = YES;
    [_mUserInfoView.mSeperateLine mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10*Fit_RATE);
        make.right.equalTo(self.mas_right).offset(-10*Fit_RATE);
    }];
    
    CGFloat widthHead = 65*Fit_RATE;
    _mUserInfoView.mHeadIcon.layer.cornerRadius = widthHead*0.5;
    [_mUserInfoView.mHeadIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-58*Fit_RATE);
        make.centerY.equalTo(_mUserInfoView.mCountLbl.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(widthHead, widthHead));
    }];
    
    _mShareBtn = [[UIButton alloc] init];
    [self addSubview:_mShareBtn];
    _mShareBtn.titleLabel.font = FONT(16);
    [_mShareBtn setTitleColor:[Utils getUIColorFromHex:0xff43c6ff] forState:UIControlStateNormal];
    [_mShareBtn setTitle:@"分享>" forState:UIControlStateNormal];
    [_mShareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_mUserInfoView.mNickLbl.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-10*Fit_RATE);
    }];
    
    _mArrowRightLbl = [[UILabel alloc] init];
    [self addSubview:_mArrowRightLbl];
    _mArrowRightLbl.font = FONT(30);
    _mArrowRightLbl.textColor = [Utils getUIColorFromHex:0xff43c6ff];
    _mArrowRightLbl.text = @">";
    [_mArrowRightLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_mShareBtn.mas_right);
        make.centerY.equalTo(_mUserInfoView.mHeadIcon.mas_centerY);
    }];
}

@end
