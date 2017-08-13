//
//  LSTabBarController.m
//  ShareBook
//
//  Created by Lee on 2017/8/12.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "LSTabBarController.h"
#import "LSHomeViewController.h"
#import "LSBookViewController.h"
#import "LSMessageViewController.h"
#import "LSMineViewController.h"

@interface LSTabBarController ()

@end

@implementation LSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildViewControllers
{
    [self addChildVC:[[LSHomeViewController alloc] init] title:@"首页" imgName:@"home_home"];
    [self addChildVC:[[LSBookViewController alloc] init] title:@"借书" imgName:@"home_follow"];
    [self addChildVC:[[LSMessageViewController alloc] init] title:@"消息" imgName:@"home_find"];
    [self addChildVC:[[LSMineViewController alloc] init] title:@"我的" imgName:@"home_mine"];
}


- (void)addChildVC:(UIViewController *)vc title:(NSString *)title imgName:(NSString *)imgName{
    
    
    NSString* imgNameN = [NSString stringWithFormat:@"%@_normal",imgName];
    NSString* imgNameS = [NSString stringWithFormat:@"%@_select",imgName];
//    vc.tabBarItem.title = title;
//    vc.tabBarItem.image = [UIImage imageNamed:imgNameN];
//    vc.tabBarItem.selectedImage = [UIImage imageNamed:imgNameS];

    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imgNameN];
    UINavigationController* navigation = [[UINavigationController alloc] initWithRootViewController:vc];
    
    
    [self addChildViewController:navigation];
}

@end
