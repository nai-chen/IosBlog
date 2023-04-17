//
//  UKCustomTabViewController.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/11.
//

#import "UKCustomTabViewController.h"

#import "UKCustomTabItemView.h"

@interface UKCustomTabViewController () <UKTabViewDelegate, UIScrollViewDelegate>

@property(nonatomic, strong) UKTabView *tabView;
@property(nonatomic, strong) UIScrollView *scrollView;

@property(nonatomic, assign) BOOL dragging;

@end

@implementation UKCustomTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tabView];
    
    UKCustomTabItemView *tabItemView1 = [[UKCustomTabItemView alloc] init];
    [tabItemView1 setText:@"选项1"];
    [self.tabView addItemView:tabItemView1];
    
    UKCustomTabItemView *tabItemView2 = [[UKCustomTabItemView alloc] init];
    [tabItemView2 setText:@"选项2"];
    [self.tabView addItemView:tabItemView2];

    UKCustomTabItemView *tabItemView3 = [[UKCustomTabItemView alloc] init];
    [tabItemView3 setText:@"选项3"];
    [self.tabView addItemView:tabItemView3];

    [self.tabView setSelection:0];
    
    for (int index = 1; index <=3; index++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(320 * (index - 1), 0, 320, 150)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"switcher%d", index]];
        [self.scrollView addSubview:imageView];
    }
    
    [self.view addSubview: self.scrollView];
}

- (UKTabView *)tabView {
    if (!_tabView) {
        _tabView = [[UKTabView alloc] initWithFrame:CGRectMake(10, 100, 320, 50)];
        [_tabView setIndicatorWidth:60 height:2 radius:1 color:[UIColor blueColor]];
        
        _tabView.delegate = self;
    }
    return _tabView;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 170, 320, 150)];
        _scrollView.contentSize = CGSizeMake(320*3, 150);
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        _scrollView.delegate = self;
    }
    return _scrollView;
}

#pragma mark - UKTabViewDelegate -
- (void)onTabViewSelected:(UKTabView *)tabView position:(NSInteger)position {
    [self.scrollView setContentOffset:CGPointMake(320 * position, 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate -
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scroll will begin dragging");
    self.dragging = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.dragging) {
        CGFloat width = scrollView.contentOffset.x;
        NSInteger page = width/320 + 0.5;
        NSLog(@"page scrollViewDidScroll = %ld %f", page, width/320 - page);

        [self.tabView setSelection:page offsetRatio:(width/320 - page)];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat width = scrollView.contentOffset.x;
    NSInteger page = width/320 + 0.5;
    NSLog(@"page Decelerate = %ld %f", page, width/320 - page);

    [self.tabView setSelection:page];
    self.dragging = NO;
}

@end
