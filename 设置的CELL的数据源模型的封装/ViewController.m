//
//  ViewController.m
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//

#import "ViewController.h"
#import "SettingController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SettingController *setting=[[SettingController alloc]init];
    setting.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController pushViewController:setting animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
