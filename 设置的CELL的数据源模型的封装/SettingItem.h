//
//  SettingItem.h
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//  一个SettingItem模型  对应一个Cell需要的数据源
//  父类,用来描述当前cell里面要显示的内容，描述点击cell后做什么事情

#import <Foundation/Foundation.h>

@interface SettingItem : NSObject
//为一行（cell）提供 图标名
@property (nonatomic,copy) NSString *icon;
//为一行（cell）提供 标题
@property (nonatomic,copy) NSString *title;
//为一行（cell）提供 子标题
@property (nonatomic,copy) NSString *subTitle;
@property (nonatomic,copy) void (^operation)();//点击cell后要执行的操作
#pragma mark - 类方法，生成模型实例
//有标题 有图片的模型
+(id)itemWithIcon:(NSString *)icon title:(NSString *)title;
//只有标题的模型
+(id)itemWithTitle:(NSString *)title;
@end
