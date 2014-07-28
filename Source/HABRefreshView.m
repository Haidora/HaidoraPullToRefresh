//
//  HABRefreshView.m
//  HaidoraPullToRefresh
//
//  Created by DaiLingchi on 14-7-25.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "HABRefreshView.h"
#import "UIScrollView+HABPullToRefresh.h"

const CGFloat HABRefreshViewHeight = 60.0;

@interface UIView (Extension)

@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGPoint origin;

@end

@implementation UIView (Extension)
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}
@end

@interface UIScrollView (Extension)

@property (assign, nonatomic) CGFloat contentInsetTop;
@property (assign, nonatomic) CGFloat contentInsetBottom;
@property (assign, nonatomic) CGFloat contentInsetLeft;
@property (assign, nonatomic) CGFloat contentInsetRight;

@property (assign, nonatomic) CGFloat contentOffsetX;
@property (assign, nonatomic) CGFloat contentOffsetY;

@property (assign, nonatomic) CGFloat contentSizeWidth;
@property (assign, nonatomic) CGFloat contentSizeHeight;

@end

@implementation UIScrollView (Extension)

- (void)setContentInsetTop:(CGFloat)contentInsetTop
{
    UIEdgeInsets inset = self.contentInset;
    inset.top = contentInsetTop;
    self.contentInset = inset;
}

- (CGFloat)contentInsetTop
{
    return self.contentInset.top;
}

- (void)setContentInsetBottom:(CGFloat)contentInsetBottom
{
    UIEdgeInsets inset = self.contentInset;
    inset.bottom = contentInsetBottom;
    self.contentInset = inset;
}

- (CGFloat)contentInsetBottom
{
    return self.contentInset.bottom;
}

- (void)setContentInsetLeft:(CGFloat)contentInsetLeft
{
    UIEdgeInsets inset = self.contentInset;
    inset.left = contentInsetLeft;
    self.contentInset = inset;
}

- (CGFloat)contentInsetLeft
{
    return self.contentInset.left;
}

- (void)setContentInsetRight:(CGFloat)contentInsetRight
{
    UIEdgeInsets inset = self.contentInset;
    inset.right = contentInsetRight;
    self.contentInset = inset;
}

- (CGFloat)contentInsetRight
{
    return self.contentInset.right;
}

- (void)setContentOffsetX:(CGFloat)contentOffsetX
{
    CGPoint offset = self.contentOffset;
    offset.x = contentOffsetX;
    self.contentOffset = offset;
}

- (CGFloat)contentOffsetX
{
    return self.contentOffset.x;
}

- (void)setContentOffsetY:(CGFloat)contentOffsetY
{
    CGPoint offset = self.contentOffset;
    offset.y = contentOffsetY;
    self.contentOffset = offset;
}

- (CGFloat)contentOffsetY
{
    return self.contentOffset.y;
}

- (void)setContentSizeWidth:(CGFloat)contentSizeWidth
{
    CGSize size = self.contentSize;
    size.width = contentSizeWidth;
    self.contentSize = size;
}

- (CGFloat)contentSizeWidth
{
    return self.contentSize.width;
}

- (void)setContentSizeHeight:(CGFloat)contentSizeHeight
{
    CGSize size = self.contentSize;
    size.height = contentSizeHeight;
    self.contentSize = size;
}

- (CGFloat)contentSizeHeight
{
    return self.contentSize.height;
}

@end


@interface HABRefreshView ()

//uiview
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *subTitleLable;
@property (nonatomic, strong) UIImageView *arrowImage;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;

//config
@property (nonatomic, assign) UIEdgeInsets scrollViewEdgeInsets;
@property (nonatomic, assign) HABPullToRefreshPosition postion;

@end

@implementation HABRefreshView

- (id)initWithFrame:(CGRect)frame position:(HABPullToRefreshPosition)position
{
    self = [self initWithFrame:frame];
    self.postion = position;
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //default set
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat arrowX = self.width*0.5-100;
    CGFloat arrowY = self.height*0.5;
    self.arrowImage.center = CGPointMake(arrowX, arrowY);
    self.activityView.center = self.arrowImage.center;
}

#pragma mark
#pragma mark Getter

-(UILabel *)titleLable
{
    if (!_titleLable)
    {
        _titleLable = [[UILabel alloc]init];
        _titleLable.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _titleLable.font = [UIFont boldSystemFontOfSize:14.0f];
        _titleLable.textColor = [UIColor darkGrayColor];
        _titleLable.backgroundColor = [UIColor clearColor];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLable];
    }
    return _titleLable;
}

