//
//  XTTabBar.m
//  XTLiveTV
//
//  Created by victor on 17/3/3.
//  Copyright © 2017年 victor. All rights reserved.
//

#import "XTTabBar.h"

@interface XTTabBar()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation XTTabBar

- (UIButton *)btn{
    
    if (_btn==nil) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setImage:[UIImage imageNamed:@"toolbar_live"] forState:UIControlStateNormal];
        [_btn setBackgroundImage:[UIImage imageNamed:@"toolbar_live"] forState:UIControlStateNormal];
        //button的大小与图片一致
        [_btn sizeToFit];
        [self addSubview:self.btn];
    }
    return _btn;
    
}

- (void)layoutSubviews{
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    CGFloat btnx = 0;
    CGFloat btny = 0;
    //5.0是tabbar中的控件的数量
    CGFloat width = self.bounds.size.width/5.0;
    CGFloat height = self.bounds.size.height;
    
    int i=0;
    for (UIView *btn in self.subviews) {
        //判断是否是系统自带的UITabBarButton类型的控件
        if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i==2) {
                i=3;
            }
            
            btnx = i*width;
            btn.frame = CGRectMake(btnx, btny, width, height);
            
            i++;
        }
        
    }
    
    //设置自定义button的位置
    self.btn.center = CGPointMake(w*0.5, h*0.5);  
    
}

@end
