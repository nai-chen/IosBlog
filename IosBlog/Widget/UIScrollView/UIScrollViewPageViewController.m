//
//  UIScrollViewPageViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/13.
//

#import "UIScrollViewPageViewController.h"

@interface UIScrollViewPageViewController () <UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UIPageControl *pageControl;

@end

@implementation UIScrollViewPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 100, 320, 150)];
    self.scrollView.contentSize = CGSizeMake(320*5, 150);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    for (int index = 1; index <=5; index++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(320 * (index - 1), 0, 320, 150)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"switcher%d", index]];
        [self.scrollView addSubview:imageView];
    }
    
    [self.view addSubview: self.scrollView];
    self.scrollView.delegate = self;

    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(10, 230, 320, 20)];
    self.pageControl.numberOfPages = 5;
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor = [UIColor magentaColor];

    [self.view addSubview:self.pageControl];
    [self.pageControl addTarget:self action:@selector(onPageControlValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat width = scrollView.contentOffset.x;
    NSInteger page = width/320 + 0.5;
    NSLog(@"page = %ld %f", page, width/320);
    self.pageControl.currentPage = page;
}

- (void)onPageControlValueChanged:(UIPageControl *)sender {
    NSInteger page = sender.currentPage;
    [self.scrollView setContentOffset:CGPointMake(320*page, 0) animated:YES];
}

@end
