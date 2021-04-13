//
//  UIScrollViewNormalViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/13.
//

#import "UIScrollViewNormalViewController.h"

@interface UIScrollViewNormalViewController () <UIScrollViewDelegate>

@end

@implementation UIScrollViewNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 100, 240, 360)];
    scrollView.bounces = YES;
//    scrollView.alwaysBounceHorizontal = YES;
//    scrollView.alwaysBounceVertical = NO;
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    scrollView.contentSize = CGSizeMake(480, 720);
    scrollView.contentOffset = CGPointMake(120, 180);
    scrollView.scrollsToTop = YES;
//    scrollView.scrollEnabled = NO;
    scrollView.delegate = self;
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 480, 720)];
    imageView.image = [UIImage imageNamed:@"bg"];
    [scrollView addSubview:imageView];
    
    [self.view addSubview: scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"scrollViewDidScroll");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"scrollViewWillEndDragging");
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"scrollViewDidEndDragging");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDecelerating");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndDecelerating");
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndScrollingAnimation");
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    NSLog(@"scrollViewShouldScrollToTop");
    return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScrollToTop");
}

@end
