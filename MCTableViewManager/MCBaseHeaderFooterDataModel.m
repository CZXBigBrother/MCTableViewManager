//
//  MCBaseHeaderFooterDataModel.m
//  MCTableViewManagerExample
//
//  Created by marco chen on 2018/8/8.
//  Copyright © 2018年 marco chen. All rights reserved.
//

#import "MCBaseHeaderFooterDataModel.h"

@implementation MCBaseHeaderFooterDataModel
- (NSMutableArray<MCBaseDataModel *> *)items {
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}
@end
