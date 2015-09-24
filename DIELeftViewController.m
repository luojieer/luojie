//
//  DIELeftViewController.m
//  布丁动画Demo
//
//  Created by apple on 15/9/21.
//  Copyright © 2015年 divein.org. All rights reserved.
//
#import "DIELeftViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "LeftCustomCell.h"
#import "LeftSetting.h"
#import "Masonry.h"
#import "LeftUserInfoView.h"
#import "LUOTitieViewButton.h"


@interface DIELeftViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_leftImageArray;
    NSArray *_leftTitleArray;
    UIButton *_setButton;
    UIButton *_notificationButton;
}

@end


@implementation DIELeftViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self didClicked];
    
    _leftImageArray = @[@"side_menu_icon_history",@"side_menu_icon_cache",@"side_menu_icon_statistics",@"side_menu_icon_promotor"];
    _leftTitleArray = @[@"追番纪录",@"离线缓存",@"布丁统计",@"布丁娘送周边"];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"side_menu_bg.jpg"]];
    
    //dataSource , delegate
    [tableView registerClass:[LeftCustomCell class] forCellReuseIdentifier:@"Leftcell"];
    
    //设置uitableView的头部
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 240)];
    tableView.tableHeaderView = headerView;
    
    //头部用户
    LeftUserInfoView *headerV = [[LeftUserInfoView alloc]initWithFrame:CGRectMake(0, 0, 320, 210)];
    headerV.followerCount = 11;
    headerV.fansCount = 22;
    headerV.isLogin = YES;
    tableView.tableHeaderView = headerV;
    [headerV addAvatarTarget:self action:@selector(userInfoAvatarClicked:) forControlEvents:UIControlEventTouchUpInside];
    [headerV addFollowerTarget:self action:@selector(userInfoFollowerClicked:) forControlEvents:UIControlEventTouchUpInside];
    [headerV addFansTarget:self action:@selector(userInfoFansClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    LeftSetting *leftSetting = [[LeftSetting alloc]initWithFrame:CGRectMake(100, 400, 100, 100)];
    [self.view addSubview:leftSetting];
   
    //消除尾部多余的分割线
    tableView.tableFooterView = [UIView new];
    
    [self.view addSubview:tableView];
//    _setButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 650, 100, 40)];
//    [_setButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [_setButton setTitle:@"设置" forState:UIControlStateNormal];
//    [_setButton setImage:[UIImage imageNamed: @"side_menu_icon_setting~iphone.png"] forState:UIControlStateNormal];
//    [_setButton addTarget:self action:@selector(settingButtonController:) forControlEvents:UIControlEventTouchUpInside                                     ];
//    [self.view addSubview:_setButton];
//    
//    _notificationButton = [[UIButton alloc]initWithFrame:CGRectMake(150, 650, 100, 40)];
//    [_notificationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [_notificationButton setTitle:@"通知" forState:UIControlStateNormal];
//    [_notificationButton setImage:[UIImage imageNamed: @"side_menu_icon_notification~iphone.png"] forState:UIControlStateNormal];
//    [_notificationButton addTarget:self action:@selector(notificationButtonController:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_notificationButton];
    

}
-(void)didClicked{
    if (self.mm_drawerController.openSide == MMDrawerSideLeft)
    {
        //如果是打开的，则关上
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
    }else
    {
        [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma dataSource2
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_leftTitleArray count];
}

#pragma dataSource3
// 创建UITableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftCustomCell *customCell = nil;
    customCell = [tableView dequeueReusableCellWithIdentifier:@"Leftcell" forIndexPath:indexPath];
    customCell.titleLabel.text = _leftTitleArray[indexPath.row];
    UIImage *img = [UIImage imageNamed:_leftImageArray[indexPath.row]];
    customCell.iconImageView.image = img;

    return customCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

#pragma 触摸事件(头像。关注。fens)
-(void)userInfoAvatarClicked:(id)sender{
    NSLog(@"%s,%@",__PRETTY_FUNCTION__,sender);
}
-(void)userInfoFollowerClicked:(id)sender{
    NSLog(@"%s,%@",__PRETTY_FUNCTION__,sender);
}
-(void)userInfoFansClicked:(id)sender{
    NSLog(@"%s,%@",__PRETTY_FUNCTION__,sender);
}


#pragma 设置和通知的触摸事件
//-(void)settingButtonController:(id)sender{
//    NSLog(@"＋＋＋＋＋＋＋＋%s,%@",__PRETTY_FUNCTION__,sender);
//}
//-(void)notificationButtonController:(id)sender{
//    NSLog(@"＋＋＋＋＋＋＋＋%s,%@",__PRETTY_FUNCTION__,sender);
//    
//}
//

@end






















