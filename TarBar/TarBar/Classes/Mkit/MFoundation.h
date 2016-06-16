//
//  MFoundation.h
//  TarBar
//
//  Created by Gavin on 16/6/16.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MFoundation : NSObject

//tabBar
CGRect TabBarFrame();


//左边抽屉隐藏（开始）的位置
CGRect LeftViewStartFrame();
//左边抽屉显示（结束）的位置
CGRect LeftViewEndFrame();

//右边内容开始（抽屉隐藏时）的位置
CGRect RigntContentStartFrame();
//右边内容结束（抽屉显示时）的位置
CGRect RightContentEndFrame();


//简化 CGRectMake
CGRect CGRM(CGFloat x, CGFloat y,CGFloat w,CGFloat h);





@end















