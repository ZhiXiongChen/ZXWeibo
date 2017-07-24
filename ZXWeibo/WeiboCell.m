//
//  WeiboCell.m
//  ZXWeibo
//
//  Created by zhixiongchen on 2017/7/23.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "WeiboCell.h"
#import "Weibo.h"
#import "WeiboFrame.h"
#define nameFont [UIFont systemFontOfSize:12]
#define textFont [UIFont systemFontOfSize:14]
@interface WeiboCell()
@property (nonatomic,weak)UIImageView * iconView;
@property (nonatomic,weak) UILabel * labelName;
@property (nonatomic,weak)UIImageView * imageVip;
@property (nonatomic,weak) UILabel * labelText;
@property (nonatomic,weak) UIImageView * imagePicture;
@end
@implementation WeiboCell
+(instancetype)WeiboCellWithTableView:(UITableView *)tableView
{
    static NSString * ID=@"CellID";
    WeiboCell * cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell=[[WeiboCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
//重写cell中的initWithStyle的方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //创建子控件
        //头像
        UIImageView * iconView=[[UIImageView alloc]init];
        [self.contentView addSubview:iconView];
        self.iconView=iconView;
        //昵称
        UILabel * labelName=[[UILabel alloc]init];
        //要设置label的文字大小，下面计算的时候才能用12来计算
        labelName.font=nameFont;
        [self.contentView addSubview:labelName];
        self.labelName=labelName;
        //会员
        UIImageView * imageVip=[[UIImageView alloc]init];
        imageVip.image=[UIImage imageNamed:@"vip"];//会员头像设置一次就够了，所以在这里设置
        [self.contentView addSubview:imageVip];
        self.imageVip=imageVip;//只设置一次
        //正文
        UILabel * labelText=[[UILabel alloc]init];
        [self.contentView addSubview:labelText];
        self.labelText=labelText;
        self.labelText.font=textFont;
        self.labelText.numberOfLines=0;
        //配图
        UIImageView * imagePicture=[[UIImageView alloc]init];
        [self.contentView addSubview:imagePicture];
        self.imagePicture=imagePicture;
        
    }
    return self;
}
-(void)setWeiboFrames:(WeiboFrame *)weiboFrames
{
    _weiboFrames=weiboFrames;
    [self settingData];
    [self settingFrame];
}
//- (void)setWeibo:(Weibo *)weibo
//{
//    _weibo=weibo;
//    [self settingData];
//    [self settingFrame];
//}
//设置数据
- (void)settingData
{
    Weibo * model=self.weiboFrames.weibo;
    self.iconView.image=[UIImage imageNamed:model.icon];
    self.labelName.text=model.name;
    self.labelText.text=model.text;
    if(model.vip)
    {
        self.labelName.textColor=[UIColor redColor];
        self.imageVip.hidden=NO;
    }
    else
    {   self.labelName.textColor=[UIColor blackColor];
        self.imageVip.hidden=YES;
    }//两种情况都要判断因为在单元格重用的时候怕出错
    if(model.picture)
    {
    self.imagePicture.image=[UIImage imageNamed:model.picture];
        self.imageView.hidden=NO;
    }
    else
    {
        self.imagePicture.hidden=YES;
    }
}
//设置位置大小
- (void)settingFrame
{   //头像
    //CGFloat margin =10;
//    CGFloat iconW=32;
//    CGFloat iconH=32;
//    CGFloat iconX=margin;
//    CGFloat iconY=margin;
//    self.iconView.frame=CGRectMake(iconX, iconY, iconW, iconH);
//    //昵称影响Label的高和宽的因素:字体大小，文字大小，高度取决于是否限制了宽度，有没有限制最大的宽度和高度，这里可以根据文字的内容来动态的计算label的宽和高
//    NSString * name=self.labelName.text;
//    CGFloat nameX=CGRectGetMaxX(self.iconView.frame)+margin;
//    //此处可以把字体大小抽象成一个宏，因为有两处地方都用到了
//    CGSize nameSize=[self sizeWithText:name andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) andFont:nameFont];
//    CGFloat nameW=nameSize.width;
//    CGFloat nameH=nameSize.height;
//    CGFloat nameY=iconY+(iconH-nameH)/2;
//    //vip的frame的设置
//    self.labelName.frame=CGRectMake(nameX, nameY, nameW, nameH);
//    CGFloat vipW=10;
//    CGFloat vipH=10;
//    CGFloat vipX=CGRectGetMaxX(self.labelName.frame);
//    CGFloat vipY=nameY;
//    self.imageVip.frame=CGRectMake(vipX, vipY, vipW, vipH);
//    //动态计算正文的宽和高
//    CGFloat textX=iconX;
//    CGFloat textY=CGRectGetMaxY(self.iconView.frame)+margin;
//    NSString * text=self.labelText.text;
//    CGSize textSize=[self sizeWithText:text andMaxSize:CGSizeMake(350, MAXFLOAT) andFont:textFont];
//    CGFloat textW=textSize.width;
//    CGFloat textH=textSize.height;
//    self.labelText.frame=CGRectMake(textX, textY, textW, textH);
//    //计算配图的位置
//    CGFloat pictureX=iconX;
//    CGFloat pictureY=CGRectGetMaxY(self.labelText.frame)+margin;
//    CGFloat pictureW=70;
//    CGFloat pictureH=70;
//    self.imagePicture.frame=CGRectMake(pictureX,pictureY, pictureW, pictureH);
//    if(self.weibo.picture)
//    {
//        CGFloat MaxH=CGRectGetMaxY(self.imagePicture.frame)+margin;
//    }
//    else
//    {
//        CGFloat MaxH=CGRectGetMaxY(self.labelText.frame)+margin;
//    }//此处如果要设置行高的话，就要在tableViewController中调用，但是tableViewController访问不到这里的数据，我们可能会想到用代理，但是设置行高的方法是先于cellForRowAtIndex调用的而我们如果想通过代理来进行的话是不行的因为settingFrame是在cell被调用时才被调用的
    self.iconView.frame=self.weiboFrames.iconFrame;
    self.labelName.frame=self.weiboFrames.nameFrame;
    self.labelText.frame=self.weiboFrames.textFrame;
    self.imageVip.frame=self.weiboFrames.vipFrame;
    self.imagePicture.frame=self.weiboFrames.pictureFrame;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
////利用给的字符串和宽高的限制和给定的字体来计算文本框的宽和高
//-(CGSize)sizeWithText:(NSString *)text andMaxSize:(CGSize)maxSize andFont:(UIFont *)font
//{
//    NSDictionary * dict=@{NSFontAttributeName:font};
//    CGSize size=[text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
//    return size;
//}
@end
