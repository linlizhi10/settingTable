//
//  SettingGroup.h
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingGroup : NSObject
//头部标题
@property (nonatomic,copy) NSString *header;
//中间的条目（settingItem对象数组）
@property (nonatomic,strong) NSArray *items;
//尾部标题
@property (nonatomic,copy) NSString *footer;
@end
