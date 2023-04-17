//
//  UKNormalTabViewController.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/11.
//

#import "UKNormalTabViewController.h"

#import "UKTabView.h"

@interface UKNormalTabViewController () <UKTabViewDelegate, UIScrollViewDelegate>

@property(nonatomic, strong) UKTabView *tabView;
@property(nonatomic, strong) UIScrollView *scrollView;

@end

@implementation UKNormalTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tabView];
    [self.tabView setItems:@[@"选项1", @"选项2", @"选项3"] selection:0];
    
    for (int index = 1; index <= 3; index++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(320 * (index - 1), 0, 320, 150)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"switcher%d", index]];
        [self.scrollView addSubview:imageView];
    }
    
    [self.view addSubview: self.scrollView];
}

- (UKTabView *)tabView {
    if (!_tabView) {
        _tabView = [[UKTabView alloc] initWithFrame:CGRectMake(10, 100, 320, 50)];
        
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
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat width = scrollView.contentOffset.x;
    NSInteger page = width/320 + 0.5;
    NSLog(@"page Decelerate = %ld %f", page, width/320 - page);

    [self.tabView setSelection:page];
}

@end
