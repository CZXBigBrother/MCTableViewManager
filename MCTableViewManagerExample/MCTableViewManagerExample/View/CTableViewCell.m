//
//  CTableViewCell.m
//  MCTableViewManagerExample
//
//  Created by marco chen on 2018/8/2.
//  Copyright © 2018年 marco chen. All rights reserved.
//

#import "CTableViewCell.h"

@implementation CTableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"CTableViewCell";
    CTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[CTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setdata:(NSDictionary *)data {
    self.textLabel.text = [data valueForKey:@"testParam"];
    NSLog(@"setdata = %@",data);
}

@end
