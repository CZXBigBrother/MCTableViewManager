//
//  InstanceExampleController.m
//  MCTableViewManagerExample
//
//  Created by marco chen on 2018/8/3.
//  Copyright © 2018年 marco chen. All rights reserved.
//

#import "InstanceExampleController.h"
#import "MCBaseHeaderFooterDataModel.h"

#import "MCTableViewManager.h"
#import "MCBaseDataModel.h"
#import "AExampleCell.h"
#import "BExampleCell.h"

#import "CTableViewCell.h"

@interface InstanceExampleController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) UITableView *myMCTableView;
@property (nonatomic, copy) NSArray *itemsArray;
@property (strong, nonatomic) MCTableViewManager *myManage;
@end

@implementation InstanceExampleController

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
    IndexCell1.MCItemCellParam = @{@"testParam":@"testParamC1"};
    IndexCell1.MCItemHeight = 44;
    IndexCell1.MCItemSetDataAction = @"setdata:";
    IndexCell1.MCItemAction = @"AExampleAction:";
    IndexCell1.MCItemActionParams = @[@"调用vc方法创建"];
    
    MCBaseDataModel * IndexCell2 = [[MCBaseDataModel alloc]init];
    IndexCell2.MCItemCell = [CTableViewCell cellWithTableView:self.myMCTableView];
    IndexCell2.MCItemHeight = 44;
    IndexCell2.MCItemSetDataAction = @"setdata:";
    IndexCell2.MCItemCellParam = @{@"testParam":@"testParamC2"};
    IndexCell2.MCItemAction = @"BExampleActionMultiplicityParam:withBParam:";
    IndexCell2.MCItemActionParams = @[@"参数一",@"参数二"];
    MCBaseHeaderFooterDataModel * section1 = [[MCBaseHeaderFooterDataModel alloc]init];
    [section1.items addObjectsFromArray:@[IndexCell1]];
    section1.MCItemHeaderHeight = 15;

    MCBaseHeaderFooterDataModel * section2 = [[MCBaseHeaderFooterDataModel alloc]init];
    [section2.items addObjectsFromArray:@[IndexCell2]];
    section2.MCItemHeaderHeight = 5;
    
    self.itemsArray = @[
                        section1,
                        section2
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
    return [self.myManage MC_heightForFooterInSection:section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [self.myManage MC_heightForHeaderInSection:section];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self.myManage MC_viewForHeaderInSection:section];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [self.myManage MC_viewForFooterInSection:section];
}


#pragma mark - 模拟cell的点击事件
- (void)AExampleAction:(NSString *)text {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示"message:text preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)BExampleActionMultiplicityParam:(NSString *)text withBParam:(NSString *)textB{
    NSLog(@"BExampleAction:%@ textB:%@",text,textB);
    int R = (arc4random() % 256);
    int G = (arc4random() % 256);
    int B = (arc4random() % 256);
    self.myMCTableView.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
}


@end
