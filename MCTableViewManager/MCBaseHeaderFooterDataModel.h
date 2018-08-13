//
//  MCBaseHeaderFooterDataModel.h
//  MCTableViewManagerExample
//
//  Created by marco chen on 2018/8/8.
//  Copyright © 2018年 marco chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MCBaseDataModel.h"

@interface MCBaseHeaderFooterDataModel : NSObject
#pragma mark - footer 相关属性
/**
 cell的foot对象
 */
@property (strong, nonatomic) UITableViewHeaderFooterView *MCItemFooter;
/**
 cell的Footer高度
 */
@property (assign, nonatomic) CGFloat MCItemFooterHeight;
#pragma mark - header 相关属性
/**
 cell的header对象
 */
@property (strong, nonatomic) UITableViewHeaderFooterView *MCItemHeader;
/**
 cell的Header高度
 */
@property (assign, nonatomic) CGFloat MCItemHeaderHeight;

@property (strong, nonatomic) NSMutableArray<MCBaseDataModel *> *items;



@end
