//
//  SettingItemLabel.h
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//  子类 最右边是【文字】的item数据模型,专业提供数据源,给右边是Label的cell

#import "SettingItemArchive.h"

@interface SettingItemLabel : SettingItemArchive
// cell右边显示的文字,在设置时就要归档
@property (nonatomic,copy) NSString *text;
@end
