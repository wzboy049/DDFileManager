//
//  DDFileManagerViewController.h
//  DDFileManager
//
//  Created by 王志斌 on 2017/8/20.
//  Copyright © 2017年 王志斌. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DDStartFolderType) {
    DDStartFolderTypeDefault     = 0,            //NSHomeDirectory()
    DDStartFolderTypeDocument    = 1,            // Documents
    DDStartFolderTypeCache       = 2,            // Library/Caches
};

@interface DDFileManagerViewController : UIViewController

@property (assign, nonatomic) DDStartFolderType startType; /**< 起始路径 如果不设置就是NSHomeDirectory() */

@end
