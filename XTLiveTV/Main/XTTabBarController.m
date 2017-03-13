//
//  XTTabBarController.m
//  XTLiveTV
//
//  Created by victor on 17/3/3.
//  Copyright © 2017年 victor. All rights reserved.
//

#import "XTTabBarController.h"
#import "XTNavigationController.h"
#import "XTHomeController.h"
#import "XTLiveController.h"
#import "XTRecordController.h"
#import "XTShowTimeController.h"
#import "XTProfileController.h"
#import "XTTabBar.h"

#define TabBarTintColor XTColor(244, 89, 27)

@interface XTTabBarController ()

@end

@implementation XTTabBarController



+ (void)initialize {
    [UITabBar appearance].tintColor = TabBarTintColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化子控制器
    [self setupChildViewControllers];
    
    self.selectedIndex = 0;
}

- (void)setupChildViewControllers {
    // 首页
    XTHomeController *homeVc = [[XTHomeController alloc] init];
    [self addChildVcWithVc:homeVc title:@"首页" imageName:@"btn_home_normal_24x24_" selImageName:@"btn_home_selected_24x24_"];
    
    // 直播
    XTLiveController *liveVc = [[XTLiveController alloc] init];
    [self addChildVcWithVc:liveVc title:@"直播" imageName:@"btn_column_normal_24x24_" selImageName:@"btn_column_selected_24x24_"];
    
    // 录播
    XTRecordController *foucsVc = [[XTRecordController alloc] init];
    [self addChildVcWithVc:foucsVc title:nil imageName:@"toolbar_live" selImageName:@"toolbar_live"];
    
    // 秀场
    XTShowTimeController *showTimeVc = [[XTShowTimeController alloc] init];
    [self addChildVcWithVc:showTimeVc title:@"秀场" imageName:@"btn_live_normal_30x24_" selImageName:@"btn_live_normal_30x24_"];
    
    // 我的
    XTProfileController *profileVc = [[XTProfileController alloc] init];
    [self addChildVcWithVc:profileVc title:@"我的" imageName:@"btn_user_normal_24x24_" selImageName:@"btn_user_selected_24x24_"];
}

- (void)addChildVcWithVc:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selImageName:(NSString *)selImageName {
    if (title) {
        [vc.tabBarItem setTitle:title];
    } else {
        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    }
    
    [vc.tabBarItem setImage:[UIImage imageNamed:imageName]];
    [vc.tabBarItem setSelectedImage:[UIImage imageNamed:selImageName]];
    
//    vc.title = title;
    XTNavigationController *nav = [[XTNavigationController alloc]
                                   initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
