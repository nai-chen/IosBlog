//
//  UIProgressViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/7.
//

#import "UIProgressViewController.h"

@interface UIProgressViewController ()

@end

@implementation UIProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIProgressView* progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    progressView.progress = 0.3;
    [self.view addSubview: progressView];
    
    UIProgressView* barProgressView = [[UIProgressView alloc] initWithFrame:CGRectMake(50, 150, 200, 50)];
    barProgressView.progress = 0.3;
    barProgressView.progressViewStyle = UIProgressViewStyleBar;
    barProgressView.progressTintColor = [UIColor greenColor];
    barProgressView.trackTintColor = [UIColor redColor];
    [self.view addSubview: barProgressView];
}

@end
