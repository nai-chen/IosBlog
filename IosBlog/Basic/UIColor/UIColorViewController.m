//
//  UIColorViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/17.
//

#import "UIColorViewController.h"
#import "UIColor+Tool.h"

@interface UIColorViewController ()

@end

@implementation UIColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 320, 50)];
    label1.backgroundColor = ColorWithRGB(193, 154, 121, 1.0);
    
    [self.view addSubview: label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 170, 320, 50)];
    label2.backgroundColor = [UIColor colorWithHex:0xC19A79 alpha:1.0];
    
    [self.view addSubview: label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 240, 320, 50)];
    label3.backgroundColor = [UIColor colorWithHexString:@"C19A79" alpha:1.0];
    
    [self.view addSubview: label3];
}

@end
