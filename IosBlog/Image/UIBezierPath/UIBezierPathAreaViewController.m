//
//  UIBezierPathAreaViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/23.
//

#import "UIBezierPathAreaViewController.h"

#import "UIBezierPathAreaView.h"

@interface UIBezierPathAreaViewController ()

@end

@implementation UIBezierPathAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:[[UIBezierPathAreaView alloc] initWithFrame:CGRectMake(20, 100, 300, 500)]];
}

@end
