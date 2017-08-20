//
//  DDFileModel.h
//  DDFileManager
//
//  Created by 王志斌 on 2017/8/20.
//  Copyright © 2017年 王志斌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDFileModel : NSObject


@property (nonatomic, strong) NSString *fullPath; /**< 全路径 */

@property (nonatomic, strong) NSString *showName; /**<  */

@property (nonatomic, strong) NSString *name; /**< 文件名,若是文件夹,就是文件夹的名字 */

@property (nonatomic, strong) NSString *parentPath; /**< 上级目录 */

@property (nonatomic, assign) BOOL isDirectory; /**< 是否文件夹  */

//__


@property (nonatomic, strong) NSString *NSFileCreationDate; /**<  "2017-08-20 03:11:06 +0000"*/

@property (nonatomic, strong) NSNumber *NSFileExtensionHidden; /**< 0 */

@property (nonatomic, strong) NSString *NSFileModificationDate; /**< 2017-08-20 03:11:06 +0000 */

@property (nonatomic, strong) NSNumber *NSFileSize; /**<  */

@property (nonatomic, strong) NSFileAttributeType NSFileType; /**<NSFileAttributeType 就是NSString  */


+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
