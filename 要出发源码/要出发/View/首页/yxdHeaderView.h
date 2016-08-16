//
//  yxdHeaderView.h
//  要出发
//
//  Created by tarena002 on 16/8/15.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class yxdHeaderView;
@protocol yxdHeaderViewDataSource <NSObject>
@required
- (NSInteger)numberOfItemToScollor:(yxdHeaderView*)view;
- (NSURL*)HeaderView:(yxdHeaderView*)view iconURLForIndex:(NSInteger)index;
@end

@protocol yxdHeaderViewDelegate <NSObject>
@optional
- (void)HeaderView:(yxdHeaderView*)view didSelecteForIndex:(NSInteger)index;
@end

@interface yxdHeaderView : UIView<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic) iCarousel *ic;
@property (nonatomic) UIPageControl *pageC;

@property (nonatomic) NSTimer *timer;
//默认为YES
@property (nonatomic) BOOL autoScroll;
//滚动的间隔时间, 默认2秒
@property (nonatomic) NSTimeInterval duration;

@property (nonatomic) id<yxdHeaderViewDataSource> dataSource;
@property (nonatomic) id<yxdHeaderViewDelegate> delegate;
//刷新页面
- (void)reloadData;
@end
