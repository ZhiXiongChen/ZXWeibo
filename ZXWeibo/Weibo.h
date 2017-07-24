//
//  Weibo.h
//  ZXWeibo
//
//  Created by zhixiongchen on 2017/7/23.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weibo : NSObject
@property (nonatomic ,copy)NSString * text;
@property (nonatomic ,copy)NSString * icon;
@property (nonatomic ,copy)NSString * picture;
@property (nonatomic ,copy)NSString * name;
@property (nonatomic ,assign)BOOL  vip;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)weiboWithDict:(NSDictionary *)dict;
@end
