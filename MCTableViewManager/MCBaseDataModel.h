//
//  MCBaseDataModel.h
//  MCTableView
//
//  Created by marco chen on 2017/10/26.
//  Copyright © 2017年 marco chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MCBaseDataModel : NSObject

#pragma mark - cell相关属性
/**
 cell的创建方法
 */
@property (strong, nonatomic)   id MCItemCell;
/**
 cell需要赋值的参数 注意:目前只支持一个参数或者nil,如果需要更多参数,可以使用NSDictionary,NSArray,NSSet或者自定义对象等
 */
@property (strong, nonatomic) id MCItemCellParam;
/**
cell setData方法
 */
@property (strong, nonatomic)   id MCItemSetDataAction;
/**
 cell的高度
 */
@property (assign, nonatomic) CGFloat MCItemHeight;
#pragma mark - cell selected事件相关属性
/**
 cell的点击selected事件,如果不需要事件,可以赋值为nil或者[nsnull null]
 */
@property (strong, nonatomic)   id MCItemAction;
/**
 cell selected事件需要的参数 注意:目前最多支持10个参数
 */
@property (strong, nonatomic) NSArray *MCItemActionParams;

/**
 一个创建cell的示例
 @param cellParam cell需要的参数
 @param acitonParams cell点击事件需要的参数
 @return cell对象
 */
+ (instancetype)initWithModelWithData:(id)cellParam withAcitonParams:(id)acitonParams;
@end
