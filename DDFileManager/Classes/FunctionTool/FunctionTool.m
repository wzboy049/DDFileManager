//
//  FunctionTool.m
//  xiaomuxueche
//
//  Created by 王志滨 on 16/5/6.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "FunctionTool.h"


#pragma - mark ____________颜色___________
/** 将rgb转成颜色 */
UIColor * RGBColor_dd(CGFloat r, CGFloat g, CGFloat b){
    return [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1];
}
/** 将rgb和透明度转成颜色 */
UIColor * RGBAlphaColor_dd(CGFloat r, CGFloat g, CGFloat b, CGFloat a){
    return [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)];
}



