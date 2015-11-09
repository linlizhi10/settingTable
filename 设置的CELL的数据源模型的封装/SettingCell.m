//
//  SettingCell.m
//  设置的CELL的数据源模型的封装
//
//  Created by skunk  on 15/2/2.
//  Copyright (c) 2015年 skunk . All rights reserved.
//

#import "SettingCell.h"
//数据源
#import "SettingItem.h"
#import "SettingItemSwitch.h"
#import "SettingItemArrow.h"
#import "SettingItemLabel.h"
// 在ios6中,cell的contentView的x是10,因此,要想让cell全屏宽,必须使用cell左移10,宽度+20
const int MakeCellToLeftBy = 10;
@interface SettingCell ()
{
    // 每一个进入视野的cell 都循环利用(共用)一个arrow,switch,label
    UIImageView *_arrowImageView;
    UISwitch *_switch;
    UILabel *_label;
    
    UIView *_divider;
}
@end
@implementation SettingCell
#pragma mark -生命周期
// 类方法创建cell实例对象,使用instancetype好处多多,更加严谨,让编译器更智能提示错误
// 先从参数tableView的缓存池中取,取不到,才要创建
+(instancetype)settingCellWithTableView:(UITableView *)tableView
{
    //static修饰的局部变量，只会初始化一次
    static NSString *ID=@"SettingCell";
    //拿到一个标识先去缓存池中查找找对应的Cell
    SettingCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    //如果缓存池中没有，才需要传入一个标识创建新的cell
    if (cell==nil) {
        cell=[[SettingCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置全局统一的cell背景view；
        [self setupCellBgView];
        //设置子控件属性
        [self setupCellLabelBgColor];
        //添加cell底层的分割线（为了统一，先移除系统自带的separateLine）
        [self setupCellUnderLine];
    }
    return  self;
}
#pragma mark -初始化 属性设置
#pragma mark -设置cell背景View
-(void)setupCellBgView
{
    //默认cell背景View（白色）
    UIView *bgView=[[UIView alloc]init];
    bgView.backgroundColor=[UIColor whiteColor];
    self.backgroundView=bgView;
    
    //选中cell背景view（灰色）
    UIView *selectedBgView=[[UIView alloc]init];
    selectedBgView.backgroundColor=[UIColor colorWithRed:237.0/255.0 green:233.0/255.0 blue:218.0/255.0 alpha:1];
    self.selectedBackgroundView=selectedBgView;
}
#pragma mark -设置cell内子控件label背景
-(void)setupCellLabelBgColor
{
    //标题，去其默认的背景
    self.textLabel.backgroundColor=[UIColor clearColor];
    self.textLabel.font=[UIFont systemFontOfSize:14];
    //子标题 去其默认的背景
    self.detailTextLabel.backgroundColor=[UIColor clearColor];
    self.detailTextLabel.font=[UIFont systemFontOfSize:12];
}
#pragma mark -设置分隔线
//添加cell底部的分隔线
-(void)setupCellUnderLine
{
    UIView *diviver=[[UIView alloc]init];
    diviver.backgroundColor=[UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1];
    // 不能在这里设置分隔线的x值（原因：cell没有具体的数据，里面的label就不知道最终的位置）
    //    divider.frame = CGRectMake(0, 0, self.contentView.frame.size.width, 1.5);
    [self.contentView addSubview:diviver];
    _divider=diviver;
}
#pragma mark -拦截setter方法
//根据所在的组，所在的行号，设置分隔线的显示状态
-(void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath=indexPath;
    //设置underLine的可见性，根据该cell所在的indexPath
    _divider.hidden=indexPath.row==0;
}
-(void)setItem:(SettingItem *)item
{
    _item=item;
    //设置数据
    self.imageView.image=[UIImage imageNamed:item.icon];
    self.textLabel.text=item.title;
    self.detailTextLabel.text=item.subTitle;
    //根据数据源模型的不同，创建不同的最右边的accessoryView
    if ([item isKindOfClass:[SettingItemArrow class]]) {
        //设置箭头
        [self setAccessoryViewArrow];
        
    }else if ([item isKindOfClass:[SettingItemSwitch class]])
    {
        //设置开关
        [self setAccessoryViewSwitch];
    }else if([item isKindOfClass:[SettingItemLabel class]])
    {
        //设置文本
        [self setAccessoryViewLabel];
        
    }else{
        //什么也没有，必须清空右边显示的view，因为cell循环使用
        self.accessoryView=nil;
        //并且要还原，使用默认的选中样式（既可以产生选中效果）
        self.selectionStyle=UITableViewCellSelectionStyleDefault;
    }
    
}
#pragma mark -设置右边的箭头
//每一个进入视野的cell 都循环利用（共用）一个arrow，switch，label
-(void)setAccessoryViewArrow
{
    if (_arrowImageView==nil) {
        _arrowImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"back"]];
    }
    //右边显示箭头
    self.accessoryView=_arrowImageView;
    //用默认的选中样式
    self.selectionStyle=UITableViewCellSelectionStyleDefault;
}
#pragma mark -设置右边的文本标签
//每一个进入视野的cell 都循环利用（共用）一个
-(void)setAccessoryViewLabel
{
    if (_label==nil) {
        _label=[[UILabel alloc]init];
        _label.bounds=CGRectMake(0, 0, 100, self.frame.size.height);
        _label.textAlignment=NSTextAlignmentRight;
        _label.backgroundColor=[UIColor clearColor];
        _label.textColor=[UIColor colorWithRed:173.0/255.0 green:69.0/255.0 blue:14.0/255.0 alpha:1];
        _label.font=[UIFont systemFontOfSize:13];
    }
    //设置右边label的值
    SettingItemLabel *labelItem=(SettingItemLabel *)_item;
    
    _label.text=labelItem.text;
    //右边显示子文本
    self.accessoryView=_label;
    //允许选中本行
    self.selectionStyle=UITableViewCellSelectionStyleDefault;
}
#pragma mark 设置右边的开关
-(void)setAccessoryViewSwitch
{
    if (_switch==nil) {
        _switch=[[UISwitch alloc]init];
        [_switch addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];
    }
    //设置开关的状态
    SettingItemSwitch *switchItem=(SettingItemSwitch *)_item;
    _switch.on=!switchItem.off;
    //右边显示开关
    self.accessoryView=_switch;
    //因为是开关，所以要禁止选中本行
    self.selectionStyle=UITableViewCellSelectionStyleNone;
}
#pragma mark 开关状态改变
-(void)switchChange
{
    SettingItemSwitch *switchItem=(SettingItemSwitch *)_item;
    switchItem.off=!_switch.on;

}
#pragma mark -当cell的高度改变就会调用
//父类方法，需要调节cell内部子控件的frame，只有在layoutSubViews方法中才最可靠
-(void)layoutSubviews
{
    [super layoutSubviews];
    _divider.frame=CGRectMake(self.textLabel.frame.origin.x, 0, self.contentView.frame.size.width+100, 1.2);
    if ([[[UIDevice currentDevice] systemVersion]floatValue]==7.0 ) {
        return;
    }
    //如果是ios6，设置cell占整个屏幕的宽度
    [self makeCellFullWidth];
}
-(void)makeCellFullWidth
{
    // 在ios6中,cell的contentView的x默认是10,因此,要想让cell全屏宽,
    //必须使用cell的x左移10,宽度+20,相当于把整个cell,先左平移,再扯宽
    //1.将cell的frame拉宽
    CGRect cellF=self.frame;
    //cell整体先左平移10；
    cellF.origin.x=-MakeCellToLeftBy;
    //cell整体宽度再加20，这样cell的contentView就全屏宽了
    CGFloat deltaW=MakeCellToLeftBy *2;
    cellF.size.width=[UIScreen mainScreen].bounds.size.width+deltaW;
    self.frame=cellF;
    
    //右边控件的frame（左移）
    //accessoryView不属于contentView，属于cell
    CGRect accessF=self.accessoryView.frame;
    accessF.origin.x=cellF.size.width-accessF.size.width-deltaW;
    self.accessoryView.frame=accessF;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
