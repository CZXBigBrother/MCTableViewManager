//
//  CTableViewCell.h
//  MCTableViewManagerExample
//
//  Created by marco chen on 2018/8/2.
//  Copyright © 2018年 marco chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTableViewCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (void)setdata:(NSDictionary *)data;
@end
