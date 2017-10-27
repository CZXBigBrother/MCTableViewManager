//
//  MCBaseDataModel.m
//  MCTableView
//
//  Created by marco chen on 2017/10/26.
//  Copyright © 2017年 marco chen. All rights reserved.
//

#import "MCBaseDataModel.h"

@implementation MCBaseDataModel
+ (instancetype)initWithModelWithData:(id)cellParam withAcitonParams:(id)acitonParams
{
    MCBaseDataModel * data = [[MCBaseDataModel alloc]init];
    data.MCItemCell = nil;
    data.MCItemAction = nil;
    data.MCItemHeight = 0;
    data.MCItemCellParams = nil;
    data.MCItemActionParams = nil;
    return data;
}
@end
