//
//  Weibo.m
//  ZXWeibo
//
//  Created by zhixiongchen on 2017/7/23.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "Weibo.h"

@implementation Weibo
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)weiboWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
