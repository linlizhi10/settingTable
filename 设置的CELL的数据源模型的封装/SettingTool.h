//
//  SettingTool.h
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingTool : NSObject
@property (nonatomic,copy) NSString *key;
+(void)setBool:(BOOL)off forKey:(NSString *)key;
+(BOOL)boolForKey:(NSString *)key;
+(void)setObject:(NSString *)text forKey:(NSString *)key;
+(NSString *)objectForKey:(NSString *)key;
@end
