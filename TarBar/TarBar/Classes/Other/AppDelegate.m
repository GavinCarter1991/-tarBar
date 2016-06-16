//
//  AppDelegate.m
//  TarBar
//
//  Created by Gavin on 16/6/16.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import "AppDelegate.h"
#import "DrawerViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:BOUNDS];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[DrawerViewController alloc]init];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
