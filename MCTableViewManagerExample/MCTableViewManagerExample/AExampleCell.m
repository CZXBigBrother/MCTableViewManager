//
//  AExampleCell.m
//  MCTableViewManagerExample
//
//  Created by marco chen on 2017/10/27.
//  Copyright © 2017年 marco chen. All rights reserved.
//

#import "AExampleCell.h"

@implementation AExampleCell

+ (instancetype)initWithModelWithData:(id)cellParam withAcitonParams:(id)acitonParams
{
    AExampleCell * data = [[AExampleCell alloc]init];
    data.MCItemCell = @"AExampleCell";
    data.MCItemAction = @"AExampleAction:";
    data.MCItemHeight = 50;
    data.MCItemCellParams = cellParam;
    data.MCItemActionParams = acitonParams;
    return data;
}

@end
