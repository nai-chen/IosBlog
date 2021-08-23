//
//  UIBezierPathNormalViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/23.
//

#import "UIBezierPathNormalViewController.h"

#import "UIBezierPathView.h"

@interface UIBezierPathNormalViewController ()

@end

@implementation UIBezierPathNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:[[UIBezierPathView alloc] initWithFrame:CGRectMake(20, 100, 300, 500)]];
}

@end
