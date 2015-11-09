//
//  SettingItem.m
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//

#import "SettingItem.h"

@implementation SettingItem
// 有标题 有图片的模型
+(id)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    SettingItem *item=[[self alloc]init];
    item.icon=icon;
    item.title=title;
    return item;
}
//只有标题的模型
+(id)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}
@end
