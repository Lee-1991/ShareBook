//
//  AppDelegate.m
//  ShareBook
//
//  Created by 李四 on 2017/8/12.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "AppDelegate.h"
#import "LSTabBarController.h"

#import "LSHomeViewController.h"
#import "LSBookViewController.h"
#import "LSMessageViewController.h"
#import "LSMineViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    LSTabBarController* tabVC = [[LSTabBarController alloc] init];

    
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)addChildVC:(UIViewController *)vc title:(NSString *)title imgName:(NSString *)imgName tabvc:(UITabBarController *)tab{
    
    
    NSString* imgNameN = [NSString stringWithFormat:@"%@_normal",imgName];
    NSString* imgNameS = [NSString stringWithFormat:@"%@_select",imgName];
    //    vc.tabBarItem.title = title;
    //    vc.tabBarItem.image = [UIImage imageNamed:imgNameN];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:imgNameS];
    
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imgNameN];
    UINavigationController* navigation = [[UINavigationController alloc] initWithRootViewController:vc];
    
    
    [tab addChildViewController:navigation];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
