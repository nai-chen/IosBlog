//
//  CoreGraphicsCurveViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/20.
//

#import "CoreGraphicsCurveViewController.h"

#import "CoreGraphicsCurveView.h"

@interface CoreGraphicsCurveViewController ()

@end

@implementation CoreGraphicsCurveViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:[[CoreGraphicsCurveView alloc] initWithFrame:CGRectMake(20, 100, 300, 500)]];
}

@end
