//
//  MCTableViewManager.m
//  MCTableView
//
//  Created by marco chen on 2017/10/25.
//  Copyright © 2017年 marco chen. All rights reserved.
//


#import "MCTableViewManager.h"
#import "MCBaseDataModel.h"
#import <stdio.h>
#import <objc/message.h>

static NSString * const kShireItemAction = @"MCItemAction";
static NSString * const kShireItemCell = @"MCItemCell";
static NSString * const kShireItemHeight = @"MCItemHeight";
static NSString * const kShireCellItemParam = @"MCItemCellParam";
static NSString * const kShireActionItemParam = @"MCItemActionParams";


@interface MCTableViewManager()
@property (strong, nonatomic) NSMutableArray *GlobalData;
@end

@implementation MCTableViewManager
#pragma mark - init
- (instancetype)initWithDatas:(NSMutableArray *)data {
    if (self == [super init]) {
        self.GlobalData = data;
    }
    return self;
}
- (void)updateDatas:(NSMutableArray *)data {
    self.GlobalData = data;
}

#pragma mark - cell
- (instancetype)MC_cellForRowAtIndexPath:(NSIndexPath *)indexPath withTarget:(id)target{
    MCBaseDataModel *item = self.GlobalData[indexPath.section][indexPath.row];    
    SEL getCellSelector = NSSelectorFromString([item valueForKeyPath:kShireItemCell]);
    return [self funcTarget:target withArgument:[item valueForKeyPath:kShireCellItemParam] withSelector:getCellSelector];
}
- (CGFloat)MC_cellheightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MCBaseDataModel *item = self.GlobalData[indexPath.section][indexPath.row];
    return [[item valueForKeyPath:kShireItemHeight] doubleValue];
}
- (void)MC_didSelectRowAtIndexPath:(NSIndexPath *)indexPath withTarget:(id)target {
    MCBaseDataModel *item = self.GlobalData[indexPath.section][indexPath.row];
    if ([[item valueForKeyPath:kShireItemAction] isEqual:[NSNull null]] || [item valueForKeyPath:kShireItemAction] == nil) {return;}
    SEL actionSelector = NSSelectorFromString([item valueForKeyPath:kShireItemAction]);
    if ([target respondsToSelector:actionSelector]) {
        [self productFuncTarget:target withArgumentsList:[item valueForKeyPath:kShireActionItemParam] withSelector:actionSelector];
    }else {
        NSAssert([target respondsToSelector:actionSelector], @"unrecognized selector crash %@",[item valueForKeyPath:kShireItemAction]);
    }
}
- (NSInteger)MC_numberOfSectionsInTableView {
    return [self.GlobalData count];
}
- (NSInteger)MC_numberOfRowsInSection:(NSInteger)section {
    return [self.GlobalData[section] count];
}
#pragma mark - lazy
- (NSMutableArray *)GlobalData {
    if(_GlobalData == nil) {
        _GlobalData = [NSMutableArray array];
    }
    return _GlobalData;
}
#pragma mark - runtime

/**
 创建一个存在返回的函数

 @param sender 实现函数的对象
 @param param 传入的参数
 @param selector SEL
 @return 执行之后返回的对象
 */
- (id)funcTarget:(id)sender withArgument:(id)param withSelector:(SEL)selector {
    id (*new_msgSend0)(id, SEL,...) = (id (*)(id, SEL,...)) objc_msgSend;
    id (*new_msgSend1)(id, SEL, id,...) = (id (*)(id, SEL, id,...)) objc_msgSend;
    return (param == nil || param == [NSNull null]) ? new_msgSend0(sender,selector) : new_msgSend1(sender,selector,param);
}
/**
 创建一个不存在返回值的函数
 
 @param sender 实现函数的对象
 @param params 传入的参数
 @param selector SEL
 */
