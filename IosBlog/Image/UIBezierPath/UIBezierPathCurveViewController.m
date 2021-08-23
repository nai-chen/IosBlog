//
//  UIBezierPathCurveViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/23.
//

#import "UIBezierPathCurveViewController.h"

#import "UIBezierPathCurveView.h"

@interface UIBezierPathCurveViewController ()

@end

@implementation UIBezierPathCurveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:[[UIBezierPathCurveView alloc] initWithFrame:CGRectMake(20, 100, 300, 500)]];
}

@end
