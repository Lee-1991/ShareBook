//
//  SBMineNormalCell.m
//  ShareBook
//
//  Created by Lee on 2017/8/19.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBMineNormalCell.h"

@interface SBMineNormalCell()

@property (strong,nonatomic) UILabel *mNameLbl;
@property (strong,nonatomic) UILabel *mTipsLbl;


@end

@implementation SBMineNormalCell

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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDataWitmName:(NSString *)name tipsText:(NSString *)tips{
    _mNameLbl.text = name;
    _mTipsLbl.text = tips;
    _mTipsLbl.hidden = tips == nil;
}

+(CGFloat)heightOfCell{
    return 45*Fit_RATE;
}

-(void)setupContentView{
    
    _mNameLbl = [[UILabel alloc] init];
    [self addSubview:_mNameLbl];
    _mNameLbl.font = FONT(16);
    _mNameLbl.textColor = [Utils getUIColorFromHex:0xff333333];
    [_mNameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15*Fit_RATE);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    UIImage* arrowImg = [UIImage imageNamed:@"arrow_rigth_icon"];
    UIImageView* arrowImgView = [[UIImageView alloc] init];
    [self addSubview:arrowImgView];
    arrowImgView.image = arrowImg;
    [arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-15*Fit_RATE);
        make.centerY.equalTo(_mNameLbl.mas_centerY);
        make.size.mas_equalTo(arrowImg.size);
    }];
    
    _mTipsLbl = [[UILabel alloc] init];
    [self addSubview:_mTipsLbl];
    _mTipsLbl.font = FONT(10);
    _mTipsLbl.textColor = [Utils getUIColorFromHex:0xffa5a5a5];
    [_mTipsLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_mNameLbl.mas_centerY);
        make.right.equalTo(arrowImgView.mas_left).offset(-5*Fit_RATE);
    }];
    
    UIView* separateLine = [[UIView alloc] init];
    [self addSubview:separateLine];
    separateLine.backgroundColor = ColorSeparateLine;
    [separateLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10*Fit_RATE);
        make.right.equalTo(self.mas_right).offset(-10*Fit_RATE);
        make.bottom.equalTo(self.mas_bottom);
        make.height.mas_equalTo(1*Fit_RATE);
    }];
}

@end
