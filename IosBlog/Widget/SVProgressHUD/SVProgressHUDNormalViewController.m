//
//  SVProgressHUDNormalViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/13.
//

#import "SVProgressHUDNormalViewController.h"

#import "SVProgressHUD.h"

@interface SVProgressHUDNormalViewController ()

@end

@implementation SVProgressHUDNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self
                selector:@selector(handleNotification:)
                name:SVProgressHUDWillAppearNotification
                object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                selector:@selector(handleNotification:)
                name:SVProgressHUDDidAppearNotification
                object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                selector:@selector(handleNotification:)
                name:SVProgressHUDWillDisappearNotification
                object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                selector:@selector(handleNotification:)
                name:SVProgressHUDDidDisappearNotification
                object:nil];

    [self showProgressButton:CGRectMake(10, 100, 150, 30) title:@"show" action:@selector(onShowClick:)];
    [self showProgressButton:CGRectMake(10, 130, 150, 30) title:@"showWithStatus" action:@selector(onShowWithStatusClick:)];
    [self showProgressButton:CGRectMake(10, 160, 150, 30) title:@"showProgress" action:@selector(onShowProgressClick:)];
    [self showProgressButton:CGRectMake(10, 190, 150, 30) title:@"showProgressStatus" action:@selector(onShowProgressStatusClick:)];
    [self showProgressButton:CGRectMake(10, 220, 150, 30) title:@"showInfo" action:@selector(onShowInfoClick:)];
    [self showProgressButton:CGRectMake(10, 250, 150, 30) title:@"showSuccess" action:@selector(onShowSuccessClick:)];
    [self showProgressButton:CGRectMake(10, 280, 150, 30) title:@"showError" action:@selector(onShowErrorClick:)];
    [self showProgressButton:CGRectMake(10, 310, 150, 30) title:@"showImage" action:@selector(onShowImageClick:)];
    
    [self showProgressButton:CGRectMake(170, 100, 150, 30) title:@"dismiss" action:@selector(onDismissClick:)];
    [self showProgressButton:CGRectMake(170, 130, 150, 30) title:@"dismissWithCompletion" action:@selector(onDismissWithCompletionClick:)];
    [self showProgressButton:CGRectMake(170, 160, 150, 30) title:@"dismissWithDelay" action:@selector(onDismissWithDelayClick:)];
    [self showProgressButton:CGRectMake(170, 190, 150, 30) title:@"dismissWithDelayCompletion" action:@selector(onDismissWithDelayCompletionClick:)];

}

- (void)showProgressButton:(CGRect)frame title:(NSString *)title action:(SEL)action {
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)onShowClick:(UIButton *)sender {
    [SVProgressHUD show];
}

- (void)onShowWithStatusClick:(UIButton *)sender {
    [SVProgressHUD showWithStatus:@"读取中..."];
}

- (void)onShowProgressClick:(UIButton *)sender {
    [SVProgressHUD showProgress:0.1];
}

- (void)onShowProgressStatusClick:(UIButton *)sender {
    [SVProgressHUD showProgress:0.2 status:@"读取中..."];
}

- (void)onShowInfoClick:(UIButton *)sender {
    [SVProgressHUD showInfoWithStatus:@"读取中..."];
}

- (void)onShowSuccessClick:(UIButton *)sender {
    [SVProgressHUD showSuccessWithStatus:@"读取中..."];
}

- (void)onShowErrorClick:(UIButton *)sender {
    [SVProgressHUD showErrorWithStatus:@"读取中..."];
}

- (void)onDismissClick:(UIButton *)sender {
    [SVProgressHUD dismiss];
}

- (void)onDismissWithCompletionClick:(UIButton *)sender {
    [SVProgressHUD dismissWithCompletion:^{
        NSLog(@"DismissWithCompletion");
    }];
}

- (void)onDismissWithDelayClick:(UIButton *)sender {
    [SVProgressHUD dismissWithDelay:3];
}

- (void)onDismissWithDelayCompletionClick:(UIButton *)sender {
    [SVProgressHUD dismissWithDelay:3 completion:^{
        NSLog(@"DismissWithCompletion");
    }];
}

- (void)onShowImageClick:(UIButton *)sender {
    [SVProgressHUD showImage:[UIImage imageNamed:@"choice_s"] status:@"读取中..."];
}

- (void)handleNotification:(NSNotification *)notification {
    NSLog(@"Notification recieved: %@", notification.name);
    NSLog(@"Status user info key: %@", notification.userInfo[SVProgressHUDStatusUserInfoKey]);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
