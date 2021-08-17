//
//  UIControlViewViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/13.
//

#import "UIControlViewViewController.h"
#import "UICustomControl.h"

@interface UIControlViewViewController ()
@property(nonatomic, strong) UICustomControl *control;
@end

@implementation UIControlViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.control = [[UICustomControl alloc] initWithFrame:CGRectMake(20, 100, 320, 100)];
    self.control.backgroundColor = [UIColor brownColor];

    [self.view addSubview:self.control];
    
    [self.control addTarget:self action:@selector(receive:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 220, 320, 30)];
    [button setTitle:@"send action" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(singleTap:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)receive:(id)sender {
    NSLog(@"receive");
}

- (void)singleTap:(id)sender {
    NSLog(@"singleTap");
    [self.control sendActionsForControlEvents:UIControlEventTouchUpInside];
}

@end
