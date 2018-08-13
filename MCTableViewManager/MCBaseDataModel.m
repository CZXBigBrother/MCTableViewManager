//
//  MCBaseDataModel.m
//  MCTableView
//
//  Created by marco chen on 2017/10/26.
//  Copyright © 2017年 marco chen. All rights reserved.
//

#import "MCBaseDataModel.h"

@implementation MCBaseDataModel
- (instancetype)init {
    self = [super init];
    if (self) {
        self.MCItemCell = nil;
        self.MCItemAction = nil;
        self.MCItemHeight = 0;
        self.MCItemCellParam = nil;
        self.MCItemActionParams = nil;
//        self.MCItemHeaderHeight = FLT_MIN;
//        self.MCItemFooterHeight = FLT_MIN;
    }
    return self;
}
+ (instancetype)initWithModelWithData:(id)cellParam withAcitonParams:(id)acitonParams {
    MCBaseDataModel * data = [[MCBaseDataModel alloc]init];
    data.MCItemCell = nil;
    data.MCItemAction = nil;
    data.MCItemHeight = 0;
    data.MCItemCellParam = nil;
    data.MCItemActionParams = nil;
//    data.MCItemHeaderHeight = FLT_MIN;
//    data.MCItemFooterHeight = FLT_MIN;
    return data;
}

+ (instancetype)initWithModelWithCell:(id)cell
                           withAction:(id)action
                     withActionParams:(id)actionParams
                           withHeight:(CGFloat)height
                            withParam:(id)param {
    MCBaseDataModel * data = [[MCBaseDataModel alloc]init];
    data.MCItemCell = cell;
    data.MCItemAction = action;
    data.MCItemHeight = height;
    data.MCItemCellParam = param;
    data.MCItemActionParams = actionParams;
    return data;
}
@end
