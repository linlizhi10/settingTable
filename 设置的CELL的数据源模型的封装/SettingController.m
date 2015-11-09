//
//  SettingController.m
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//

#import "SettingController.h"
#import "PushNoticeController.h"
#import "ShareController.h"
#import "AboutController.h"
#import "HelpController.h"
#import "ProductController.h"
@interface SettingController ()

@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.第0组：3个
    [self add0SectionItems];
    
    // 2.第1组：6个
    [self add1SectionItems];
}
#pragma mark 添加第0组的模型数据
- (void)add0SectionItems
{
    
    // 1.1.推送和提醒
    SettingItemArrow *push = [SettingItemArrow itemWithIcon:@"fn_icon_1" title:@"推送和提醒"];
    push.showVCClass = [PushNoticeController class];
    // copy状态下的block（堆里面的block）会对里面所使用的外界变量 产生 强引用
    //    __weak SettingController *setting = self;
    //    __unsafe_unretained
    
    
    // 1.2.摇一摇机选
    SettingItemSwitch *shake = [SettingItemSwitch itemWithIcon:@"fn_icon_2" title:@"摇一摇机选"];
    shake.key=@"shake";
    //shake.key = ILSettingShakeChoose;
    
    // 1.3.声音效果
    SettingItemSwitch *sound = [SettingItemSwitch itemWithIcon:@"fn_icon_3" title:@"声音效果"];
    sound.key=@"sound";
    //sound.key = ILSettingSoundEffect;
    
    SettingGroup *group = [[SettingGroup alloc] init];
    //group.header=@"第一组";
    group.items = @[push, shake, sound];
    [_allGroups addObject:group];
}

#pragma mark 添加第1组的模型数据
- (void)add1SectionItems
{
    // 2.1.检查新版本
    SettingItemArrow *update = [SettingItemArrow itemWithIcon:@"fn_icon_4" title:@"检查新版本"];
    update.operation = ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"目前已是最新版本了" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    };
    
    // 2.2.帮助
    SettingItemArrow *help = [SettingItemArrow itemWithIcon:@"fn_icon_5" title:@"帮助"];
    help.showVCClass = [HelpController class];
    
    // 2.3.分享
    SettingItemArrow *share = [SettingItemArrow itemWithIcon:@"fn_icon_6" title:@"分享"];
    share.showVCClass = [ShareController class];
    
    // 2.4.查看消息
    SettingItemArrow *msg = [SettingItemArrow itemWithIcon:@"fn_icon_1" title:@"查看消息"];
    
    // 2.5.产品推荐
    SettingItemArrow *product = [SettingItemArrow itemWithIcon:@"fn_icon_2" title:@"产品推荐"];
    product.showVCClass = [ProductController class];
    
    // 2.6.关于
    SettingItemArrow *about = [SettingItemArrow itemWithIcon:@"fn_icon_3" title:@"关于"];
    about.showVCClass = [AboutController class];
    
    SettingGroup *group = [[SettingGroup alloc] init];
    group.items = @[update, help, share, msg, product, about];
    [_allGroups addObject:group];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
