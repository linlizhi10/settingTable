//
//  SettingItemArchive.h
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//  中间父类,仅一个成员,key,所有需要归档的settingItem的子类(如开关等) 都可以继承本模型


#import "SettingItem.h"

@interface SettingItemArchive : SettingItem
// 存储数据时用的key,取数据时也是用该key
@property (nonatomic,copy) NSString *key;
@end
