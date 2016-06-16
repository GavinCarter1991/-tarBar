
//
//  MTabBar.m
//  TarBar
//
//  Created by Gavin on 16/6/16.
//  Copyright © 2016年 gavin. All rights reserved.
//

/*
 TabBar 封装(用button来实现)
 定义一个属性 来记录当前选中的button
 定义一个属性 来表示选中button的背景
 定义一个Block，选中button通知标签控制器显示当前选中对应的控制器

 步骤
 1.创建buttons，而且默认第一个button为选中状态
 2.选中button时，让之前选中的button恢复为非选中状态，让当前选中的button改变成选中状态
 3.通过block 通知标签控制器显示 对应选中button的控制器
 
 */
#import "MTabBar.h"

@implementation MTabBar

- (instancetype)initWithTitles:(NSArray *)titles imageNames:(NSArray *)imageNames
{
    self = [super initWithFrame:TabBarFrame()];
    if (self) {
        
        //标题数组不为空，图片名字个数 ＝ 标题个数
        self.buttonBack = [[UIView alloc]initWithFrame:CGRM(0, 0, BUTTON_W, 64)];
        self.buttonBack.backgroundColor = BUTTON_BACK_COLOR;
        [self addSubview:self.buttonBack];
        
        
        
        self.backgroundColor = TABBAR_BACK_COLOR;
        
        if ([titles count] && [titles count] == [imageNames count]) {
            [titles enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                UIButton *button = [[UIButton alloc]initWithFrame:CGRM(BUTTON_W*idx, 0, BUTTON_W, 64)];
                button.tag = 1000 + idx;
                [self addSubview:button];
                //默认选中第一个
                if (idx == 0) {
                    button.selected = YES;
                    self.selectedButton = button;
                }
                
                [button addSubview:MakeLabel(CGRM(0, 30, BUTTON_W, 34), obj)];
//                // 图片宽 高分别为 44 24
                CGFloat x = (BUTTON_W - 44)/2;
                [button addSubview:MakeImageView(CGRM(x, 5, 44, 24),[imageNames objectAtIndex:idx])];
                //添加点击方法
                [button addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
            }];
        }
    }
    return self;
}
//button 点击方法
- (void)selectBtn:(UIButton *)sender
{
    //让抽屉隐藏，发出通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"buttonTap" object:nil];
    
    //选中的button 已经是选中状态 不用处理
    if (self.selectedButton == sender) {
        return;
    }
    
    //改变之前选中button的状态  为非选中状态
    self.selectedButton.selected = NO;
    
    //改变当前选中button的状态
    sender.selected = YES;
    self.selectedButton = sender;
    //通知标签控制器显示当前button对应的viewController
    if (self.callBack) {
        self.callBack(sender.tag - 1000);
    }
    [UIView animateWithDuration:0.5 animations:^{
        self.buttonBack.center = CGPointMake(BUTTON_W/2+(sender.tag - 1000) * BUTTON_W, 32);
    } completion:nil];
    
}

UILabel *MakeLabel(CGRect frame, NSString *title)
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
//    label.userInteractionEnabled = YES;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    return label;
}

//根据 frame和 imageName 创建UIImageView
UIImageView *MakeImageView(CGRect frame, NSString *imageName)
{
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:frame];
//    imageV.userInteractionEnabled = YES;
    imageV.backgroundColor = [UIColor clearColor];
    imageV.image = [UIImage imageNamed:imageName];
    return imageV;
}


@end









