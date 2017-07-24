//
//  WeiboFrame.m
//  ZXWeibo
//
//  Created by zhixiongchen on 2017/7/23.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "WeiboFrame.h"
#import <CoreGraphics/CoreGraphics.h>
#import "Weibo.h"
@implementation WeiboFrame
//重写weibo属性的set方法
-(void)setWeibo:(Weibo *)weibo
{
    _weibo=weibo;
    //头像
    CGFloat margin =10;
    CGFloat iconW=32;
    CGFloat iconH=32;
    CGFloat iconX=margin;
    CGFloat iconY=margin;
    _iconFrame=CGRectMake(iconX, iconY, iconW, iconH);
    //昵称影响Label的高和宽的因素:字体大小，文字大小，高度取决于是否限制了宽度，有没有限制最大的宽度和高度，这里可以根据文字的内容来动态的计算label的宽和高
    NSString * name=weibo.name;
    CGFloat nameX=CGRectGetMaxX(_iconFrame)+margin;
    //此处可以把字体大小抽象成一个宏，因为有两处地方都用到了
    CGSize nameSize=[self sizeWithText:name andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) andFont:nameFont];
    CGFloat nameW=nameSize.width;
    CGFloat nameH=nameSize.height;
    CGFloat nameY=iconY+(iconH-nameH)/2;
    //vip的frame的设置
    _nameFrame=CGRectMake(nameX, nameY, nameW, nameH);
    CGFloat vipW=11;
    CGFloat vipH=11;
    CGFloat vipX=CGRectGetMaxX(_nameFrame);
    CGFloat vipY=nameY;
    _vipFrame=CGRectMake(vipX, vipY, vipW, vipH);
    //动态计算正文的宽和高
    CGFloat textX=iconX;
    CGFloat textY=CGRectGetMaxY(_iconFrame)+margin;
    NSString * text=weibo.text;
    CGSize textSize=[self sizeWithText:text andMaxSize:CGSizeMake(350, MAXFLOAT) andFont:textFont];
    CGFloat textW=textSize.width;
    CGFloat textH=textSize.height;
    _textFrame=CGRectMake(textX, textY, textW, textH);
    //计算配图的位置
    CGFloat pictureX=iconX;
    CGFloat pictureY=CGRectGetMaxY(_textFrame)+margin;
    CGFloat pictureW=70;
    CGFloat pictureH=70;
    _pictureFrame=CGRectMake(pictureX,pictureY, pictureW, pictureH);
    
    if(self.weibo.picture)
    {
        _rowHeight=CGRectGetMaxY(_pictureFrame)+margin;
    }
    else
    {
        _rowHeight=CGRectGetMaxY(_textFrame)+margin;
    }//此处如果要设置行高的话，就要在tableViewController中调用，但是tableViewController访问不到这里的数据，我们可能会想到用代理，但是设置行高的方法是先于cellForRowAtIndex调用的而我们如果想通过代理来进行的话是不行的因为settingFrame是在cell被调用时才被调用的
}
//利用给的字符串和宽高的限制和给定的字体来计算文本框的宽和高
-(CGSize)sizeWithText:(NSString *)text andMaxSize:(CGSize)maxSize andFont:(UIFont *)font
{
    NSDictionary * dict=@{NSFontAttributeName:font};
    CGSize size=[text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

@end
