//
//  UIScrollView+HABPullToRefresh.h
//  HaidoraPullToRefresh
//
//  Created by DaiLingchi on 14-7-24.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HABRefreshView.h"

#pragma mark
#pragma mark UIScrollView (HABPullToRefresh)

@interface UIScrollView (HABPullToRefresh)

@property (nonatomic, strong, readonly) HABRefreshHeaderView *pullToRefreshView;
@property (nonatomic, assign) BOOL showsPullToRefresh;

@property (nonatomic, strong, readonly) HABRefreshFooterView *infiniteScrollingView;
@property (nonatomic, assign) BOOL showsInfiniteScrolling;

- (void)addPullToRefreshWithActionHandler:(void (^)(void))actionHandler;
- (void)addInfiniteScrollingWithActionHandler:(void (^)(void))actionHandler;

- (void)triggerPullToRefresh;
- (void)triggerInfiniteScrolling;

@end




