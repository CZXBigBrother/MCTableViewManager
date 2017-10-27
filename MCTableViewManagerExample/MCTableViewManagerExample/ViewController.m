//
//  ViewController.m
//  MCTableViewManagerExample
//
//  Created by marco chen on 2017/10/27.
//  Copyright © 2017年 marco chen. All rights reserved.
//

#import "ViewController.h"

#import "MCTableViewManager.h"

#import "AExampleCell.h"
#import "BExampleCell.h"

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
    self.itemsArray = @[
                        @[[AExampleCell initWithModelWithData:nil withAcitonParams:@[@"AcitonParam --- A"]]],
                        @[[BExampleCell initWithModelWithData:@"B Name" withAcitonParams:@[@"AcitonParam --- B"]]]
                        ];
    self.myManage.GlobalData = [NSMutableArray arrayWithArray:self.itemsArray];
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
#pragma mark - 模拟cell的点击事件
- (void)AExampleAction:(NSString *)text {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示"message:text preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)BExampleAction:(NSString *)text {
    NSLog(@"BExampleAction %@",text);
    int R = (arc4random() % 256);
    int G = (arc4random() % 256);
    int B = (arc4random() % 256);
    self.myMCTableView.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
    
}


@end
