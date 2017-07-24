//
//  WeiboFrame.h
//  ZXWeibo
//
//  Created by zhixiongchen on 2017/7/23.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#define nameFont [UIFont systemFontOfSize:12]
#define textFont [UIFont systemFontOfSize:14]
@class Weibo;
//我们希望在懒加载的时候就能求出行高和控件的frame所以我们要新建一个模型
@interface WeiboFrame : NSObject
@property(nonatomic,strong)Weibo * weibo;
//加readonly的作用就是防止外界进行修改
@property(nonatomic,assign,readonly)CGRect iconFrame;
@property(nonatomic,assign,readonly)CGRect nameFrame;
@property(nonatomic,assign,readonly)CGRect vipFrame;
@property(nonatomic,assign,readonly)CGRect textFrame;
@property(nonatomic,assign,readonly)CGRect pictureFrame;
@property(nonatomic,assign,readonly)CGFloat rowHeight;
@end
