//
//  SettingItemArrow.h
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//  子类 最右边是箭头的item数据模型,专业提供数据源,给右边是箭头的cell

#import "SettingItem.h"

@interface SettingItemArrow : SettingItem
// 一般带箭头的cell,被点击时候,是要跳到另一个界面(控制器)
@property (nonatomic,assign) Class showVCClass;//即将显示的控制器的类名；
@end