-(UILabel *)subTitleLable
{
    if (!_subTitleLable)
    {
        _subTitleLable = [[UILabel alloc]init];
        _subTitleLable.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _subTitleLable.font = [UIFont boldSystemFontOfSize:12.0f];
        _subTitleLable.textColor = [UIColor darkGrayColor];
        _subTitleLable.backgroundColor = [UIColor clearColor];
        _subTitleLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_subTitleLable];
    }
    return _subTitleLable;
}

-(UIImageView *)arrowImage
{
    if (!_arrowImage)
    {
        _arrowImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"HaidoraPullToRefresh.bundle/arrow"]];
        _arrowImage.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [self addSubview:_arrowImage];
    }
    return _arrowImage;
}

-(UIActivityIndicatorView *)activityView
{
    if (!_activityView)
    {
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityView.bounds = self.arrowImage.bounds;
        _activityView.autoresizingMask = self.arrowImage.autoresizingMask;
        [self addSubview:_activityView];
    }
    return _activityView;
}

#pragma mark
#pragma mark Setter

-(void)setState:(HABRefreshState)state
{
    if (_state != HABRefreshStateRefreshing)
    {
        _scrollViewEdgeInsets = self.scrollView.contentInset;
    }
    if (_state == state)
    {
        return;
    }
    switch (state)
    {
        case HABRefreshStateNormal:
        case HABRefreshStatePulling:
        {
            self.arrowImage.hidden = NO;
            [self.activityView stopAnimating];
        }
            break;
        case HABRefreshStateRefreshing:
        {
            self.arrowImage.hidden = YES;
            [self.activityView startAnimating];
            if (self.beginRefreshingCallBack)
            {
                self.beginRefreshingCallBack();
            }
        }
            break;
        case HABRefreshStateAll:
        {
            self.arrowImage.hidden = YES;
            [self.activityView stopAnimating];
        }
            break;
        default:
            break;
    }
    _state = state;
}

#pragma mark
#pragma mark Public Method

-(void)beginRefreshing
{
    if (self.window)
    {
        self.state = HABRefreshStateRefreshing;
    }
    else
    {
        _state = HABRefreshStateRefreshing;
        [super setNeedsDisplay];
    }
}

-(void)endRefreshing
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.state = HABRefreshStateNormal;
    });
}

-(void)resetRefreshing
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.state = HABRefreshStateNormal;
    });
}

-(void)allRefreshing
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.state = HABRefreshStateAll;
    });
}

@end

#pragma mark
#pragma mark HABRefreshHeaderView

@interface HABRefreshHeaderView ()

@property (nonatomic, strong) NSDictionary *titleDic;
@property (nonatomic, strong) NSDate *lastUpdateDate;

@end

@implementation HABRefreshHeaderView

@synthesize lastUpdateDate = _lastUpdateDate;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.titleDic = [NSDictionary dictionaryWithObjectsAndKeys:
                         NSLocalizedString(@"Pull to refresh",),@(HABRefreshStateNormal),
                         NSLocalizedString(@"Release to refresh",),@(HABRefreshStatePulling),
                         NSLocalizedString(@"Loading",),@(HABRefreshStateRefreshing),
                         NSLocalizedString(@"Loading All",),@(HABRefreshStateAll), nil];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat statusX = 0;
    CGFloat statusY = 0;
    CGFloat statusWidth = self.width;
    CGFloat statusHeight = self.height * 0.5;
    self.titleLable.frame = CGRectMake(statusX, statusY, statusWidth, statusHeight);
    
    CGFloat lastUpdateY = statusHeight;
    CGFloat lastUpdateX = 0;
    CGFloat lastUpdateHeight = statusHeight;
    CGFloat lastUpdateWidth = statusWidth;
    self.subTitleLable.frame = CGRectMake(lastUpdateX, lastUpdateY, lastUpdateWidth, lastUpdateHeight);
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (!self.userInteractionEnabled || self.hidden)
    {
        return;
    }
    if (self.state == HABRefreshStateRefreshing)
    {
        return;
    }
    if ([keyPath isEqualToString:@"contentOffset"])
    {
        [self adjustStateWithContentOffset];
    }
}

#pragma mark
#pragma mark Getter/Setter

-(void)setLastUpdateDate:(NSDate *)lastUpdateDate
{
    _lastUpdateDate = lastUpdateDate;
    [[NSUserDefaults standardUserDefaults] setObject:_lastUpdateDate forKey:@"HABRefreshHeaderView"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSDate *)lastUpdateDate
{
    if (!_lastUpdateDate)
    {
        _lastUpdateDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"HABRefreshHeaderView"];
    }
    return _lastUpdateDate;
}

