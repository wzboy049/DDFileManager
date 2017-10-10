//
//  NSBundle+DDFileManager.m
//  DDFileManager
//
//  Created by smartDP on 2017/10/10.
//

#import "DDFileModel.h"
#import "NSBundle+DDFileManager.h"


@implementation NSBundle (DDFileManager)

+ (instancetype)ddFileManagerBundle{
    static NSBundle *managerBundle = nil;
    if (managerBundle == nil) {
        managerBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[DDFileModel class]] pathForResource:@"DDFileManager" ofType:@"bundle"]];
    }
    return managerBundle;
}

+ (UIImage *)imageFromFileBundle:(NSString *)imageName{

    NSString *filePath = [[self ddFileManagerBundle] pathForResource:[NSString stringWithFormat:@"%@@2x",imageName] ofType:@"png"];
//    NSLog(@"xxxx:%@",[UIImage imageWithContentsOfFile:filePath]);
    return [UIImage imageWithContentsOfFile:filePath];
}

@end


