//
//  UIViewClipsToBoundsViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/11.
//

#import "UIViewClipsToBoundsViewController.h"

@interface UIViewClipsToBoundsViewController ()

@end

@implementation UIViewClipsToBoundsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redView1 = [[UIView alloc] initWithFrame:CGRectMake(40, 100, 100, 100)];
    redView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView1];
    
    UIView *blueView1 = [[UIView alloc] initWithFrame: CGRectMake(-10, -10, 60, 60)];
    blueView1.backgroundColor = [UIColor blueColor];
    [redView1 addSubview:blueView1];
    
    
    UIView *redView2 = [[UIView alloc] initWithFrame:CGRectMake(200, 100, 100, 100)];
    redView2.backgroundColor = [UIColor redColor];
    redView2.clipsToBounds = YES;
    [self.view addSubview:redView2];
    
    UIView *blueView2 = [[UIView alloc] initWithFrame:CGRectMake(-10, -10, 60, 60)];
    blueView2.backgroundColor = [UIColor blueColor];
    [redView2 addSubview:blueView2];
}

@end
