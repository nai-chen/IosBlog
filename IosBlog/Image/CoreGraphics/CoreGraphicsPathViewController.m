//
//  CoreGraphicsPathViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/20.
//

#import "CoreGraphicsPathViewController.h"

#import "CoreGraphicsPathView.h"

@interface CoreGraphicsPathViewController ()

@end

@implementation CoreGraphicsPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:[[CoreGraphicsPathView alloc] initWithFrame:CGRectMake(20, 100, 300, 500)]];

}

@end
