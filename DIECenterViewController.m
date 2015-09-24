//
//  DIECenterViewController.m
//  布丁动画Demo
//
//  Created by apple on 15/9/21.
//  Copyright © 2015年 divein.org. All rights reserved.
//
#import "DIECenterViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "LUOTitieViewButton.h"
#import "WEIWaterView.h"

@interface DIECenterViewController ()
{
    UIButton *_goToButton;
    UIButton *_recommend;
    UIButton *_classification;
    UIButton *_searchButton;
}

@end


@implementation DIECenterViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    //头像
    UIImage *img = [[UIImage imageNamed:@"download_ep_cover~iphone.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _goToButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [_goToButton setBackgroundImage:img forState:UIControlStateNormal];
    [_goToButton addTarget:self action:@selector(toggleDrawSide:) forControlEvents:UIControlEventTouchUpInside];
    _goToButton.layer.cornerRadius = 40/2;
    _goToButton.layer.masksToBounds = YES;
    UIBarButtonItem *leftBarButtonItem1 = [[UIBarButtonItem alloc]initWithCustomView:_goToButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem1;
    
//    搜索
    UIImage *searchimg = [UIImage imageNamed:@"timeline_icon_search~iphone.png"];
    _searchButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [_searchButton setImage:searchimg forState:UIControlStateNormal];
    UIBarButtonItem *rightBarButtonItem1 = [[UIBarButtonItem alloc]initWithCustomView:_searchButton];
    [_searchButton addTarget:self action:@selector(searchButton:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem1;
    

//    中间栏button。推荐，分类
    LUOTitieViewButton *titleButton = [[LUOTitieViewButton alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    [titleButton addTarget:self action:@selector(titleButtonClicked:) forControlEvents:UIControlEventValueChanged];
    titleButton.titleArray = @[@"推荐",@"分类"];
    titleButton.selectIndex = 0;
    self.navigationItem.titleView = titleButton;
    
//    页面水滴
    WEIWaterView *waterView = [[WEIWaterView alloc]initWithFrame:CGRectMake(100, 100, 200, sqrt(3)*100+20)];
    waterView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:waterView];
}

- (void)titleButtonClicked:(LUOTitieViewButton *)sender{
    NSLog(@"index:%ld",sender.selectIndex);
}

- (void)toggleDrawSide:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}
-(void)recommendButton:(id)sender{
    NSLog(@"++++++++%@",sender);
}
-(void)classificationButton:(id)sender{
    NSLog(@"--------%@",sender);

}
-(void)searchButton:(id)sender{
    
}
@end
