//
//  WeiboCell.h
//  ZXWeibo
//
//  Created by zhixiongchen on 2017/7/23.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WeiboFrame;
@interface WeiboCell : UITableViewCell
@property (nonatomic,strong)WeiboFrame * weiboFrames;
+(instancetype)WeiboCellWithTableView:(UITableView *)tableView;

@end
