//
//  DDFileManagerViewController.m
//  DDFileManager
//
//  Created by 王志斌 on 2017/8/20.
//  Copyright © 2017年 王志斌. All rights reserved.
//

#import "DDFileManagerViewController.h"

#import "DDFileInforCell.h"
#import "SCSTableHeaderView.h"

/** 将rgb转成颜色 */
UIColor * RGBColor_dd(CGFloat r, CGFloat g, CGFloat b){
    return [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1];
}




@interface DDFileManagerViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    DDFileModel *_currentModel;
}

@property (nonatomic, strong) UITableView *tableView; /**<  */

@property (nonatomic, strong) NSMutableArray *modelArray;/**<  */

@property (nonatomic, strong) DDFileModel *currentModel; /**<  */

@property (nonatomic, strong) NSFileManager *fileManager; /**<  */

@property (nonatomic, strong) SCSTableHeaderView *headerView ;/**< headerView */


@end

@implementation DDFileManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.title = @"文件管理器";
    [self.view addSubview:self.tableView];
    
    [self setupHeardView];

    [self prepareDataSourcebyFileModel:self.currentModel];

}

- (void)setupHeardView {
    
    SCSTableHeaderView *headerView = [[SCSTableHeaderView alloc]initWithFrame:kSCSTableHeaderViewFrame];
    headerView.backgroundColor = RGBColor_dd(240, 250, 249);
   
    self.headerView = headerView;
    self.tableView.tableHeaderView = headerView;
    [self.headerView addModel:self.currentModel];
    
    Weak_Self;
    headerView.btnClickBlock = ^(DDFileModel * depModel){
        
        weakSelf.currentModel = depModel;
        [weakSelf prepareDataSourcebyFileModel:depModel];
    };
}

- (void)prepareDataSourcebyFileModel:(DDFileModel *)fileModel {
    
    Weak_Self;
    
    NSString *currentPath = self.fileManager.currentDirectoryPath;

    NSMutableArray *arrM = [NSMutableArray array];
    NSArray *subPaths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:fileModel.fullPath error:nil];
    
    NSLog(@"fileModel.fullPath = %@",fileModel.fullPath);
    
    for (NSString *subPathStr in subPaths) {
        DDFileModel *model = [DDFileModel new];
        model.name = subPathStr;
        model.parentPath = currentPath;
        
        NSDictionary *dict = [self.fileManager attributesOfItemAtPath:model.fullPath error:nil];
        [model setValuesForKeysWithDictionary:dict];
        
        [arrM addObject:model];
    }

//    NSLog(@"arrM = %@",arrM);
    
    weakSelf.modelArray = arrM;
    [weakSelf.tableView reloadData];
}


#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DDFileInforCell *cell = (DDFileInforCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DDFileInforCell class])];
    

    cell.fileModel = self.modelArray[indexPath.row];
    
    return cell;

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    DDFileModel *fileModel = self.modelArray[indexPath.row];
    
    if (!fileModel.isDirectory) {
        return;
    }
    self.currentModel = fileModel;
    [self.headerView addModel:fileModel];
    [self prepareDataSourcebyFileModel:fileModel];
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    DDFileModel *fileModel = self.modelArray[indexPath.row];
    
    if ([fileModel.fullPath isEqualToString:NSHomeDirectory()]) {
        return @[];
    }
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        [self.fileManager removeItemAtPath:fileModel.fullPath error:nil];
        [self prepareDataSourcebyFileModel:self.currentModel];
    }];
    
    return @[deleteAction];
}



#pragma mark - lazy

- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = false;
        
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 64;
    
        
        [_tableView registerClass:[DDFileInforCell class] forCellReuseIdentifier:NSStringFromClass([DDFileInforCell class])];
        
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
    
}

- (NSMutableArray *)modelArray {
    if (!_modelArray) {
        _modelArray = [NSMutableArray array];

        [_modelArray addObject:self.currentModel];
    }
    return _modelArray;
}

- (DDFileModel *)currentModel{
    if (!_currentModel) {
        _currentModel = [DDFileModel new];
        _currentModel.showName = @"root";
        switch (_startType) {
                case DDStartFolderTypeDocument:{
                    _currentModel.fullPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true) lastObject];
                    break;
                }
                case DDStartFolderTypeCache:{
                    _currentModel.fullPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, true) lastObject];
                    break;
                }
            default:{
                _currentModel.fullPath = NSHomeDirectory();
                break;
            }
        }
        _currentModel.NSFileType = NSFileTypeDirectory;
        _currentModel.NSFileSize = [self.fileManager attributesOfItemAtPath:NSHomeDirectory() error:nil][@"NSFileSize"];
    }
    return _currentModel;
}

- (void)setCurrentModel:(DDFileModel *)currentModel{
    _currentModel = currentModel;
    
    [self.fileManager changeCurrentDirectoryPath:currentModel.fullPath];
}

- (NSFileManager *)fileManager {
    if (!_fileManager) {
        _fileManager = [NSFileManager defaultManager];
        
        [_fileManager changeCurrentDirectoryPath:NSHomeDirectory()];
    }
    return _fileManager;
}




@end
