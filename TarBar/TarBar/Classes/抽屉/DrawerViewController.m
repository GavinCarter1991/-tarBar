//
//  DrawerViewController.m
//  TarBar
//
//  Created by Gavin on 16/6/16.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import "DrawerViewController.h"
#import "LeftViewController.h"
#import "MTabBarViewController.h"

@interface DrawerViewController ()
{
    UITapGestureRecognizer *tapGesture;
}

//创建左边的抽屉
@property (nonatomic, strong) LeftViewController *leftViewController;

//创建右边的标签控制器
@property (nonatomic, strong) MTabBarViewController *mainViewController;
//抽屉是否显示的标示

@property (nonatomic, assign) BOOL isOpen;
@end

@implementation DrawerViewController

- (void)dealloc
{
    //移除通知
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"buttonTap" object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTabBarController];
    [self createLeftVc];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    //添加通知，监听TabBar的点击事件 隐藏左边抽屉
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(buttonTap) name:@"buttonTap" object:nil];
    
}

- (void)buttonTap
{
    //抽屉展开时则隐藏
    if (self.isOpen == YES) {
        [self openOrHidden];
    }
    
}

//创建左边抽屉

- (void)createLeftVc
{
    self.leftViewController = [[LeftViewController alloc]init];
    
    //抽屉控制器添加到父控制器中
    [self addChildViewController:self.leftViewController];
    self.leftViewController.view.frame = LeftViewStartFrame();
    [self.view addSubview:self.leftViewController.view];
    [self.leftViewController didMoveToParentViewController:self];
    
}

//创建右边的标签控制器

- (void)createTabBarController
{
    //
    NSArray *classNames = @[@"ProductViewController",@"MessageViewController",@"OrderViewController"];
    
    //保存viewControllers
    NSMutableArray *viewControllers = [NSMutableArray array];
    [classNames enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //先把字符串转化为类名
        Class class = NSClassFromString(obj);
        
        //创建ViewController
        UIViewController *vc = [[class alloc]init];
        UINavigationController *aNav = [[UINavigationController alloc]initWithRootViewController:vc];
        
        [viewControllers addObject:aNav];
        
    }];
    
    
    //TabBarController 创建
    _mainViewController = [[MTabBarViewController alloc]initWithViewControllers:viewControllers];
    _mainViewController.view.backgroundColor = [UIColor brownColor];
    
    //添加标签控制器到父控制器
    [self addChildViewController:self.mainViewController];
    self.mainViewController.view.frame = BOUNDS;
    [self.view addSubview:self.mainViewController.view];
    [self.mainViewController didMoveToParentViewController:self];
}

//标签控制器显示的vc的根控制器的view往右边移动
//tabBar -> Nav (ViewControllers[selectedIndex]) -> Nav.rootViewController.view
- (void)tabBar_Nav_RootViewController_viewMoveRight
{
    //标签控制器当中 当前显示的控制器
    UINavigationController *nav = self.mainViewController.viewControllers[self.mainViewController.selectedIndex];
    NSLog(@"%@",nav.view.subviews);
    //取出导航控制器的根控制器
    UIViewController *rootVc = nav.childViewControllers[0];
    rootVc.view.frame = RightContentEndFrame();
}
- (void)tabBar_Nav_RootViewController_viewMoveLeft
{
    //标签控制器当中 当前显示的控制器
    UINavigationController *nav = self.mainViewController.viewControllers[self.mainViewController.selectedIndex];
    NSLog(@"%@",nav.view.subviews);
    //取出导航控制器的根控制器
    UIViewController *rootVc = nav.childViewControllers[0];
    rootVc.view.frame = RigntContentStartFrame();
}


//显示左边抽屉
- (void)open
{
    [UIView animateWithDuration:0.48 animations:^{
        self.leftViewController.view.frame = LeftViewEndFrame();
        [self tabBar_Nav_RootViewController_viewMoveRight];
    } completion:nil];
    
    //添加点击手势，点击某些区域的隐藏抽屉
    tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tapGesture];
}
- (void)tap:(UITapGestureRecognizer *)gesturer
{
    //获取点击的位置
    CGPoint point = [gesturer locationInView:self.view];
    if (CGRectContainsPoint(self.leftViewController.view.frame, point) == YES) {
        return;
    }
    
    [self hidden];
    self.isOpen = NO;
    //移除手势
    [self.view removeGestureRecognizer:tapGesture];
}
//隐藏左边抽屉
- (void)hidden
{
    [UIView animateWithDuration:0.48 animations:^{
        self.leftViewController.view.frame = LeftViewStartFrame();
        [self tabBar_Nav_RootViewController_viewMoveLeft];
    } completion:nil];
    
}

- (void)openOrHidden
{
    //当前如果是隐藏，则显示
    if (self.isOpen == NO) {
        [self open];
    }
    
    //当前如果是显示的，则隐藏
    if (self.isOpen == YES) {
        [self hidden];
    }
    
    //改变隐藏标记
    self.isOpen = !self.isOpen;
}


















@end







