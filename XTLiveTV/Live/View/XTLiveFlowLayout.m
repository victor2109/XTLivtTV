//
//  XTLiveFlowLayout.m
//  XTLiveTV
//
//  Created by victor on 17/3/6.
//  Copyright © 2017年 victor. All rights reserved.
//

#import "XTLiveFlowLayout.h"

@implementation XTLiveFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

@end
