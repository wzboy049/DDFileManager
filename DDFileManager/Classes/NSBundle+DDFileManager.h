//
//  NSBundle+DDFileManager.h
//  DDFileManager
//
//  Created by smartDP on 2017/10/10.
//

#import <Foundation/Foundation.h>

@interface NSBundle (DDFileManager)

+ (instancetype)ddFileManagerBundle;

+ (UIImage *)imageFromFileBundle:(NSString *)imageName;

@end

