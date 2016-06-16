//
//  BaseViewController.m
//  TarBar
//
//  Created by Gavin on 16/6/16.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
#import "DrawerViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"抽屉" style:UIBarButtonItemStylePlain target:self action:@selector(openOrHidden)];
    
}

//显示或者隐藏左边抽屉
- (void)openOrHidden
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //获取根控制器
    
    DrawerViewController *rootVc = (DrawerViewController *)delegate.window.rootViewController;
    
    //打开或者隐藏左边抽屉
    [rootVc openOrHidden];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








@end
