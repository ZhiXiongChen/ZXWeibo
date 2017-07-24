//
//  WeiboTableViewController.m
//  ZXWeibo
//
//  Created by zhixiongchen on 2017/7/23.
//  Copyright © 2017年 zhixiongchen. All rights reserved.
//

#import "WeiboTableViewController.h"
#import "Weibo.h"
#import "WeiboCell.h"
#import "WeiboFrame.h"
@interface WeiboTableViewController ()
//weiboFrames集合保存的有数据模型和frame数据和行高
@property (nonatomic,strong)NSArray * weiboFrames;
//@property (nonatomic,strong)NSArray * weibo;
@end

@implementation WeiboTableViewController
#pragma mark -懒加载
//-(NSArray *)weibos
//{
//    if(!_weibos)
//    {
//        NSString * path=[[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil];
//        NSArray * array=[NSArray arrayWithContentsOfFile:path];
//        NSMutableArray * arrayM=[NSMutableArray array];
//        for(NSDictionary * dict in array)
//        {
//            Weibo * model=[Weibo weiboWithDict:dict];
//            [arrayM addObject:model];
//        }
//        _weibos=arrayM;
//    }
//    return _weibos;
//}
-(NSArray *)weiboFrames
{
    if(!_weiboFrames)
    {
        NSString * path=[[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil];
        NSArray * array=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray * arrayM=[NSMutableArray array];
        for(NSDictionary * dict in array)
        {
            Weibo * model=[Weibo weiboWithDict:dict];
            WeiboFrame * weiboFrame=[[WeiboFrame alloc]init];
            weiboFrame.weibo=model;//在model传过去之后就可以得到数据计算frame和行高
            [arrayM addObject:weiboFrame];
        }
        _weiboFrames=arrayM;
    }
    return _weiboFrames;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.weiboFrames.count;

}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeiboFrame * model=self.weiboFrames[indexPath.row];
    WeiboCell * cell=[WeiboCell WeiboCellWithTableView:tableView];
    cell.weiboFrames=model;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeiboFrame * model=self.weiboFrames[indexPath.row];
    return model.rowHeight;
}


@end
