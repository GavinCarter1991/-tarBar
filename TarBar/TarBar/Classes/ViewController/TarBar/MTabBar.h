//
//  MTabBar.h
//  TarBar
//
//  Created by Gavin on 16/6/16.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
  封装
  特定数据从外部转入
  只负责UI视图的创建，不负责相应数据创建，而且根据外部来改变。
  提高可重用性
 */
typedef void(^CallBack)(NSInteger index);

@interface MTabBar : UIView

//选中button
@property (nonatomic, strong) UIButton *selectedButton;

//选中button的背景
@property (nonatomic, strong) UIView *buttonBack;

//定义Block属性
@property (nonatomic, copy) CallBack callBack;

- (instancetype)initWithTitles:(NSArray *)titles imageNames:(NSArray *)imageNames;

@end









