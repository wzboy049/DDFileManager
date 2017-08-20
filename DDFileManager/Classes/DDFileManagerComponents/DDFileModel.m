//
//  DDFileModel.m
//  DDFileManager
//
//  Created by 王志斌 on 2017/8/20.
//  Copyright © 2017年 王志斌. All rights reserved.
//

#import "DDFileModel.h"

@implementation DDFileModel

- (void)setFullPath:(NSString *)fullPath {
    _fullPath = fullPath;
    
    if ([fullPath isEqualToString:NSHomeDirectory()]) {
        _showName = @"root";
    }else{
        _showName = fullPath.lastPathComponent;
    }
}

- (void)setParentPath:(NSString *)parentPath{
    _parentPath = parentPath;
    
    if (parentPath && _name && !_fullPath) {
        self.fullPath = [parentPath stringByAppendingPathComponent:_name];
    }
}

- (void)setName:(NSString *)name{
    _name = name;
    
    if (_parentPath && _name && !_fullPath) {
        self.fullPath = [_parentPath stringByAppendingPathComponent:_name];
    }
}

- (void)setNSFileType:(NSFileAttributeType)NSFileType{
    _NSFileType = NSFileType;
    
    _isDirectory = [NSFileType isEqualToString:NSFileTypeDirectory];
}



+ (instancetype)modelWithDict:(NSDictionary *)dict{
    DDFileModel *mod = [self new];
    [mod setValuesForKeysWithDictionary:dict];
    
    return mod;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
