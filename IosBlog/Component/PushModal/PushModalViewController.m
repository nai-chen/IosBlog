//
//  PushModalViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/1/11.
//

#import "PushModalViewController.h"

#import "Pushed1ViewController.h"

@interface PushModalViewController ()

@end

@implementation PushModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *gotoPushed1Btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 100, 30)];
    [gotoPushed1Btn setTitle:@"goto push" forState:UIControlStateNormal];
    [gotoPushed1Btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [gotoPushed1Btn addTarget:self action:@selector(onPushButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:gotoPushed1Btn];
}

- (void)onPushButtonClick:(UIButton *)sender {
    Pushed1ViewController *vc = [[Pushed1ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
