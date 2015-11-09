//
//  SettingTool.m
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//

#import "SettingTool.h"

@implementation SettingTool
+(void)setBool:(BOOL)off forKey:(NSString *)key
{
    NSLog(@"key is ---%@",key);
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:off] forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
+(BOOL)boolForKey:(NSString *)key
{
    NSNumber *num=[[NSUserDefaults standardUserDefaults] objectForKey:key];
    BOOL off=[num boolValue];
    return off;
}
+(void)setObject:(NSString *)text forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setValue:text forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
+(NSString *)objectForKey:(NSString *)key
{
    NSString *str=[[NSUserDefaults standardUserDefaults] objectForKey:key];
    return str;
}
@end
