//
//  UIView+Frame.h
//  
//
//  Created by pan 王志斌 on 15/7/16.
//  Copyright (c) 2015年 王志斌. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>

@interface UIView (Frame)
//拿到离自己最近的控制器
- (UIViewController *)superSuperViewController;
- (void)viewLayer:(CGFloat)radius borderWidth:(CGFloat)borderWidth color:(UIColor*)color;


@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;



+ (UIViewAnimationOptions)animationOptionsForCurve:(UIViewAnimationCurve)curve;


@end