- (void)productFuncTarget:(id)sender withArgumentsList:(id)params withSelector:(SEL)selector {
    NSMutableArray *argumentsList = [[NSMutableArray alloc] initWithArray:params];
    NSUInteger numberOfArguments = [argumentsList count];
    //PS:这段我就是抄JP的
    //https://gist.github.com/bang590/ca3720ae1da594252a2e
    void (*new_msgSend0)(id, SEL,...) = (void (*)(id, SEL,...)) objc_msgSend;
    void (*new_msgSend1)(id, SEL, id,...) = (void (*)(id, SEL, id,...)) objc_msgSend;
    void (*new_msgSend2)(id, SEL, id, id,...) = (void (*)(id, SEL, id, id,...)) objc_msgSend;
    void (*new_msgSend3)(id, SEL, id, id, id,...) = (void (*)(id, SEL, id, id, id,...)) objc_msgSend;
    void (*new_msgSend4)(id, SEL, id, id, id, id,...) = (void (*)(id, SEL, id, id, id, id,...)) objc_msgSend;
    void (*new_msgSend5)(id, SEL, id, id, id, id, id,...) = (void (*)(id, SEL, id, id, id, id, id,...)) objc_msgSend;
    void (*new_msgSend6)(id, SEL, id, id, id, id, id, id,...) = (void (*)(id, SEL, id, id, id, id, id, id,...)) objc_msgSend;
    void (*new_msgSend7)(id, SEL, id, id, id, id, id, id, id,...) = (void (*)(id, SEL, id, id, id, id, id, id,id,...)) objc_msgSend;
    void (*new_msgSend8)(id, SEL, id, id, id, id, id, id, id, id,...) = (void (*)(id, SEL, id, id, id, id, id, id, id, id,...)) objc_msgSend;
    void (*new_msgSend9)(id, SEL, id, id, id, id, id, id, id, id, id,...) = (void (*)(id, SEL, id, id, id, id, id, id, id, id, id, ...)) objc_msgSend;
    void (*new_msgSend10)(id, SEL, id, id, id, id, id, id, id, id, id, id,...) = (void (*)(id, SEL, id, id, id, id, id, id, id, id, id, id,...)) objc_msgSend;
    #define JP_G_ARG(idx) (argumentsList[idx])
    #define JP_CALL_MSGSEND_ARG0(_num) new_msgSend##_num(sender, selector);
    #define JP_CALL_MSGSEND_ARG1(_num) new_msgSend##_num(sender, selector, JP_G_ARG(0));
    #define JP_CALL_MSGSEND_ARG2(_num) new_msgSend##_num(sender, selector, JP_G_ARG(0), JP_G_ARG(1));
    #define JP_CALL_MSGSEND_ARG3(_num) new_msgSend##_num(sender, selector, JP_G_ARG(0), JP_G_ARG(1), JP_G_ARG(2));
    #define JP_CALL_MSGSEND_ARG4(_num) new_msgSend##_num(sender, selector, JP_G_ARG(0), JP_G_ARG(1), JP_G_ARG(2), JP_G_ARG(3));
    #define JP_CALL_MSGSEND_ARG5(_num) new_msgSend##_num(sender, selector, JP_G_ARG(0), JP_G_ARG(1), JP_G_ARG(2), JP_G_ARG(3), JP_G_ARG(4));
    #define JP_CALL_MSGSEND_ARG6(_num) new_msgSend##_num(sender, selector, JP_G_ARG(0), JP_G_ARG(1), JP_G_ARG(2), JP_G_ARG(3), JP_G_ARG(4), JP_G_ARG(5));
    #define JP_CALL_MSGSEND_ARG7(_num) new_msgSend##_num(sender, selector, JP_G_ARG(0), JP_G_ARG(1), JP_G_ARG(2), JP_G_ARG(3), JP_G_ARG(4), JP_G_ARG(5), JP_G_ARG(6));
    #define JP_CALL_MSGSEND_ARG8(_num) new_msgSend##_num(sender, selector, JP_G_ARG(0), JP_G_ARG(1), JP_G_ARG(2), JP_G_ARG(3), JP_G_ARG(4), JP_G_ARG(5), JP_G_ARG(6), JP_G_ARG(7));
    #define JP_CALL_MSGSEND_ARG9(_num) new_msgSend##_num(sender, selector, JP_G_ARG(0), JP_G_ARG(1), JP_G_ARG(2), JP_G_ARG(3), JP_G_ARG(4), JP_G_ARG(5), JP_G_ARG(6), JP_G_ARG(7), JP_G_ARG(8));
    #define JP_CALL_MSGSEND_ARG10(_num) new_msgSend##_num(sender, selector, JP_G_ARG(0), JP_G_ARG(1), JP_G_ARG(2), JP_G_ARG(3), JP_G_ARG(4), JP_G_ARG(5), JP_G_ARG(6), JP_G_ARG(7), JP_G_ARG(8), JP_G_ARG(9));
    #define JP_CALL_MSGSEND_ARG11(_num) new_msgSend##_num(sender, selector, JP_G_ARG(0), JP_G_ARG(1), JP_G_ARG(2), JP_G_ARG(3), JP_G_ARG(4), JP_G_ARG(5), JP_G_ARG(6), JP_G_ARG(7), JP_G_ARG(8), JP_G_ARG(9), JP_G_ARG(10));
    
    #define JP_IF_REAL_ARG_COUNT(_num) if([argumentsList count] == _num)
    #define JP_DEAL_MSGSEND(_realArgCount, _defineArgCount) \
    if(numberOfArguments == _defineArgCount) { \
    JP_CALL_MSGSEND_ARG##_realArgCount(_defineArgCount) \
    }
    JP_IF_REAL_ARG_COUNT(0) { JP_CALL_MSGSEND_ARG0(0) }
    JP_IF_REAL_ARG_COUNT(1) { JP_CALL_MSGSEND_ARG1(1) }
    JP_IF_REAL_ARG_COUNT(2) { JP_DEAL_MSGSEND(2, 1) JP_DEAL_MSGSEND(2, 2) }
    JP_IF_REAL_ARG_COUNT(3) { JP_DEAL_MSGSEND(3, 1) JP_DEAL_MSGSEND(3, 2) JP_DEAL_MSGSEND(3, 3) }
    JP_IF_REAL_ARG_COUNT(4) { JP_DEAL_MSGSEND(4, 1) JP_DEAL_MSGSEND(4, 2) JP_DEAL_MSGSEND(4, 3) JP_DEAL_MSGSEND(4, 4) }
    JP_IF_REAL_ARG_COUNT(5) { JP_DEAL_MSGSEND(5, 1) JP_DEAL_MSGSEND(5, 2) JP_DEAL_MSGSEND(5, 3) JP_DEAL_MSGSEND(5, 4) JP_DEAL_MSGSEND(5, 5) }
    JP_IF_REAL_ARG_COUNT(6) { JP_DEAL_MSGSEND(6, 1) JP_DEAL_MSGSEND(6, 2) JP_DEAL_MSGSEND(6, 3) JP_DEAL_MSGSEND(6, 4) JP_DEAL_MSGSEND(6, 5) JP_DEAL_MSGSEND(6, 6) }
    JP_IF_REAL_ARG_COUNT(7) { JP_DEAL_MSGSEND(7, 1) JP_DEAL_MSGSEND(7, 2) JP_DEAL_MSGSEND(7, 3) JP_DEAL_MSGSEND(7, 4) JP_DEAL_MSGSEND(7, 5) JP_DEAL_MSGSEND(7, 6) JP_DEAL_MSGSEND(7, 7) }
    JP_IF_REAL_ARG_COUNT(8) { JP_DEAL_MSGSEND(8, 1) JP_DEAL_MSGSEND(8, 2) JP_DEAL_MSGSEND(8, 3) JP_DEAL_MSGSEND(8, 4) JP_DEAL_MSGSEND(8, 5) JP_DEAL_MSGSEND(8, 6) JP_DEAL_MSGSEND(8, 7) JP_DEAL_MSGSEND(8, 8) }
    JP_IF_REAL_ARG_COUNT(9) { JP_DEAL_MSGSEND(9, 1) JP_DEAL_MSGSEND(9, 2) JP_DEAL_MSGSEND(9, 3) JP_DEAL_MSGSEND(9, 4) JP_DEAL_MSGSEND(9, 5) JP_DEAL_MSGSEND(9, 6) JP_DEAL_MSGSEND(9, 7) JP_DEAL_MSGSEND(9, 8) JP_DEAL_MSGSEND(9, 9) }
    JP_IF_REAL_ARG_COUNT(10) { JP_DEAL_MSGSEND(10, 1) JP_DEAL_MSGSEND(10, 2) JP_DEAL_MSGSEND(10, 3) JP_DEAL_MSGSEND(10, 4) JP_DEAL_MSGSEND(10, 5) JP_DEAL_MSGSEND(10, 6) JP_DEAL_MSGSEND(10, 7) JP_DEAL_MSGSEND(10, 8) JP_DEAL_MSGSEND(10, 9) JP_DEAL_MSGSEND(10, 10) }
}

@end
