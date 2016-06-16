//
//  MFoundation.m
//  TarBar
//
//  Created by Gavin on 16/6/16.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import "MFoundation.h"
#import <UIKit/UIKit.h>

@implementation MFoundation

CGRect TabBarFrame()
{
    return CGRectMake(0, S_H-64, S_W, 64);
}

//左边抽屉隐藏（开始）的位置
CGRect LeftViewStartFrame()
{
    return CGRectMake(-S_W*0.75, 67,S_W*0.75 , S_H-64-64-6);
}
//左边抽屉显示（结束）的位置
CGRect LeftViewEndFrame()
{
    return CGRectMake(0, 67, S_W*0.75, S_H-64-64-6);
}

//右边内容开始（抽屉隐藏时）的位置
CGRect RigntContentStartFrame()
{
    return CGRectMake(0, 0, S_W, S_H);
}

//右边内容结束（抽屉显示时）的位置
CGRect RightContentEndFrame()
{
    return CGRectMake(S_W*0.75, 0, S_W, S_H);
}

CGRect CGRM(CGFloat x, CGFloat y,CGFloat w,CGFloat h)
{
    return CGRectMake(x, y, w, h);
}










@end









