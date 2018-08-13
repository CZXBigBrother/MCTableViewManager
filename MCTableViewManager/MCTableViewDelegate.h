//
//  MCTableViewDelegate.h
//  MCTableViewManagerExample
//
//  Created by marco chen on 2018/8/3.
//  Copyright © 2018年 marco chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MCTableViewDelegate : NSObject
@property (weak, nonatomic) id<UITableViewDelegate,UITableViewDataSource> MCDelegate;

- (void)updateDatas:(NSArray *)arr;
- (void)addObjectsDatas:(NSArray *)arr;
@end
