//
//  BExampleCell.m
//  MCTableViewManagerExample
//
//  Created by marco chen on 2017/10/27.
//  Copyright © 2017年 marco chen. All rights reserved.
//

#import "BExampleCell.h"

@implementation BExampleCell
+ (instancetype)initWithModelWithData:(id)cellParam withAcitonParams:(id)acitonParams {
    BExampleCell * data = [[BExampleCell alloc]init];
    data.MCItemCell = @"BExampleCell:";
    data.MCItemAction = @"BExampleAction:";
    data.MCItemHeight = 100;
    data.MCItemCellParams = cellParam;
    data.MCItemActionParams = acitonParams;
    return data;
}
@end
