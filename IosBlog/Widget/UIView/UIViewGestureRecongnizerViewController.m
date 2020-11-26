//
//  UIViewGestureRecongnizerViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/11.
//

#import "UIViewGestureRecongnizerViewController.h"

@interface UIViewGestureRecongnizerViewController ()

@end

@implementation UIViewGestureRecongnizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView* redView = [[UIView alloc] initWithFrame:CGRectMake(40, 100, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UITapGestureRecognizer* gestureRecognizer = [[UITapGestureRecognizer alloc] init];
    [gestureRecognizer addTarget:self action:@selector(singleTap:)];
//    UITapGestureRecognizer* gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    [redView addGestureRecognizer: gestureRecognizer];
}

-(void) singleTap:(UITapGestureRecognizer*) sender {
    NSLog(@"SingleTap");
}

@end