#pragma mark
#pragma mark Private method

-(void)updateTimeLabel
{
    if (!self.lastUpdateDate)
    {
        self.subTitleLable.text = NSLocalizedString(@"Never",@"");
        return;
    }

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit |NSHourCalendarUnit |NSMinuteCalendarUnit;
    NSDateComponents *cmp1 = [calendar components:unitFlags fromDate:_lastUpdateDate];
    NSDateComponents *cmp2 = [calendar components:unitFlags fromDate:[NSDate date]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if ([cmp1 day] == [cmp2 day])
    {
        formatter.dateFormat = NSLocalizedString(@"HH:mm",@"");
    } else if ([cmp1 year] == [cmp2 year])
    {
        formatter.dateFormat = NSLocalizedString(@"MM-dd HH:mm",@"");
    } else
    {
        formatter.dateFormat = NSLocalizedString(@"yyyy-MM-dd HH:mm",@"");
    }
    NSString *time = [formatter stringFromDate:[NSDate date]];
    
    self.subTitleLable.text = [NSString stringWithFormat:NSLocalizedString(@"Last Updated:%@",@""), time];
}

-(void)adjustStateWithContentOffset
{
    CGFloat curretnOffsetY = self.scrollView.contentOffsetY;
    CGFloat happenOffsetY = -self.scrollViewEdgeInsets.top;
    if (curretnOffsetY>=happenOffsetY)
    {
        return;
    }
    if (self.scrollView.isDragging)
    {
        CGFloat normal2PullingOffsetY = happenOffsetY - self.height;
        if (self.state == HABRefreshStateNormal && curretnOffsetY<normal2PullingOffsetY)
        {
            self.state = HABRefreshStatePulling;
        }
        else if (self.state == HABRefreshStatePulling && curretnOffsetY>=normal2PullingOffsetY)
        {
            self.state = HABRefreshStateNormal;
        }
    }
    else if (self.state == HABRefreshStatePulling)
    {
        self.state = HABRefreshStateRefreshing;
    }
}

-(void)setState:(HABRefreshState)state
{
    if (self.state == state)
    {
        return;
    }
    HABRefreshState oldState = self.state;
    [super setState:state];
    //title text
    self.titleLable.text = self.titleDic[@(state)];
    switch (state)
    {
        case HABRefreshStateNormal:
        {
            if (HABRefreshStateRefreshing == oldState)
            {
                self.lastUpdateDate = [NSDate date];
                self.arrowImage.transform = CGAffineTransformIdentity;
                [UIView animateWithDuration:0.3 animations:^{
                    self.scrollView.contentInsetTop = self.scrollViewEdgeInsets.top;
                }];
            }
            else
            {
                [UIView animateWithDuration:0.3 animations:^{
                    self.arrowImage.transform = CGAffineTransformIdentity;
                }];
            }
        }
            break;
        case HABRefreshStatePulling:
        {
            [UIView animateWithDuration:0.3 animations:^{
                self.arrowImage.transform = CGAffineTransformMakeRotation(M_PI);
            }];
        }
            break;
        case HABRefreshStateRefreshing:
        {
            [UIView animateWithDuration:0.3 animations:^{
                CGFloat top = self.scrollViewEdgeInsets.top + self.height;
                self.scrollView.contentInsetTop = top;
                self.scrollView.contentOffsetY = - top;
            }];

        }
            break;
            
        default:
            break;
    }
    [self updateTimeLabel];
}

@end

@interface HABRefreshFooterView ()

@property (nonatomic, strong) NSDictionary *titleDic;
@property (nonatomic,assign) NSInteger lastRefreshCount;

@end


@implementation HABRefreshFooterView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.titleDic = [NSDictionary dictionaryWithObjectsAndKeys:
                         NSLocalizedString(@"Pull to Load More",),@(HABRefreshStateNormal),
                         NSLocalizedString(@"Release to Load More",),@(HABRefreshStatePulling),
                         NSLocalizedString(@"Loading",),@(HABRefreshStateRefreshing),
                         NSLocalizedString(@"Loading All",),@(HABRefreshStateAll), nil];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLable.frame = self.bounds;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (!self.userInteractionEnabled || self.hidden)
    {
        return;
    }
    if (self.state == HABRefreshStateRefreshing)
    {
        return;
    }
    if ([keyPath isEqualToString:@"contentSize"])
    {
        [self adjustStateWithContentOffset];
    }
    else if([keyPath isEqualToString:@"contentOffset"])
    {
        [self adjustStateWithContentOffset];
    }
}

