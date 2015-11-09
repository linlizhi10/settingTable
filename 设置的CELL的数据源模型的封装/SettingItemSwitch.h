//
//  SettingItemSwitch.h
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//  子类 最右边是【开关】的item数据模型,专业提供数据源,给右边是开关的cell
//  继承自SettingItemArchive,而SettingItemArchive又继承自SettingItem

#import "SettingItemArchive.h"

@interface SettingItemSwitch : SettingItemArchive
// 开关需要保存的是状态,在设置时,就归档
@property (nonatomic,assign) BOOL off;
@end
