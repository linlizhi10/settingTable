//
//  BaseSetingController.h
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingGroup.h"
#import "SettingItem.h"
// 导入数据模型
// 右侧是箭头的数据模型
#import "SettingItemArrow.h"
// 右侧是开关的数据模型
#import "SettingItemSwitch.h"


// 右边是子文本
#import "SettingItemLabel.h"

// 所有声明的将要被存储到沙盒中的key
//#import "SettingArchiveKeys.h"
@interface BaseSetingController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
{
    //开放给子类用，父类只负责初始化，子类负责添加一个个group对象，一个group模型对应一个section
    NSMutableArray *_allGroups;//所有的组模型
}
@property (nonatomic,weak,readonly) UITableView *tableView;
@end
