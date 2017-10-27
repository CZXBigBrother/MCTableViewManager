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
@property (strong, nonatomic) NSMutableArray *GlobalData;

- (instancetype)MC_cellForRowAtIndexPath:(NSIndexPath *)indexPath withTarget:(id)target;

- (CGFloat)MC_cellheightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)MC_didSelectRowAtIndexPath:(NSIndexPath *)indexPath withTarget:(id)target;

- (NSInteger)MC_numberOfSectionsInTableView;
- (NSInteger)MC_numberOfRowsInSection:(NSInteger)section;
//- (id)productFunc:(id)params withTarget:(id)sender withSelector:(SEL)selector;
@end
