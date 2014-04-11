//
//  GAIAppDelegate.m
//  Angel Ed
//
//  Created by Иван on 3/27/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "GAIAppDelegate.h"
#import "Posts.h"
#import "UIColor+Extras.h"

@implementation GAIAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [Posts getAllPosts];
    
    [self customizeUserInterface];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Helper methods

-(void)customizeUserInterface {
    
    // Customize the nav bar
    // [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithR:34 G:137 B:228 A:0.9]];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationBarBackground"] forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // Changing tab bar styles
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationBarBackground"]];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UITabBar *tabBar = tabBarController.tabBar;
    
    UITabBarItem *tabPosts = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabProfile = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabStats = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabSettings = [tabBar.items objectAtIndex:3];

    tabPosts.image = [[UIImage imageNamed:@"posts"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabProfile.image = [[UIImage imageNamed:@"profile"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabStats.image = [[UIImage imageNamed:@"stats"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabSettings.image = [[UIImage imageNamed:@"settings"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

@end
