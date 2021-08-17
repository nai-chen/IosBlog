//
//  UIButtonNormalViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/16.
//

#import "UIButtonNormalViewController.h"

@interface UIButtonNormalViewController ()

@end

@implementation UIButtonNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview: [self buttonWithFrame:CGRectMake(20, 100, 320, 30) type:UIButtonTypeCustom title:@"custom button"]];
    [self.view addSubview: [self buttonWithFrame:CGRectMake(20, 150, 320, 30) type:UIButtonTypeSystem title:@"sytem button"]];
    [self.view addSubview: [self buttonWithFrame:CGRectMake(20, 200, 320, 30) type:UIButtonTypeDetailDisclosure title:@"detail disclosure button"]];
    [self.view addSubview: [self buttonWithFrame:CGRectMake(20, 250, 320, 30) type:UIButtonTypeInfoLight title:@"info light button"]];
    [self.view addSubview: [self buttonWithFrame:CGRectMake(20, 300, 320, 30) type:UIButtonTypeInfoDark title:@"info dark button"]];
    [self.view addSubview: [self buttonWithFrame:CGRectMake(20, 350, 320, 30) type:UIButtonTypeContactAdd title:@"contact add button"]];
    [self.view addSubview: [self buttonWithFrame:CGRectMake(20, 400, 320, 30) type:UIButtonTypeRoundedRect title:@"round rect button"]];
}

- (UIButton *)buttonWithFrame:(CGRect)frame type:(UIButtonType)buttonType title:(NSString*)title {
    UIButton *btn = [UIButton buttonWithType: buttonType];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    return btn;
}


@end
