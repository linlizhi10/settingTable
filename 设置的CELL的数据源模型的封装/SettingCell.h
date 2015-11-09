//
//  SettingCell.h
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//  view,自定义cell,接收数据源为其内部子控件提供数据

#import <UIKit/UIKit.h>
// 模型,数据源,为view cell 提供数据
@class SettingItem;
@interface SettingCell : UITableViewCell
// 模型,数据源,为view cell 提供数据
@property (nonatomic,strong) SettingItem *item;
// cell所在的组和行号
@property (nonatomic,strong) NSIndexPath *indexPath;
//类方法创建cell实例对象,使用instancetype好处多多,更加严谨,让编译器更智能提示错误
+(instancetype)settingCellWithTableView:(UITableView *)tableView;
@end
