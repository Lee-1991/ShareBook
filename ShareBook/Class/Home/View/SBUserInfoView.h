//
//  SBUserInfoView.h
//  ShareBook
//
//  Created by Lee on 2017/8/17.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBUserInfoView : UIView

@property (strong,nonatomic) UILabel *mNickLbl;
@property (strong,nonatomic) UIButton *mHeadIcon;
@property (strong,nonatomic) UILabel *mCountLbl;
@property (strong,nonatomic) UIButton *mFollowBtn;
@property (strong,nonatomic) UIView *mSeperateLine;

+(CGFloat)heightOfInfoView;

@end
