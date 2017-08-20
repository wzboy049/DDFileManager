//
//  SCSCustomeButton.m
//  ZMSMobile
//
//  Created by 王志斌 on 16/12/7.
//  Copyright © 2016年 王志斌. All rights reserved.
//

#import "SCSCustomeButton.h"
#import "UIView+Frame.h"

@interface SCSCustomeButton ()



@end

@implementation SCSCustomeButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    
    if (self.imageView.image)
    {
        self.titleLabel.centerY = self.height * 0.5;
        self.titleLabel.x = 5;
        [self.imageView sizeToFit];
        self.imageView.centerY = self.titleLabel.centerY + 2;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + 5;
        self.width = CGRectGetMaxX(self.imageView.frame) + 5;
    }
    
}


@end
