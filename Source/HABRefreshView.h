//
//  HABRefreshView.h
//  HaidoraPullToRefresh
//
//  Created by DaiLingchi on 14-7-25.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const CGFloat HABRefreshViewHeight;

typedef NS_ENUM(NSInteger, HABRefreshState)
{
    HABRefreshStateNormal=1,
    HABRefreshStatePulling,
    HABRefreshStateRefreshing,
    HABRefreshStateAll
};

typedef NS_ENUM(NSInteger, HABPullToRefreshPosition)
{
    HABPullToRefreshPositionHeader = 1,
    HABPullToRefreshPositionFooter
};

/**
 *  HABRefreshView
 */
@interface HABRefreshView : UIView

//uiview
@property (nonatomic, weak  ) UIScrollView *scrollView;
@property (nonatomic, strong, readonly) UILabel *titleLable;
@property (nonatomic, strong, readonly) UILabel *subTitleLable;
@property (nonatomic, strong, readonly) UIImageView *arrowImage;
@property (nonatomic, strong, readonly) UIActivityIndicatorView *activityView;

//config
@property (nonatomic, assign, readonly) UIEdgeInsets scrollViewEdgeInsets;
@property (nonatomic, assign, readonly) HABPullToRefreshPosition postion;

@property (nonatomic, assign) HABRefreshState state;
@property (nonatomic, assign) BOOL isObserving;
//call back
@property (nonatomic, copy  ) void(^beginRefreshingCallBack)();

-(id)initWithFrame:(CGRect)frame position:(HABPullToRefreshPosition)position;
//event
-(void)beginRefreshing;
-(void)endRefreshing;

//state set
-(void)resetRefreshing;
-(void)allRefreshing;

@end

/**
 *  HABRefreshHeaderView
 */
@interface HABRefreshHeaderView : HABRefreshView


@end

/**
 *  HABRefreshFooterView
 */
@interface HABRefreshFooterView : HABRefreshView

@end