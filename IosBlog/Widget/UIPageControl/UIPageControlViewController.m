//
//  UIPageControlViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/2.
//

#import "UIPageControlViewController.h"

@interface UIPageControlViewController ()

@end

@implementation UIPageControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;

    UIPageControl *normalPageControl = [self makePageControl:CGRectMake(0, 100, width/2, 30)];
    [normalPageControl addTarget:self action:@selector(onPageControlValueChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:normalPageControl];
    
    if (@available(iOS 14.0, *)) {
        UIPageControl *continuousPageControl = [self makePageControl:CGRectMake(width/2, 100, width/2, 30)];
        // 交互方式,离散discrete/连续continuous
        continuousPageControl.allowsContinuousInteraction = NO;
        [continuousPageControl addTarget:self action:@selector(onPageControlValueChange:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:continuousPageControl];
    }
    
    UIPageControl *hidePageControl = [self makePageControl:CGRectMake(0, 150, width/2, 30)];
    hidePageControl.numberOfPages = 1;
    // 只有一个页面时隐藏空间,默认是NO
    hidePageControl.hidesForSinglePage = YES;
    [self.view addSubview:hidePageControl];
    
    if (@available(iOS 14.0, *)) {
        UIPageControl *prominentPageControl = [self makePageControl:CGRectMake(0, 200, width/2, 30)];
        // 背景样式
        prominentPageControl.backgroundStyle = UIPageControlBackgroundStyleProminent;
        [self.view addSubview:prominentPageControl];
        
        UIPageControl *minimalPageControl = [self makePageControl:CGRectMake(0, 250, width/2, 30)];
        minimalPageControl.backgroundStyle = UIPageControlBackgroundStyleMinimal;
        [self.view addSubview:minimalPageControl];
    }
    
    if (@available(iOS 14.0, *)) {
        UIPageControl *imagePageControl = [self makePageControl:CGRectMake(0, 300, width/2, 30)];
        imagePageControl.preferredIndicatorImage = [UIImage imageNamed:@"btn_guanzhu"];
        [self.view addSubview:imagePageControl];
    }
    
    if (@available(iOS 14.0, *)) {
        UIPageControl *imagePageControl = [self makePageControl:CGRectMake(0, 350, width/2, 30)];
        [imagePageControl setIndicatorImage:[UIImage imageNamed:@"user_gy"] forPage:0];
        [imagePageControl setIndicatorImage:[UIImage imageNamed:@"user_haoyou"] forPage:1];
        [imagePageControl setIndicatorImage:[UIImage imageNamed:@"user_kefu"] forPage:2];
        [imagePageControl setIndicatorImage:[UIImage imageNamed:@"user_shezhi"] forPage:3];
        [imagePageControl setIndicatorImage:[UIImage imageNamed:@"user_xiaoxi"] forPage:4];
        [imagePageControl setIndicatorImage:[UIImage imageNamed:@"user_zhangdan"] forPage:5];
        
        [imagePageControl setTransform:CGAffineTransformMakeScale(1.2, 1.2)];

        [self.view addSubview:imagePageControl];
    }
}

-(UIPageControl *)makePageControl:(CGRect)rect {
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:rect];
    // 未选中小白点的颜色
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    // 当前选中小白点的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor magentaColor];
    // 小白点的数量
    pageControl.numberOfPages = 6;
    // 当前选中的点
    pageControl.currentPage = 2;
    
    return pageControl;
}

-(void)onPageControlValueChange:(UIPageControl *)sender {
    NSLog(@"currentPage = %ld", sender.currentPage);
}

@end
