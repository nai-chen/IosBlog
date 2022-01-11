//
//  Pushed2ViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/1/11.
//

#import "Pushed2ViewController.h"

#import "PushModalViewController.h"

@interface Pushed2ViewController ()

@end

@implementation Pushed2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *popToVcBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 100, 30)];
    [popToVcBtn setTitle:@"pop to vc" forState:UIControlStateNormal];
    [popToVcBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

    [popToVcBtn addTarget:self action:@selector(onPopToVcButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:popToVcBtn];
    
    UIButton *popToRootBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 160, 100, 30)];
    [popToRootBtn setTitle:@"pop to root" forState:UIControlStateNormal];
    [popToRootBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

    [popToRootBtn addTarget:self action:@selector(onPopToRootButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:popToRootBtn];
}

- (void)onPopToVcButtonClick:(UIButton *)sender {
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[PushModalViewController class]]) {
            [self.navigationController popToViewController:vc animated:YES];
            break;
        }
    }
}

- (void)onPopToRootButtonClick:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
