//
//  Pushed1ViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/1/11.
//

#import "Pushed1ViewController.h"

#import "Pushed2ViewController.h"

@interface Pushed1ViewController ()

@end

@implementation Pushed1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *gotoBackBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 100, 30)];

    [gotoBackBtn setTitle:@"gotoBack" forState:UIControlStateNormal];
    [gotoBackBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

    [gotoBackBtn addTarget:self action:@selector(onGotoBackButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:gotoBackBtn];
    
    UIButton *gotoPushed2Btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 160, 100, 30)];

    [gotoPushed2Btn setTitle:@"goto push" forState:UIControlStateNormal];
    [gotoPushed2Btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

    [gotoPushed2Btn addTarget:self action:@selector(onPushButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:gotoPushed2Btn];
}

- (void)onGotoBackButtonClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onPushButtonClick:(UIButton *)sender {
    Pushed2ViewController *vc = [[Pushed2ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
