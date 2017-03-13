//
//  XTNavigationController.m
//  XTLiveTV
//
//  Created by victor on 17/3/3.
//  Copyright © 2017年 victor. All rights reserved.
//

#import "XTNavigationController.h"

@interface XTNavigationController ()

@end

@implementation XTNavigationController

+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navBar_bg_414x70"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置文字颜色为白色
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    // 设置渲染的颜色
    [bar setTintColor:[UIColor whiteColor]];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    if (self.childViewControllers.count > 0) { //隐藏导航栏
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
