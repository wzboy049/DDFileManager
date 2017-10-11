//
//  DDViewController.m
//  DDFileManager
//
//  Created by wzboy on 08/20/2017.
//  Copyright (c) 2017 wzboy. All rights reserved.
//

#import "DDViewController.h"


//#import "DDFile"


#import <DDFileManager/DDFileManager.h>

//#import <DDFileManager/DDFileModel.h>

//#import <DDFileManager/DDFileManager.h>

//#import <DDFileManager/DDFileManager-umbrella.h>
//#import "DDFileManager.h"
#import "DDFileManagerViewController.h"

//#import <DDFileManager/UIView+Frame.h>

#import <DDFileManager/UIView+Frame.h>

@interface DDViewController ()


@end


@implementation DDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    DDFileManagerViewController *fvc = [DDFileManagerViewController new];
//    fvc.startType = DDStartFolderTypeDocument;//如果只允许用户进入文档,就设置这个
    [self.navigationController pushViewController:fvc animated:true];
}

@end
