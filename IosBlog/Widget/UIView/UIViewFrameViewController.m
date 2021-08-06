//
//  UIViewFrameViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/11.
//

#import "UIViewFrameViewController.h"
#import "Masonry.h"

@interface UIViewFrameViewController ()

@end

@implementation UIViewFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *redView1 = [[UIView alloc] initWithFrame:CGRectMake(40, 100, 100, 100)];
    redView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView1];
    
    UIView *blueView1 = [[UIView alloc] initWithFrame: CGRectMake(10, 10, 60, 60)];
    blueView1.backgroundColor = [UIColor blueColor];
    [redView1 addSubview:blueView1];

    [self print:redView1];
    [self print:blueView1];
    
    UIView *redView2 = [[UIView alloc] initWithFrame:CGRectMake(200, 100, 100, 100)];
    redView2.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView2];
    
    UIView *blueView2 = [[UIView alloc] initWithFrame:CGRectMake(-10, -10, 60, 60)];
    blueView2.backgroundColor = [UIColor blueColor];
    [redView2 addSubview:blueView2];

    [self print:redView2];
    [self print:blueView2];
    
    UIView *redView3 = [[UIView alloc] initWithFrame:CGRectMake(40, 250, 100, 100)];
    redView3.bounds = CGRectMake(-10, -10, 100, 100);
    redView3.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView3];
    
    UIView *blueView3 = [[UIView alloc] initWithFrame: CGRectMake(10, 10, 60, 60)];
    blueView3.backgroundColor = [UIColor blueColor];
    [redView3 addSubview:blueView3];

    [self print:redView3];
    [self print:blueView3];
    
    UIView *redView4 = [[UIView alloc] initWithFrame:CGRectMake(200, 250, 100, 100)];
    redView4.bounds = CGRectMake(10, 10, 100, 100);
    redView4.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView4];
    
    UIView *blueView4 = [[UIView alloc] initWithFrame: CGRectMake(10, 10, 60, 60)];
    blueView4.backgroundColor = [UIColor blueColor];
    [redView4 addSubview:blueView4];

    [self print:redView4];
    [self print:blueView4];
}

-(void) print:(UIView *)view {
    NSLog(@"frame x = %f, y = %f, width = %f, height = %f", view.frame.origin.x, view.frame.origin.y,
          view.frame.size.width, view.frame.size.height);
    NSLog(@"bounds x = %f, y = %f, width = %f, height = %f", view.bounds.origin.x, view.bounds.origin.y,
          view.bounds.size.width, view.bounds.size.height);
}

@end
