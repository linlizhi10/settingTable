//
//  BaseSetingController.m
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//

#import "BaseSetingController.h"
#import "SettingCell.h"
// 每一个section之间的顶部间距
const int SectionHeaderMargin = 20;
@interface BaseSetingController ()

@end

@implementation BaseSetingController
//直接让tableView就是控制器的View；
-(void)loadView
{
    //父类的组数组，初始化放在loadView中，好处是,子类在viewDidLoad时,就已经拥有初始化的_allGroups,而不再需要先调用父类的viewDidLoad,然后才可向数组添加成员？？
    _allGroups = [NSMutableArray array];
    // 创建并维护自己的tableView,子类仅需提供数据源 groupsArr 即可
    [self createTableView];
}
-(void)createTableView
{
    UITableView *tableView=[[UITableView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStyleGrouped];
    tableView.delegate=self;
    tableView.dataSource=self;
    // 设置全局统一的表格背景
    // 如果是分组,则要先清空背景view,才可设置表格背景颜色(colorWithPattern平铺)
    tableView.backgroundView=nil;
    tableView.backgroundColor=[UIColor clearColor];
    
    // group状态下，sectionFooterHeight和sectionHeaderHeight是有值的
    tableView.sectionFooterHeight=0;
    tableView.sectionHeaderHeight=SectionHeaderMargin;
    
    //在tableView初始化的时候设置contentInset
    //在tableView展示完数据的时候给contentInset.top增加（20+44）的值
    if ([[[UIDevice currentDevice] systemVersion] floatValue]==7.0) {
        tableView.contentInset=UIEdgeInsetsMake(SectionHeaderMargin-35, 0, 0, 0);
        
    }
    //先隐藏表格默认的分割线，cell内部在根据所在的indexpath绘制underLine
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.view =tableView;
    _tableView=tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _allGroups.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //取出组模型
    SettingGroup *group=_allGroups[section];
    //返回组模型中成员---settingItems数组的长度
    return group.items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建一个SettingCell  自定义的view
    SettingCell *cell = [SettingCell settingCellWithTableView:tableView];
    
    // 2.取出组模型
    SettingGroup *group = _allGroups[indexPath.section];
    // 3.取出组中的被点的cell模型,并赋值给自定义的view,供其内部子控件使用
    cell.item = group.items[indexPath.row];
    // 根据所在的组,所在的行号,设置分割线的显示状态
    cell.indexPath = indexPath;
    
    return cell;
}
#pragma mark - 代理
// 点击了cell后的操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.去除选中时的背景
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 2.取出这行对应的模型
    SettingGroup *group = _allGroups[indexPath.section];
    // 取出对应的cell数据源模型
    SettingItem *item = group.items[indexPath.row];
    
    // 3.取出这行对应模型中有block代码
    if (item.operation) {
        // 执行block
        item.operation();
        return;
    }
    
    // 4.检测有没有要跳转的控制器
    if ([item isKindOfClass:[SettingItemArrow class]]) {
        // 将cell对应的数据源模型  转成具体的子类
        SettingItemArrow *arrowItem = (SettingItemArrow *)item;
        // 创建并跳转到指定的控制器
        if (arrowItem.showVCClass) {
            UIViewController *vc = [[arrowItem.showVCClass alloc] init];
            NSLog(@"%@",arrowItem.showVCClass);
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}
#pragma mark 返回每一组的header标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // 取得组模型
    SettingGroup *group = _allGroups[section];
    // 返回组的头部标题
    return group.header;
}
#pragma mark 返回每一组的footer标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    // 取得组模型
    SettingGroup *group = _allGroups[section];
    // 返回组的尾部标题
    return group.footer;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
