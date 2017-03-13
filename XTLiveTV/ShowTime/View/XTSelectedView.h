//
//  XTSelectedView.h
//  XTLiveTV
//
//  Created by victor on 17/3/3.
//  Copyright © 2017年 victor. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HomeType) {
    HomeTypeHot, // 热门
    HomeTypeNew, // 最新
    HomeTypeCare // 关注
};

typedef void(^selectedBlock)(HomeType type);

@interface XTSelectedView : UIView

// 选中了
@property (nonatomic, copy) selectedBlock selectedBlock;

// 下划线
@property (nonatomic, strong,readonly) UIView *underLine;

// 设置滑动选中的按钮
@property (nonatomic, assign) HomeType selectedType;

@end
