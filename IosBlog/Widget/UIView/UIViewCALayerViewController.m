//
//  UIViewCALayerViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/11.
//

#import "UIViewCALayerViewController.h"

@interface UIViewCALayerViewController ()

@end

@implementation UIViewCALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *brownView1 = [[UIView alloc] initWithFrame:CGRectMake(40, 100, 100, 100)];
    brownView1.layer.backgroundColor = [UIColor brownColor].CGColor;
    brownView1.layer.borderColor = [UIColor redColor].CGColor;
    brownView1.layer.borderWidth = 20;
    brownView1.layer.cornerRadius = 5;
    [self.view addSubview:brownView1];

    UIView *brownView2 = [[UIView alloc] initWithFrame:CGRectMake(200, 100, 100, 100)];
    brownView2.layer.backgroundColor = [UIColor brownColor].CGColor;
    brownView2.layer.contents = (id)[UIImage imageNamed:@"icon_money"].CGImage;
    [self.view addSubview:brownView2];
    
    UIView *brownView3 = [[UIView alloc] initWithFrame:CGRectMake(40, 250, 100, 100)];
    brownView3.layer.backgroundColor = [UIColor brownColor].CGColor;
    brownView3.layer.contents = (id)[UIImage imageNamed:@"icon_money"].CGImage;
    brownView3.layer.cornerRadius = 50;
    brownView3.layer.masksToBounds = YES;
    [self.view addSubview:brownView3];
    
    UIView *brownView4 = [[UIView alloc] initWithFrame:CGRectMake(200, 250, 100, 100)];
    brownView4.layer.backgroundColor = [UIColor brownColor].CGColor;
    brownView4.layer.shadowColor = [UIColor blackColor].CGColor;
    brownView4.layer.shadowOffset = CGSizeMake(10, 15);
    brownView4.layer.shadowOpacity = 0.6;
    
    [self.view addSubview:brownView4];
    
    
}

@end
