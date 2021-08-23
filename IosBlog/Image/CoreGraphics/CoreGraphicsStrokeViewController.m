//
//  CoreGraphicsStrokeViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/5.
//

#import "CoreGraphicsStrokeViewController.h"

#import "CoreGraphicsStrokeView.h"

@interface CoreGraphicsStrokeViewController ()

@end

@implementation CoreGraphicsStrokeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:[[CoreGraphicsStrokeView alloc] initWithFrame:CGRectMake(20, 100, 300, 500)]];
}

@end
