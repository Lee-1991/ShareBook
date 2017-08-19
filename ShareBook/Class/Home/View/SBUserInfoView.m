//
//  SBUserInfoView.m
//  ShareBook
//
//  Created by Lee on 2017/8/17.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBUserInfoView.h"

@interface SBUserInfoView()

@property (strong,nonatomic) UILabel *mLevelLbl;
@property (strong,nonatomic) UIImageView *mLevelImgView;
@property (strong,nonatomic) UILabel *mSignLbl;
@property (strong,nonatomic) UILabel *mCountTipsLbl;
@property (strong,nonatomic) UILabel *mFriendCountLbl;
@property (strong,nonatomic) UILabel *mFriendTipsLbl;
@property (strong,nonatomic) UILabel *mTimeLbl;


@end

@implementation SBUserInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupContentView];
    }
    return self;
}

+(CGFloat)heightOfInfoView{
    return 123*Fit_RATE;
}

-(void)onClickFollowBtn:(UIButton *)sender{
    [sender setTitle:@"已关注" forState:UIControlStateNormal];
}

//MARK: UI
-(void)setupContentView{
    
    CGFloat widthHead = 79*Fit_RATE;
    CGFloat marginToSide = 12*Fit_RATE;

    _mNickLbl = [[UILabel alloc] init];
    [self addSubview:_mNickLbl];
    _mNickLbl.font = FONT(16);
    _mNickLbl.textColor = [Utils getUIColorFromHex:0xff333333];
    _mNickLbl.text = @"李四";
    [_mNickLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(marginToSide);
        make.top.equalTo(self.mas_top).offset(marginToSide);
    }];
    
    _mLevelLbl = [[UILabel alloc] init];
    [self addSubview:_mLevelLbl];
    _mLevelLbl.font = FONT(11);
    _mLevelLbl.textColor = [Utils getUIColorFromHex:0xff43c6ff];
    _mLevelLbl.text = @"4.8";
    [_mLevelLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mNickLbl.mas_right).offset(4*Fit_RATE);
        make.bottom.equalTo(_mNickLbl.mas_bottom);
    }];
    
    UIImage* levelImg = [UIImage imageNamed:@"level_info_icon"];
    _mLevelImgView = [[UIImageView alloc] init];
    [self addSubview:_mLevelImgView];
    [_mLevelImgView setImage:levelImg];
    [_mLevelImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mLevelLbl.mas_right).offset(2*Fit_RATE);
        make.bottom.equalTo(_mLevelLbl.mas_bottom).offset(-2*Fit_RATE);
        make.size.mas_equalTo(levelImg.size);
    }];
    
    
    _mSignLbl = [[UILabel alloc] init];
    [self addSubview:_mSignLbl];
    _mSignLbl.font = FONT(11);
    _mSignLbl.textColor = [Utils getUIColorFromHex:0xffa5a5a5];
    _mSignLbl.text = @"喜欢科学和历史";
    [_mSignLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mNickLbl.mas_left);
        make.top.equalTo(_mNickLbl.mas_bottom).offset(4*Fit_RATE);
    }];
    
    self.mHeadIcon = [[UIButton alloc] init];
    [self addSubview:_mHeadIcon];
    [self.mHeadIcon setBackgroundColor:ColorPlaceHolder];
    _mHeadIcon.layer.cornerRadius = widthHead*0.5;
    _mHeadIcon.layer.masksToBounds = YES;
    _mHeadIcon.contentMode = UIViewContentModeScaleAspectFit;
    [_mHeadIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-58*Fit_RATE);
        make.top.equalTo(self.mas_top).offset(marginToSide);
        make.size.mas_equalTo(CGSizeMake(widthHead, widthHead));
    }];
    
    _mCountLbl = [[UILabel alloc] init];
    [self addSubview:_mCountLbl];
    _mCountLbl.font = FONT(12);
    _mCountLbl.textColor = [Utils getUIColorFromHex:0xffff8400];
    _mCountLbl.text = @"2";
    [_mCountLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mNickLbl.mas_left);
        make.top.equalTo(_mSignLbl.mas_bottom).offset(9*Fit_RATE);
    }];
    
    _mCountTipsLbl = [[UILabel alloc] init];
    [self addSubview:_mCountTipsLbl];
    _mCountTipsLbl.font = FONT(11);
    _mCountTipsLbl.textColor = [Utils getUIColorFromHex:0xffa5a5a5];
    _mCountTipsLbl.text = @"书籍";
    [_mCountTipsLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mCountLbl.mas_left);
        make.top.equalTo(_mCountLbl.mas_bottom);
    }];
    
    _mFriendCountLbl = [[UILabel alloc] init];
    [self addSubview:_mFriendCountLbl];
    _mFriendCountLbl.font = FONT(12);
    _mFriendCountLbl.textColor = [Utils getUIColorFromHex:0xffff8400];
    _mFriendCountLbl.text = @"1";
    [_mFriendCountLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mCountLbl.mas_right).offset(56*Fit_RATE);
        make.top.equalTo(_mCountLbl.mas_top);
    }];
    
    _mFriendTipsLbl = [[UILabel alloc] init];
    [self addSubview:_mFriendTipsLbl];
    _mFriendTipsLbl.font = FONT(11);
    _mFriendTipsLbl.textColor = [Utils getUIColorFromHex:0xffa5a5a5];
    _mFriendTipsLbl.text = @"粉丝";
    [_mFriendTipsLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mFriendCountLbl.mas_left);
        make.bottom.equalTo(_mCountTipsLbl.mas_bottom);
    }];
    
    _mTimeLbl = [[UILabel alloc] init];
    [self addSubview:_mTimeLbl];
    _mTimeLbl.font = FONT(10);
    _mTimeLbl.textColor = [Utils getUIColorFromHex:0xffa5a5a5];
    _mTimeLbl.text = @"书店时间：工作日";
    [_mTimeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mNickLbl.mas_left);
        make.top.equalTo(_mCountTipsLbl.mas_bottom).offset(11*Fit_RATE);
    }];
    
    _mFollowBtn = [[UIButton alloc] init];
    [self addSubview:_mFollowBtn];
    [_mFollowBtn setTitleColor:[Utils getUIColorFromHex:0xff43c6ff] forState:UIControlStateNormal];
    [_mFollowBtn.titleLabel setFont:FONT(11)];
    [_mFollowBtn setTitle:@"关注" forState:UIControlStateNormal];
    [_mFollowBtn addTarget:self action:@selector(onClickFollowBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_mFollowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-marginToSide);
        make.bottom.equalTo(self.mas_bottom).offset(-10*Fit_RATE);
    }];
    
    _mSeperateLine = [[UIView alloc] init];
    [self addSubview:_mSeperateLine];
    _mSeperateLine.backgroundColor = ColorSeparateLine;
    [_mSeperateLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        make.height.mas_equalTo(1*Fit_RATE);
    }];
    
    
}


@end
