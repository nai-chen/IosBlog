//
//  CoreGraphicsOtherViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/20.
//

#import "CoreGraphicsOtherViewController.h"

#import "CoreGraphicsOtherView.h"

@interface CoreGraphicsOtherViewController ()

@end

@implementation CoreGraphicsOtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:[[CoreGraphicsOtherView alloc] initWithFrame:CGRectMake(20, 100, 300, 500)]];

}

@end
