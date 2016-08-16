//
//  yxdHeaderView.m
//  要出发
//
//  Created by tarena002 on 16/8/15.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "yxdHeaderView.h"

@implementation yxdHeaderView


#pragma 初始化
- (void)setFrame:(CGRect)frame{
    //防止别人手动修改frame
    CGFloat width = frame.size.width;
    CGFloat height = width * 338 / 720;
    super.frame = CGRectMake(0, 0, width, height);
}

- (instancetype)initWithFrame:(CGRect)frame
{
    CGFloat width = frame.size.width;
    CGFloat height = width * 338 / 720;
    self = [super initWithFrame:CGRectMake(0, 0, width, height)];
    if (self)
    {
        [self ic];
        [self pageC];
        //先后顺序必须是先设置时间, 再设置自动滚动
        _duration = 2.0;
        //此处一定是点方法, 否则不会调用timer的初始化
        self.autoScroll = YES;
    }
    return self;
}

#pragma icDelegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    if ([_dataSource respondsToSelector:@selector(numberOfItemToScollor:)])
    {
        return [_dataSource numberOfItemToScollor:self];
    }
    return 0;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view)
    {
        view = [[UIImageView alloc]initWithFrame:carousel.bounds];
        view.contentMode = UIViewContentModeScaleAspectFill;
        view.clipsToBounds = YES;
    }
    if ([_dataSource respondsToSelector:@selector(HeaderView:iconURLForIndex:)])
    {
        NSURL *iconURL = [_dataSource HeaderView:self iconURLForIndex:index];
        [((UIImageView*)view) setImageURL:iconURL];
    }
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    if ([_delegate respondsToSelector:@selector(HeaderView:didSelecteForIndex:)])
    {
        [_delegate HeaderView:self didSelecteForIndex:index];
    }
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap)
    {
        value = YES;
    }
    return value;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    self.pageC.currentPage = carousel.currentItemIndex;
}

- (void)reloadData
{
    [self.ic reloadData];
    if ([_dataSource respondsToSelector:@selector(numberOfItemToScollor:)])
    {
        self.pageC.numberOfPages = [_dataSource numberOfItemToScollor:self];
    }
    self.pageC.currentPage = _ic.currentItemIndex;
}

#pragma 懒加载
- (iCarousel *)ic {
    if(_ic == nil) {
        _ic = [[iCarousel alloc] init];
        [self addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
    }
    return _ic;
}

- (UIPageControl *)pageC {
    if(_pageC == nil) {
        _pageC = [[UIPageControl alloc] init];
        [self addSubview:_pageC];
        [_pageC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.bottom.equalTo(-5);
        }];
    }
    return _pageC;
}

- (void)setDuration:(NSTimeInterval)duration{
    _duration = duration;
    //判断当前是否是自动滚动状态. 只有是, 才滚动
    self.autoScroll = _autoScroll;
}

- (void)setAutoScroll:(BOOL)autoScroll{
    _autoScroll = autoScroll;
    //让之前的timer也失效
    [_timer invalidate]; //失效, 停止
    _timer = nil;
    
    if (autoScroll) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:_duration block:^(NSTimer *timer) {
            [self.ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
        } repeats:YES];
    }
}
@end
