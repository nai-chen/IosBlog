//
//  UIActivityIndicatorViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/7.
//

#import "UIActivityIndicatorViewController.h"

@interface UIActivityIndicatorViewController ()

@end

@implementation UIActivityIndicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc]
                              initWithFrame:CGRectMake(100, 100, 50, 50)];
    activityIndicatorView.hidesWhenStopped = NO;
    [self.view addSubview: activityIndicatorView];
    [activityIndicatorView startAnimating];
    
    UIActivityIndicatorView *largeActivityIndicatorView = [[UIActivityIndicatorView alloc]
                              initWithFrame:CGRectMake(220, 100, 50, 50)];
    largeActivityIndicatorView.color = [UIColor magentaColor];
    if (@available(iOS 13.0, *)) {
        largeActivityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleLarge;
    }
    [self.view addSubview: largeActivityIndicatorView];
    [largeActivityIndicatorView startAnimating];

    dispatch_time_t stopTime = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    dispatch_after(stopTime, dispatch_get_main_queue(), ^(void){
        [activityIndicatorView stopAnimating];
        [largeActivityIndicatorView stopAnimating];
    });
}

@end
