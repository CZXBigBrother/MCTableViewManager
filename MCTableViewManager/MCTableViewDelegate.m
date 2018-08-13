//
//  MCTableViewDelegate.m
//  MCTableViewManagerExample
//
//  Created by marco chen on 2018/8/3.
//  Copyright © 2018年 marco chen. All rights reserved.
//

#import "MCTableViewDelegate.h"
#import "MCTableViewManager.h"

@interface MCTableViewDelegate()
@property (strong, nonatomic) MCTableViewManager *myManage;
@property (nonatomic, strong) NSMutableArray *itemsArray;

@end

@implementation MCTableViewDelegate

- (instancetype)initWithTarget:(id)target
{
    self = [super init];
    if (self) {
        self.myManage = [[MCTableViewManager alloc]init];
        self.target = target;
    }
    return self;
}
- (NSMutableArray *)itemsArray {
    if (_itemsArray == nil) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}
- (void)updateDatas:(NSArray *)arr {
    self.itemsArray = [NSMutableArray arrayWithArray:arr];
    [self.myManage updateDatas:self.itemsArray];
}
- (void)addObjectsDatas:(NSArray *)arr {
    [self.itemsArray addObjectsFromArray:arr];
    [self.myManage updateDatas:self.itemsArray];
}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([self.MCDelegate respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        return [self.MCDelegate numberOfSectionsInTableView:tableView];
    }
    return [self.myManage MC_numberOfSectionsInTableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.MCDelegate respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        return [self.MCDelegate tableView:tableView numberOfRowsInSection:section];
    }
    return [self.myManage MC_numberOfRowsInSection:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.MCDelegate respondsToSelector:@selector(tableView:cellForRowAtIndexPath:)]) {
        return [self.MCDelegate tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return (UITableViewCell *)[self.myManage MC_cellForRowAtIndexPath:indexPath withTarget:self.target];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.MCDelegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
        return [self.MCDelegate tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    return [self.myManage MC_cellheightForRowAtIndexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.MCDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.MCDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
        return;
    }
    [self.myManage MC_didSelectRowAtIndexPath:indexPath withTarget:self.target];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if ([self.MCDelegate respondsToSelector:@selector(tableView:heightForFooterInSection:)]) {
        return [self.MCDelegate tableView:tableView heightForFooterInSection:section];
    }
    return [self.myManage MC_heightForFooterInSection:section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if ([self.MCDelegate respondsToSelector:@selector(tableView:heightForHeaderInSection:)]) {
        return [self.MCDelegate tableView:tableView heightForHeaderInSection:section];
    }
    return [self.myManage MC_heightForHeaderInSection:section];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if ([self.MCDelegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)]) {
        return [self.MCDelegate tableView:tableView viewForHeaderInSection:section];
    }
    return [self.myManage MC_viewForHeaderInSection:section];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if ([self.MCDelegate respondsToSelector:@selector(tableView:viewForFooterInSection:)]) {
        return [self.MCDelegate tableView:tableView viewForFooterInSection:section];
    }
    return [self.myManage MC_viewForFooterInSection:section];
}

@end
