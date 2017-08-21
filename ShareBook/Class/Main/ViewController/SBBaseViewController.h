//
//  SBBaseViewController.h
//  ShareBook
//
//  Created by Lee on 2017/8/17.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBVCHeaderView.h"

@interface SBBaseViewController : UIViewController

@property (strong,nonatomic) SBVCHeaderView *mHeaderView;

/**
 通过pop的方式返回上一级controller
 */
-(void)backToLastControllerByPop;


/**
 通过pop的方式返回到主页
 */
-(void)backToHomeViewCotrollerByPop;

-(void)onClickTitleViewFinishBtn:(UIButton *)sender;


@end