- (void)adjustFrameWithContentSize
{
    CGFloat contentHeight = self.scrollView.contentSizeHeight;
    CGFloat scrollHeight = self.scrollView.height - self.scrollViewEdgeInsets.top - self.scrollViewEdgeInsets.bottom;
    self.y = MAX(contentHeight, scrollHeight);
}

-(void)adjustStateWithContentOffset
{
    CGFloat currentOffsetY = self.scrollView.contentOffsetY;
    CGFloat happenOffsetY = [self happenOffsetY];
    
    if (currentOffsetY <= happenOffsetY) return;
    
    if (self.scrollView.isDragging)
    {
        CGFloat normal2pullingOffsetY = happenOffsetY + self.height;
        
        if (self.state == HABRefreshStateNormal && currentOffsetY > normal2pullingOffsetY)
        {
            self.state = HABRefreshStatePulling;
        } else if (self.state == HABRefreshStatePulling && currentOffsetY <= normal2pullingOffsetY)
        {
            self.state = HABRefreshStateNormal;
        }
    } else if (self.state == HABRefreshStatePulling)
    {
        self.state = HABRefreshStateRefreshing;
    }
}

- (void)setState:(HABRefreshState)state
{
    if (self.state == state)
    {
        return;
    }
    HABRefreshState oldState = self.state;
    [super setState:state];
    //title text
    self.titleLable.text = self.titleDic[@(state)];
	switch (state)
    {
		case HABRefreshStateNormal:
        {
            if (HABRefreshStateRefreshing == oldState)
            {
                self.arrowImage.transform = CGAffineTransformMakeRotation(M_PI);
                [UIView animateWithDuration:0.3 animations:^{
                    self.scrollView.contentInsetBottom = self.scrollViewEdgeInsets.bottom;
                }];
            } else
            {
                [UIView animateWithDuration:0.3 animations:^{
                    self.arrowImage.transform = CGAffineTransformMakeRotation(M_PI);
                }];
            }
            CGFloat deltaH = [self heightForContentBreakView];
            int currentCount = [self totalDataCountInScrollView];
            if (HABRefreshStateRefreshing == oldState && deltaH > 0 && currentCount != self.lastRefreshCount)
            {
                self.scrollView.contentOffsetY = self.scrollView.contentOffsetY;
            }
			break;
        }
            
		case HABRefreshStatePulling:
        {
            [UIView animateWithDuration:0.3 animations:^{
                self.arrowImage.transform = CGAffineTransformIdentity;
            }];
			break;
        }
            
        case HABRefreshStateRefreshing:
        {
            self.lastRefreshCount = [self totalDataCountInScrollView];
            
            [UIView animateWithDuration:0.3 animations:^{
                CGFloat bottom = self.height + self.scrollViewEdgeInsets.bottom;
                CGFloat deltaH = [self heightForContentBreakView];
                if (deltaH < 0)
                {
                    bottom -= deltaH;
                }
                self.scrollView.contentInsetBottom = bottom;
            }];
			break;
        }
            
        default:
            break;
	}
}

- (int)totalDataCountInScrollView
{
    int totalCount = 0;
    if ([self.scrollView isKindOfClass:[UITableView class]])
    {
        UITableView *tableView = (UITableView *)self.scrollView;
        
        for (int section = 0; section<tableView.numberOfSections; section++)
        {
            totalCount += [tableView numberOfRowsInSection:section];
        }
    } else if ([self.scrollView isKindOfClass:[UICollectionView class]])
    {
        UICollectionView *collectionView = (UICollectionView *)self.scrollView;
        
        for (int section = 0; section<collectionView.numberOfSections; section++)
        {
            totalCount += [collectionView numberOfItemsInSection:section];
        }
    }
    return totalCount;
}

- (CGFloat)heightForContentBreakView
{
    CGFloat h = self.scrollView.frame.size.height - self.scrollViewEdgeInsets.bottom - self.scrollViewEdgeInsets.top;
    return self.scrollView.contentSize.height - h;
}

- (CGFloat)happenOffsetY
{
    CGFloat deltaH = [self heightForContentBreakView];
    if (deltaH > 0) {
        return deltaH - self.scrollViewEdgeInsets.top;
    } else {
        return - self.scrollViewEdgeInsets.top;
    }
}


@end
