//
//  UIScrollView+HABPullToRefresh.m
//  HaidoraPullToRefresh
//
//  Created by DaiLingchi on 14-7-24.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "UIScrollView+HABPullToRefresh.h"
#import <objc/runtime.h>

#define kHABpullToRefreshView  @"kHABpullToRefreshView"
#define kHABinfiniteScrollingView @"kHABinfiniteScrollingView"

#pragma mark
#pragma mark UIScrollView (HABPullToRefresh)

@implementation UIScrollView (HABPullToRefresh)

@dynamic pullToRefreshView;
@dynamic showsPullToRefresh;

@dynamic infiniteScrollingView;
@dynamic showsInfiniteScrolling;

#pragma mark
#pragma mark Setter/Getter

-(void)setPullToRefreshView:(HABRefreshView *)pullToRefreshView
{
    objc_setAssociatedObject(self, kHABpullToRefreshView, pullToRefreshView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(HABRefreshView *)pullToRefreshView
{
    return objc_getAssociatedObject(self, kHABpullToRefreshView);
}

-(void)setShowsPullToRefresh:(BOOL)showsPullToRefresh
{
    self.pullToRefreshView.hidden = !showsPullToRefresh;
    if (!showsPullToRefresh)
    {
        if (self.pullToRefreshView.isObserving)
        {
            [self removeObserver:self.pullToRefreshView forKeyPath:@"contentOffset"];
            self.pullToRefreshView.isObserving = NO;
        }
    }
    else
    {
        if (!self.pullToRefreshView.isObserving)
        {
            [self addObserver:self.pullToRefreshView forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
            self.pullToRefreshView.isObserving = YES;
            self.pullToRefreshView.frame = CGRectMake(0, -HABRefreshViewHeight, self.bounds.size.width, HABRefreshViewHeight);
        }
    }
}

-(BOOL)showsPullToRefresh
{
    return !self.pullToRefreshView.hidden;
}

-(void)setInfiniteScrollingView:(HABRefreshView *)infiniteScrollingView
{
    objc_setAssociatedObject(self, kHABinfiniteScrollingView, infiniteScrollingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(HABRefreshView *)infiniteScrollingView
{
    return objc_getAssociatedObject(self, kHABinfiniteScrollingView);
}

-(void)setShowsInfiniteScrolling:(BOOL)showsInfiniteScrolling
{
    self.infiniteScrollingView.hidden = !showsInfiniteScrolling;
    if (!showsInfiniteScrolling)
    {
        if (self.infiniteScrollingView.isObserving)
        {
            [self removeObserver:self.infiniteScrollingView forKeyPath:@"contentOffset"];
            [self removeObserver:self.infiniteScrollingView forKeyPath:@"contentSize"];
            self.infiniteScrollingView.isObserving = NO;
        }
    }
    else
    {
        if (!self.infiniteScrollingView.isObserving)
        {
            [self addObserver:self.infiniteScrollingView forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
            [self addObserver:self.infiniteScrollingView forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
            self.infiniteScrollingView.isObserving = YES;
            self.infiniteScrollingView.frame = CGRectMake(0, MAX(self.contentSize.height, self.frame.size.height), self.infiniteScrollingView.bounds.size.width, HABRefreshViewHeight);
        }
    }

}

#pragma mark
#pragma mark Public Method

- (void)addPullToRefreshWithActionHandler:(void (^)(void))actionHandler
{
    if(!self.pullToRefreshView)
    {
        HABRefreshHeaderView *view = [[HABRefreshHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, HABRefreshViewHeight)
                                                                        position:HABPullToRefreshPositionHeader];
        view.scrollView = self;
        view.state = HABRefreshStateNormal;
        view.beginRefreshingCallBack = actionHandler;
        
        self.pullToRefreshView = view;
        self.showsPullToRefresh = YES;
        [self addSubview:view];
    }
}

- (void)addInfiniteScrollingWithActionHandler:(void (^)(void))actionHandler
{
    if (!self.infiniteScrollingView)
    {
        HABRefreshFooterView *view = [[HABRefreshFooterView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, HABRefreshViewHeight)
                                                                        position:HABPullToRefreshPositionFooter];
        view.scrollView = self;
        view.state = HABRefreshStateNormal;
        view.beginRefreshingCallBack = actionHandler;
        
        self.infiniteScrollingView = view;
        self.showsInfiniteScrolling = YES;
        [self addSubview:view];
    }
}

- (void)triggerPullToRefresh
{
    self.pullToRefreshView.state = HABRefreshStatePulling;
    [self.pullToRefreshView beginRefreshing];
}
- (void)triggerInfiniteScrolling
{
    self.infiniteScrollingView.state = HABRefreshStatePulling;
    [self.infiniteScrollingView beginRefreshing];
}

@end
