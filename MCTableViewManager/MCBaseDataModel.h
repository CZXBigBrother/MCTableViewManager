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
/**cell的创建方法*/
@property (copy, nonatomic)   NSString *MCItemCell;
/**cell的点击selected事件*/
@property (copy, nonatomic)   NSString *MCItemAction;
/**cell需要赋值的参数*/
@property (strong, nonatomic) NSArray *MCItemCellParams;
/**cell selected事件需要的参数*/
@property (strong, nonatomic) NSArray *MCItemActionParams;
/**cell的高度*/
@property (assign, nonatomic) CGFloat MCItemHeight;

+ (instancetype)initWithModelWithData:(id)cellParam withAcitonParams:(id)acitonParams;
@end
