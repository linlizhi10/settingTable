//
//  SettingItemSwitch.m
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//

#import "SettingItemSwitch.h"
#import "SettingTool.h"
@implementation SettingItemSwitch
-(void)setOff:(BOOL)off
{
    NSLog(@"setOff");
    _off=off;
    [SettingTool setBool:off forKey:self.key];
}
-(void)setKey:(NSString *)key
{
    NSLog(@"setKey");
    [super setKey:key];
    _off=[SettingTool boolForKey:key];
}
@end
