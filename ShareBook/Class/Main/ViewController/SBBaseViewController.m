//
//  SBBaseViewController.m
//  ShareBook
//
//  Created by Lee on 2017/8/17.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBBaseViewController.h"
#import "LSTabBarController.h"


@interface SBBaseViewController ()

@end

@implementation SBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupBaseHeaderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backToLastControllerByPop
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)backToHomeViewCotrollerByPop
{
    UIViewController *rootVC = [[(UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController viewControllers]firstObject];
    
    LSTabBarController* homeVC = nil;
    NSMutableArray* tempArray = [[NSMutableArray alloc] initWithArray:rootVC.navigationController.viewControllers];
    for (int i = 0; i < tempArray.count; i++)
    {
        
        id tempObj = [tempArray objectAtIndex:i];
        if ([tempObj isKindOfClass:[LSTabBarController class]])
        {
            homeVC = tempObj;
            break;
        }
    }
    
    [self.navigationController popToViewController:homeVC animated:YES];
}


- (void)setupBaseHeaderView{
    _mHeaderView = [[SBVCHeaderView alloc] init];
    [self.view addSubview:_mHeaderView];
    [_mHeaderView.mBackBtn addTarget:self action:@selector(backToLastControllerByPop) forControlEvents:UIControlEventTouchUpInside];
}

@end
