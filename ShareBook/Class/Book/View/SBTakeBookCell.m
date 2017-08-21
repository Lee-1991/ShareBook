//
//  SBTakeBookCell.m
//  ShareBook
//
//  Created by Lee on 2017/8/21.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBTakeBookCell.h"

@interface SBTakeBookCell()

@property (strong,nonatomic) UIImageView *mBookCover;
@property (strong,nonatomic) UILabel *mBookTitleLbl;
@property (strong,nonatomic) UILabel *mReadStateLbl;
@property (strong,nonatomic) UILabel *mBookAuthorLbl;
@property (strong,nonatomic) UILabel *mDaysLbl;
@property (strong,nonatomic) UILabel *mPriceLbl;
@property (strong,nonatomic) UILabel *mDiscountPriLbl;
@property (strong,nonatomic) UIButton *mHeadIcon;
@property (strong,nonatomic) UILabel *mNickLbl;
@property (strong,nonatomic) UILabel *mDistanceLbl;

@end

@implementation SBTakeBookCell

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

+(CGFloat)heightOfCell{
    return 200*Fit_RATE;
}

-(void)setupContentView{
    
    _mBookCover = [[UIImageView alloc] init];
    [self addSubview:_mBookCover];
    _mBookCover.backgroundColor = ColorPlaceHolder;
    [_mBookCover mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(NormalMargin);
        make.top.equalTo(self.mas_top).offset(NormalMargin);
        make.size.mas_equalTo(CGSizeMake(80*Fit_RATE, 109*Fit_RATE));
    }];
    
    _mBookTitleLbl = [[UILabel alloc] init];
    [self addSubview:_mBookTitleLbl];
    _mBookTitleLbl.font = FONT(16);
    _mBookTitleLbl.textColor = ColorTextBlack;
    _mBookTitleLbl.text = @"吕氏春秋";
    [_mBookTitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_mBookCover.mas_top);
        make.left.equalTo(_mBookCover.mas_right).offset(NormalMargin);
    }];
    
    _mReadStateLbl = [[UILabel alloc] init];
    [self addSubview:_mReadStateLbl];
    _mReadStateLbl.font = FONT(12);
    _mReadStateLbl.textColor = ColorBlue;
    _mReadStateLbl.text = @"借书已预定";
    _mReadStateLbl.textAlignment = NSTextAlignmentRight;
    [_mReadStateLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_mBookTitleLbl.mas_top);
        make.right.equalTo(self.mas_right).offset(-NormalMargin);
    }];
    
    _mBookAuthorLbl = [[UILabel alloc] init];
    [self addSubview:_mBookAuthorLbl];
    _mBookAuthorLbl.font = FONT(14);
    _mBookAuthorLbl.textColor = ColorTextBlack;
    _mBookAuthorLbl.text = @"作者：李四";
    [_mBookAuthorLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mBookTitleLbl.mas_left);
        make.top.equalTo(_mBookTitleLbl.mas_bottom).offset(7*Fit_RATE);
    }];
    
    _mDaysLbl = [[UILabel alloc] init];
    [self addSubview:_mDaysLbl];
    _mDaysLbl.font = FONT(12);
    _mDaysLbl.textColor = ColorTextLightGray;
    _mDaysLbl.text = @"已借12天";
    _mDaysLbl.textAlignment = NSTextAlignmentRight;
    [_mDaysLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_mReadStateLbl.mas_right);
        make.bottom.equalTo(_mBookAuthorLbl.mas_bottom);
    }];
    
    UILabel* everyDayLbl = [[UILabel alloc] init];
    [self addSubview:everyDayLbl];
    everyDayLbl.font = FONT(12);
    everyDayLbl.textColor = ColorTextLightGray;
    everyDayLbl.text = @"后每日：";
    [everyDayLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mBookTitleLbl.mas_left);
        make.bottom.equalTo(_mBookCover.mas_bottom);
    }];
    
    _mDiscountPriLbl = [[UILabel alloc] init];
    [self addSubview:_mDiscountPriLbl];
    _mDiscountPriLbl.font = FONT(12);
    _mDiscountPriLbl.textColor = [Utils getUIColorFromHex:0xffff5753];
    _mDiscountPriLbl.text = @"¥0.8";
    [_mDiscountPriLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(everyDayLbl.mas_right);
        make.centerY.equalTo(everyDayLbl.mas_centerY);
    }];
    
    UILabel* firstDayLbl = [[UILabel alloc] init];
    [self addSubview:firstDayLbl];
    firstDayLbl.font = FONT(12);
    firstDayLbl.textColor = ColorTextLightGray;
    firstDayLbl.text = @"借首日：";
    [firstDayLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(everyDayLbl.mas_top).offset(-6*Fit_RATE);
        make.left.equalTo(self.mBookTitleLbl.mas_left);
    }];
    
    _mPriceLbl = [[UILabel alloc] init];
    [self addSubview:_mPriceLbl];
    _mPriceLbl.font = FONT(12);
    _mPriceLbl.textColor = [Utils getUIColorFromHex:0xffff5753];
    _mPriceLbl.text = @"¥7.0";
    [_mPriceLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(firstDayLbl.mas_right);
        make.centerY.equalTo(firstDayLbl.mas_centerY);
    }];
    
    CGFloat widthHead = 40*Fit_RATE;
    self.mHeadIcon = [[UIButton alloc] init];
    [self addSubview:_mHeadIcon];
    [self.mHeadIcon setBackgroundColor:ColorPlaceHolder];
    _mHeadIcon.layer.cornerRadius = widthHead*0.5;
    _mHeadIcon.layer.masksToBounds = YES;
    _mHeadIcon.contentMode = UIViewContentModeScaleAspectFit;
    [_mHeadIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mBookCover.mas_left);
        make.top.equalTo(_mBookCover.mas_bottom).offset(15*Fit_RATE);
        make.size.mas_equalTo(CGSizeMake(widthHead, widthHead));
    }];
    
    _mNickLbl = [[UILabel alloc] init];
    [self addSubview:_mNickLbl];
    _mNickLbl.font = FONT(14);
    _mNickLbl.textColor = ColorTextBlack;
    _mNickLbl.text = @"李四";
    [_mNickLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mHeadIcon.mas_right).offset(5*Fit_RATE);
        make.top.equalTo(_mHeadIcon.mas_top);
    }];
    

    _mDistanceLbl = [UILabel new];
    [self addSubview:_mDistanceLbl];
    _mDistanceLbl.font = FONT(12);
    _mDistanceLbl.textColor = ColorTextLightGray;
    _mDistanceLbl.text = @"2.0km";
    [_mDistanceLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mNickLbl.mas_left);
        make.top.equalTo(_mNickLbl.mas_bottom);
    }];
    
    UIView *separatView = [[UIView alloc] initSeparateLineDefault];
    [self addSubview:separatView];
    [separatView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        make.height.mas_equalTo(5*Fit_RATE);
    }];
    
}

@end
