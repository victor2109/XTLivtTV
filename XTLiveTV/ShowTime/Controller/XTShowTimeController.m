//
//  XTShowTimeController.m
//  XTLiveTV
//
//  Created by victor on 17/3/3.
//  Copyright © 2017年 victor. All rights reserved.
//

#import "XTShowTimeController.h"
#import "XTSelectedView.h"
#import "XTHotViewController.h"
#import "XTNewStarViewController.h"
#import "XTCareViewController.h"

@interface XTShowTimeController () <UIScrollViewDelegate>

// 顶部选择视图
@property (nonatomic, strong) XTSelectedView *selectedView;

// UIScrollView
@property (nonatomic, strong) UIScrollView *scrollView;

// 热播
@property (nonatomic, strong) XTHotViewController *hotVc;

// 最新主播
@property (nonatomic, strong) XTNewStarViewController *newstarVc;

// 关注主播
@property (nonatomic, strong) XTCareViewController *careVc;

@end

@implementation XTShowTimeController

- (void)loadView
{
    UIScrollView *view = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.contentSize = CGSizeMake(XTScreenWidth * 3, 0);
    view.backgroundColor = [UIColor whiteColor];
    // 去掉滚动条
    view.showsVerticalScrollIndicator = NO;
    view.showsHorizontalScrollIndicator = NO;
    // 设置分页
    view.pagingEnabled = YES;
    // 设置代理
    view.delegate = self;
    // 去掉弹簧效果
    view.bounces = NO;
    
    CGFloat height = XTScreenHeight - 49;
    
    // 添加子视图
    XTHotViewController *hot = [[XTHotViewController alloc] init];
    hot.view.frame = [UIScreen mainScreen].bounds;
    hot.view.height = height;
    [self addChildViewController:hot];
    [view addSubview:hot.view];
    _hotVc = hot;
    
    
    XTNewStarViewController *newStar = [[XTNewStarViewController alloc] init];
    newStar.view.frame = [UIScreen mainScreen].bounds;
    newStar.view.x = XTScreenWidth;
    newStar.view.height = height;
    [self addChildViewController:newStar];
    [view addSubview:newStar.view];
    _newstarVc = newStar;
    
    XTCareViewController *care = [[XTCareViewController alloc] init];
    care.view.frame = [UIScreen mainScreen].bounds;
    care.view.x = XTScreenWidth * 2;
    care.view.height = height;
    [self addChildViewController:care];
    [view addSubview:care.view];
    _careVc = care;
    
    self.view = view;
    self.scrollView = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XTColor(223, 223, 223);
    
    [self setup];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!_selectedView) {
        [self setupTopMenu];
    }
}

- (void)setup
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search_15x14"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"head_crown_24x24"] style:UIBarButtonItemStyleDone target:self action:@selector(rankCrown)];
    [self setupTopMenu];
}

- (void)setupTopMenu {
    // 设置顶部选择视图
    XTSelectedView *selectedView = [[XTSelectedView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    selectedView.x = 45;
    selectedView.width = XTScreenWidth - 45 * 2;
    [selectedView setSelectedBlock:^(HomeType type) {
        [self.scrollView setContentOffset:CGPointMake(type * XTScreenWidth, 0) animated:YES];
    }];
    [self.navigationController.navigationBar addSubview:selectedView];
    _selectedView = selectedView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
