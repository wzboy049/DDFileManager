//
//  DDViewController.m
//  DDFileManager
//
//  Created by wzboy on 08/20/2017.
//  Copyright (c) 2017 wzboy. All rights reserved.
//

#import "DDViewController.h"

#import <DDFileManager/DDFileManager-umbrella.h>


@interface DDViewController ()

@end

@implementation DDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[DDFileManagerViewController new] animated:true];
}

@end
