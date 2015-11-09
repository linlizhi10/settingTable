//
//  SettingItemLabel.m
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//

#import "SettingItemLabel.h"
#import "SettingTool.h"
@implementation SettingItemLabel
//拦截，cell右边显示的文字，赋值时，就必须归档
-(void)setText:(NSString *)text
{
    _text=text;
    //归档
    [SettingTool setObject:text forKey:self.key];
}
//为key赋值的时候，就必须解档
-(void)setKey:(NSString *)key
{
    [super setKey:key];
    _text=[SettingTool objectForKey:key];
    
}
@end
