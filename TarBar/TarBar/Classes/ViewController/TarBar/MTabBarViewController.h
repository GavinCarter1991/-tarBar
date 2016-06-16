//
//  MTabBarViewController.h
//  TarBar
//
//  Created by Gavin on 16/6/16.
//  Copyright © 2016年 gavin. All rights reserved.
//

/*
 标签控制器封装
 定义一个属性 记录所有的viewControllers
 定义NSInteger 记录当前显示控制器的下标
 
 步骤
 1.把所有的控制器添加到标签控制器里面 默认显示第一个控制器
 2.根据TabBar的回调显示 对应的控制器
 
 */
#import <UIKit/UIKit.h>
#import "MTabBar.h"

@interface MTabBarViewController : UIViewController

//
@property (nonatomic, copy)NSArray * viewControllers;
//选中控制器的下标
@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, strong)MTabBar *tabBar;

- (instancetype)initWithViewControllers:(NSArray *)viewControllers;


@end











