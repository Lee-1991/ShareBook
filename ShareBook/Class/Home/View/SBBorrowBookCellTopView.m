//
//  SBBorrowBookCellTopView.m
//  ShareBook
//
//  Created by Lee on 2017/8/14.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBBorrowBookCellTopView.h"

static CGFloat MarginToSide = 11*Fit_RATE;

@interface SBBorrowBookCellTopView()

@property (strong,nonatomic) UIButton *mHeadIcon;
@property (strong,nonatomic) UILabel *mNickLbl;
@property (strong,nonatomic) UILabel *mLevelLbl;
@property (strong,nonatomic) UIImageView *mLevelImgView;
@property (strong,nonatomic) UILabel *mSignLbl;
@property (strong,nonatomic) UILabel *mDistanceLbl;
@property (strong,nonatomic) UILabel *mCountLbl;

@end


@implementation SBBorrowBookCellTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupContentView];
    }
    return self;
}

+(CGFloat)heightOfCellTopView{
    return MarginToSide+40*Fit_RATE;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
}

- (void)setupContentView{
    
    CGFloat widthHead = 40*Fit_RATE;
    self.mHeadIcon = [[UIButton alloc] init];
    [self addSubview:_mHeadIcon];
    [self.mHeadIcon setBackgroundColor:ColorPlaceHolder];
    _mHeadIcon.layer.cornerRadius = widthHead*0.5;
    _mHeadIcon.layer.masksToBounds = YES;
    _mHeadIcon.contentMode = UIViewContentModeScaleAspectFit;
    [_mHeadIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(MarginToSide);
        make.top.equalTo(self.mas_top).offset(MarginToSide);
        make.size.mas_equalTo(CGSizeMake(widthHead, widthHead));
    }];
    
    _mNickLbl = [[UILabel alloc] init];
    [self addSubview:_mNickLbl];
    _mNickLbl.font = FONT(16);
    _mNickLbl.textColor = [Utils getUIColorFromHex:0xff333333];
    _mNickLbl.text = @"李四";
    [_mNickLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mHeadIcon.mas_right).offset(5*Fit_RATE);
        make.top.equalTo(_mHeadIcon.mas_top);
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
    
    _mDistanceLbl = [UILabel new];
    [self addSubview:_mDistanceLbl];
    _mDistanceLbl.font = FONT(11);
    _mDistanceLbl.textColor = [Utils getUIColorFromHex:0xffa5a5a5];
    _mDistanceLbl.text = @"2.0km";
    [_mDistanceLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-11*Fit_RATE);
        make.bottom.equalTo(_mNickLbl.mas_bottom);
    }];
    
    _mSignLbl = [[UILabel alloc] init];
    [self addSubview:_mSignLbl];
    _mSignLbl.font = FONT(11);
    _mSignLbl.textColor = [Utils getUIColorFromHex:0xffa5a5a5];
    _mSignLbl.text = @"喜欢科学和历史";
    [_mSignLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mNickLbl.mas_left);
        make.bottom.equalTo(_mHeadIcon.mas_bottom);
    }];
    
    
    _mCountLbl = [UILabel new];
    [self addSubview:_mCountLbl];
    _mCountLbl.font = FONT(11);
    _mCountLbl.textColor = [Utils getUIColorFromHex:0xff43c6ff];
    _mCountLbl.text = @"25本>";
    [_mCountLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_mDistanceLbl.mas_right);
        make.bottom.equalTo(_mSignLbl.mas_bottom);
    }];
    
}



@end
