//
//  SCSTableHeaderView.m
//  ZMSMobile
//
//  Created by 王志斌 on 16/12/7.
//  Copyright © 2016年 王志斌. All rights reserved.
//

#import "SCSTableHeaderView.h"

#import "SCSCustomeButton.h"

#import "DDFileManager.h"
#import "UIView+Frame.h"

#import "DDFileModel.h"

#import "NSBundle+DDFileManager.h"


@interface SCSTableHeaderView ()

@property (nonatomic, strong) UIScrollView *scrollView;/**<  */

@property (nonatomic, strong) UIView *bgView;/**< 放到scrollView上 用来撑开scrollView */

@property (nonatomic, strong) NSMutableArray *modelArray;/**<  */


@end

@implementation SCSTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        
         [self setupSubButton];
    }
    return self;
}


- (void)setupSubButton {
    
    [self.bgView removeFromSuperview];
    self.bgView = [[UIView alloc]initWithFrame:kSCSTableHeaderViewFrame];
    [self.scrollView addSubview:self.bgView];
    
    UIButton *preBtn;
    for (int i = 0; i < self.modelArray.count; i++) {
        
        DDFileModel *model = self.modelArray[i];
        
        SCSCustomeButton *btn = [SCSCustomeButton new];
        btn.titleLabel.font = [UIFont systemFontOfSize:17];
        
        NSLog(@"showName = %@",model.showName);
        [btn setTitle:model.showName forState:UIControlStateNormal];
        
        if (i == self.modelArray.count - 1) {
            //btn1.imageView.hidden = true;
            //btn1.imageView.alpha = 0; //这样不行
            [btn setImage:[UIImage new] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }else {
            [btn setImage:[NSBundle imageFromFileBundle:@"CreatTask_accessory"] forState:UIControlStateNormal];
//            [btn setImage:[UIImage imageNamed:@"CreatTask_accessory"] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        }
        
        btn.tag = i;
        [btn sizeToFit];
        btn.height = self.bgView.height;
        [btn layoutIfNeeded];
        
        if (preBtn) {
            btn.x = CGRectGetMaxX(preBtn.frame);
        }
        preBtn = btn;
        
        [self.bgView addSubview:btn];
        [btn addTarget:self action:@selector(scsBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.bgView.width = CGRectGetMaxX(preBtn.frame);
    self.scrollView.contentSize = self.bgView.size;
}

- (void)scsBtnClick:(UIButton *)btn {
    
    if (btn.tag+1 == self.modelArray.count) {
        return;
    }
    NSArray *arr = [self.modelArray subarrayWithRange:NSMakeRange(0, btn.tag + 1)];
    
    self.modelArray = [NSMutableArray arrayWithArray:arr];
    
    [self setupSubButton];
    
    if (self.btnClickBlock) {
        self.btnClickBlock(self.modelArray[btn.tag]);
    }
}

- (void)addModel:(DDFileModel *)model  {
    [self.modelArray addObject:model];
    
    [self setupSubButton];
}


#pragma mark - lazy

- (UIScrollView *)scrollView {

    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:kSCSTableHeaderViewFrame];
        _scrollView.showsHorizontalScrollIndicator = false;
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

- (NSMutableArray *)modelArray {
    if (!_modelArray) {
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}

@end
