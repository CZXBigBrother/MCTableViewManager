//
//  ViewController.m
//  MCTableViewManagerExample
//
//  Created by marco chen on 2017/10/27.
//  Copyright © 2017年 marco chen. All rights reserved.
//

#import "ViewController.h"

#import "MCTableViewManager.h"
#import "MCBaseDataModel.h"
#import "MCBaseHeaderFooterDataModel.h"

#import "AExampleCell.h"
#import "BExampleCell.h"

#import "CTableViewCell.h"

#import "InstanceExampleController.h"
#import "FuncInitExampleController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) UITableView *myMCTableView;
@property (nonatomic, copy) NSArray *itemsArray;
@property (strong, nonatomic) MCTableViewManager *myManage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.myMCTableView = tableView;
    self.myManage = [[MCTableViewManager alloc]init];
    [self loadSettingItems];
    [self.myMCTableView reloadData];

}
#pragma mark - 模拟数据加载
- (void)loadSettingItems
{
    MCBaseDataModel * IndexCell1 = [[MCBaseDataModel alloc]init];
    IndexCell1.MCItemCell = [CTableViewCell cellWithTableView:self.myMCTableView];
    IndexCell1.MCItemCellParam = @{@"testParam":@"第一种创建cell的方法:直接使用实例"};
    IndexCell1.MCItemHeight = 44;
    IndexCell1.MCItemSetDataAction = @"setdata:";
    IndexCell1.MCItemAction = @"pushInstanceController";

    MCBaseDataModel * IndexCell2 = [[MCBaseDataModel alloc]init];
    IndexCell2.MCItemCell = [CTableViewCell cellWithTableView:self.myMCTableView];
    IndexCell2.MCItemCellParam = @{@"testParam":@"第二种创建cell的方法:调用vc带的创建实例"};
    IndexCell2.MCItemHeight = 44;
    IndexCell2.MCItemSetDataAction = @"setdata:";
    IndexCell2.MCItemAction = @"pushFuncInitController";
    
    MCBaseHeaderFooterDataModel * section1 = [[MCBaseHeaderFooterDataModel alloc]init];
    section1.items = [NSMutableArray arrayWithArray:@[IndexCell1,IndexCell2]];
    
    self.itemsArray = @[
                        section1
                        ];
    [self.myManage updateDatas:[NSMutableArray arrayWithArray:self.itemsArray]];

}
#pragma mark - tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.myManage MC_numberOfSectionsInTableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.myManage MC_numberOfRowsInSection:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (UITableViewCell *)[self.myManage MC_cellForRowAtIndexPath:indexPath withTarget:self];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.myManage MC_cellheightForRowAtIndexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.myManage MC_didSelectRowAtIndexPath:indexPath withTarget:self];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return FLT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return FLT_MIN;
}
#pragma mark - 模拟创建cell
- (UITableViewCell *)AExampleCell {
    static NSString *ID = @"AExampleCell";
    UITableViewCell *cell = [self.myMCTableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"AExampleCell"];
    return cell;
}

- (UITableViewCell *)BExampleCell:(NSString *)param {
    static NSString *ID = @"BExampleCell";
    UITableViewCell *cell = [self.myMCTableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"BExampleCell param = %@",param];
    return cell;
}

- (void)pushInstanceController {
    [self.navigationController pushViewController:[[InstanceExampleController alloc]init] animated:YES];
}
- (void)pushFuncInitController {
    [self.navigationController pushViewController:[[FuncInitExampleController alloc]init] animated:YES];
}
@end
