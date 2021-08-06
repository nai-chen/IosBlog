//
//  UILabelBreakModeViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/11.
//

#import "UILabelBreakModeViewController.h"

@interface UILabelBreakModeViewController ()

@end

@implementation UILabelBreakModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *text = @"Copyright (c) 2006-2018 Apple Inc. All rights reserved.";
    
    UILabel *defaultLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 320, 30)];
    defaultLabel.backgroundColor = [UIColor brownColor];
    defaultLabel.text = text;
    [self.view addSubview:defaultLabel];
    
    UILabel *truncatingHeadLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 150, 320, 30)];
    truncatingHeadLabel.backgroundColor = [UIColor brownColor];
    truncatingHeadLabel.text = text;
    truncatingHeadLabel.lineBreakMode = NSLineBreakByTruncatingHead;
    [self.view addSubview:truncatingHeadLabel];
    
    UILabel *truncatingMiddleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 200, 320, 30)];
    truncatingMiddleLabel.backgroundColor = [UIColor brownColor];
    truncatingMiddleLabel.text = text;
    truncatingMiddleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    [self.view addSubview:truncatingMiddleLabel];
    
    UILabel *truncatingTailLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 250, 320, 30)];
    truncatingTailLabel.backgroundColor = [UIColor brownColor];
    truncatingTailLabel.text = text;
    truncatingTailLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.view addSubview:truncatingTailLabel];

    UILabel *wordWrappingLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 300, 320, 50)];
    wordWrappingLabel.backgroundColor = [UIColor brownColor];
    wordWrappingLabel.text = text;
    wordWrappingLabel.numberOfLines = 0;
    wordWrappingLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview:wordWrappingLabel];
    
    UILabel *charWrappingLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 370, 320, 50)];
    charWrappingLabel.backgroundColor = [UIColor brownColor];
    charWrappingLabel.text = text;
    charWrappingLabel.numberOfLines = 0;
    charWrappingLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [self.view addSubview:charWrappingLabel];

    UILabel *clippingLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 440, 320, 50)];
    clippingLabel.backgroundColor = [UIColor brownColor];
    clippingLabel.text = text;
    clippingLabel.numberOfLines = 0;
    clippingLabel.lineBreakMode = NSLineBreakByClipping;
    [self.view addSubview:clippingLabel];
}

@end
