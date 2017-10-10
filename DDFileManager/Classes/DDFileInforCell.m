//
//  DDFileInforCell.m
//  DDFileManager
//
//  Created by 王志斌 on 2017/8/20.
//  Copyright © 2017年 王志斌. All rights reserved.
//

#import "DDFileInforCell.h"

#import "NSBundle+DDFileManager.h"

@implementation DDFileInforCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)setFileModel:(DDFileModel *)fileModel {
    _fileModel = fileModel;
    
    self.textLabel.text = fileModel.name;
    self.detailTextLabel.text = [NSString stringWithFormat:@"size:%@",fileModel.NSFileSize];
    
    if (fileModel.isDirectory) {
//        self.imageView.image = [UIImage imageNamed:@"GenericFolderIcon"];
        self.imageView.image = [NSBundle imageFromFileBundle:@"GenericFolderIcon"];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
//        self.imageView.image = [UIImage imageNamed:@"SidebarDocumentsFolder"];
        self.imageView.image = [NSBundle imageFromFileBundle:@"SidebarDocumentsFolder"];
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}


@end
