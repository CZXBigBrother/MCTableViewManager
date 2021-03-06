//
//  MCTableViewManager.h
//  MCTableView
//
//  Created by marco chen on 2017/10/25.
//  Copyright © 2017年 marco chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MCTableViewManager : NSObject
/**
 初始化

 @param data 数据队列
 */
- (instancetype)initWithDatas:(NSMutableArray *)data;

/**
 更新队列

 @param data 队列数据
 */
- (void)updateDatas:(NSMutableArray *)data;

/**
 返回cell

 @param indexPath 和系统返回的indexPath相同
 @param target 执行方法的对象
 @return 对象
 */
- (instancetype)MC_cellForRowAtIndexPath:(NSIndexPath *)indexPath withTarget:(id)target;

/**
 返回cell高度

 @param indexPath 和系统返回的indexPath相同
 @return 高度
 */
- (CGFloat)MC_cellheightForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 返回cell点击事件

 @param indexPath 和系统返回的indexPath相同
 @param target 执行方法的对象
 */
- (void)MC_didSelectRowAtIndexPath:(NSIndexPath *)indexPath withTarget:(id)target;

/**
 返回队列组数

 @return 返回队列组数
 */
- (NSInteger)MC_numberOfSectionsInTableView;

/**
 返回队列组中的个数

 @param section 组index
 @return 返回队列组中的个数
 */
- (NSInteger)MC_numberOfRowsInSection:(NSInteger)section;

- (CGFloat)MC_heightForFooterInSection:(NSInteger)section;
- (CGFloat)MC_heightForHeaderInSection:(NSInteger)section;

- (UIView *)MC_viewForHeaderInSection:(NSInteger)section;
- (UIView *)MC_viewForFooterInSection:(NSInteger)section;
@end
