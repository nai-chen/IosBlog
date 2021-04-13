//
//  UIScrollViewZoomViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/13.
//

#import "UIScrollViewZoomViewController.h"

@interface UIScrollViewZoomViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView* imageView;
@end

@implementation UIScrollViewZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 100, 320, 480)];
    scrollView.minimumZoomScale = 1;
    scrollView.maximumZoomScale = 4;
    scrollView.zoomScale = 1;
    scrollView.bouncesZoom = NO;
    scrollView.delegate = self;
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.imageView.image = [UIImage imageNamed:@"bg"];
    [scrollView addSubview:self.imageView];
    
    [self.view addSubview: scrollView];
}


#pragma mark - UIScrollViewDelegate -
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidZoom");
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    NSLog(@"scrollViewWillBeginZooming");
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    NSLog(@"scrollViewDidEndZooming scale=%lf", scale);
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}


@end
