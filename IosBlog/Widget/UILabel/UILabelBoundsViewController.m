//
//  UILabelBoundsViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/11.
//

#import "UILabelBoundsViewController.h"

@interface UILabelBoundsViewController ()

@end

@implementation UILabelBoundsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *text = @"Copyright (c) 2006-2018 Apple Inc. All rights reserved.";
    
    UILabel *boundsLabel = [[UILabel alloc] init];
    boundsLabel.backgroundColor = [UIColor brownColor];
    boundsLabel.text = text;
    boundsLabel.numberOfLines = 0;
    boundsLabel.font = [UIFont systemFontOfSize:17];
    
    NSInteger option = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [text boundingRectWithSize:CGSizeMake(320, CGFLOAT_MAX) options:option
                  attributes:@{NSFontAttributeName: boundsLabel.font} context:nil];
    
    boundsLabel.frame = CGRectMake(30, 100, 320, ceilf(rect.size.height) + 1);
    [self.view addSubview:boundsLabel];
    
}

@end
