//
//  UILabelTextAlignmentViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/11.
//

#import "UILabelTextAlignmentViewController.h"

@interface UILabelTextAlignmentViewController ()

@end

@implementation UILabelTextAlignmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 300, 40)];
    leftLabel.backgroundColor = [UIColor brownColor];
    leftLabel.text = @"Alignment Left(Default)";
    leftLabel.font = [UIFont systemFontOfSize:20];
    leftLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:leftLabel];
    
    UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 170, 300, 40)];
    centerLabel.backgroundColor = [UIColor brownColor];
    centerLabel.text = @"Alignment Center";
    centerLabel.font = [UIFont boldSystemFontOfSize:25];
    centerLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:centerLabel];
    
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 240, 300, 40)];
    rightLabel.backgroundColor = [UIColor brownColor];
    rightLabel.text = @"Alignment Right";
    rightLabel.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:rightLabel];
}

@end
