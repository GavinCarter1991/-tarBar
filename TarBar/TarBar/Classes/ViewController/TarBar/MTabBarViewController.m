//
//  MTabBarViewController.m
//  TarBar
//
//  Created by Gavin on 16/6/16.
//  Copyright © 2016年 gavin. All rights reserved.
//

/*
 NSArray * buttonImageArray = @[@"商品.png",@"消息.png",@"订单.png"];
 NSArray * buttonTitleArray = @[@"商品浏览",@"我的消息",@"我的订单"];
 @[@"商品.png",@"消息.png",@"订单.png"]
 @[@"商品浏览",@"我的消息",@"我的订单"]
 */
#import "MTabBarViewController.h"

@interface MTabBarViewController ()

@end

@implementation MTabBarViewController

- (instancetype)initWithViewControllers:(NSArray *)viewControllers
{
    self = [super init];
    if (self) {
        
        _viewControllers = viewControllers;
        //遍历数组，添加子控制器
        [_viewControllers enumerateObjectsUsingBlock:^(UIViewController *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self addChild:obj];
        }];
        /*
         @[@"商品.png",@"消息.png",@"订单.png"]
         @[@"商品浏览",@"我的消息",@"我的订单"]
         */
        _tabBar = [[MTabBar alloc]initWithTitles:@[@"商品浏览",@"我的消息",@"我的订单"] imageNames:@[@"商品.png",@"消息.png",@"订单.png"]];
        [self.view addSubview:self.tabBar];
        __weak typeof(self) weakSelf = self;
        self.tabBar.callBack = ^(NSInteger index){
            weakSelf.selectedIndex = index;
        };
        //默认选中第0个
        self.selectedIndex = 0;
    }
    return self;
}
- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    //取出当前控制器 oldVc
    UIViewController *oldVc = self.viewControllers[self.selectedIndex];
    //取出将要显示的 控制器 newVc
    UIViewController *newVc = self.viewControllers[selectedIndex];
    //动画 向左边移动
    newVc.view.frame = CGRectMake(S_W, 0, S_W, S_H);
    //改变 newVc 的视图层次
    
    //把newVc.view 的视图放在 self.tabBar 的下面
    [self.view insertSubview:newVc.view belowSubview:self.tabBar];
    [UIView animateWithDuration:0.5 animations:^{
        oldVc.view.frame = CGRectMake(-S_W, 0, S_W, S_H);
        newVc.view.frame = BOUNDS;
    }];
    _selectedIndex = selectedIndex;
}

//添加子控制器具体步骤
- (void)addChild:(UIViewController *)viewController
{
    [self addChildViewController:viewController];
    viewController.view.frame = BOUNDS;
    //将viewContoller.view 放在最底层
    [self.view insertSubview:viewController.view atIndex:0];
    [viewController didMoveToParentViewController:self];
    
//    self.view.subviews 数组 下标越小，视图层次越在下面，下标越大，视图层次越在上面
    
    
    
}




@end








