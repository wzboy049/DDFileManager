//
//  FunctionTool.h
//  xiaomuxueche
//
//  Created by 王志滨 on 16/5/6.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

// 弱引用
#define Weak_Self __weak typeof(self) weakSelf = self

#define NAV_BAR_HEIGHT 44                       //导航栏高度
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define kSCSTableHeaderViewFrame CGRectMake(0, 0, SCREEN_WIDTH, NAV_BAR_HEIGHT)

#pragma - mark ____________颜色___________

UIColor * RGBColor_dd(CGFloat r, CGFloat g, CGFloat b);

UIColor * RGBAlphaColor_dd(CGFloat r, CGFloat g, CGFloat b, CGFloat a);
CGRect getRect(CGFloat x, CGFloat y, CGFloat width, CGFloat height);

