//
//  UILabelOtherViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/11.
//

#import "UILabelOtherViewController.h"

@interface UILabelOtherViewController ()

@end

@implementation UILabelOtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* text = @"Copyright (c) 2006-2018 Apple Inc. All rights reserved.";
    
    UILabel* normalLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 320, 60)];
    normalLabel.backgroundColor = [UIColor brownColor];
    normalLabel.text = text;
    [self.view addSubview:normalLabel];
    
    UILabel* numberOfLinesLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 160, 320, 60)];
    numberOfLinesLabel.backgroundColor = [UIColor brownColor];
    numberOfLinesLabel.text = text;
    numberOfLinesLabel.numberOfLines = 0;
    [self.view addSubview:numberOfLinesLabel];
    
    UILabel* fitWidthLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 250, 320, 30)];
    fitWidthLabel.backgroundColor = [UIColor brownColor];
    fitWidthLabel.text = text;
    fitWidthLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:fitWidthLabel];
    
    UILabel* enabledLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 300, 320, 30)];
    enabledLabel.backgroundColor = [UIColor brownColor];
    enabledLabel.text = text;
    enabledLabel.enabled = false;
    [self.view addSubview:enabledLabel];
    
    UILabel* highLightLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 350, 320, 30)];
    highLightLabel.backgroundColor = [UIColor brownColor];
    highLightLabel.text = text;
    highLightLabel.highlightedTextColor = [UIColor redColor];
    highLightLabel.highlighted = true;
    [self.view addSubview:highLightLabel];
    
    UILabel* shadowNormalLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 400, 320, 30)];
    shadowNormalLabel.text = text;
    [self.view addSubview:shadowNormalLabel];

    UILabel* shadowLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 450, 320, 30)];
    shadowLabel.text = text;
    shadowLabel.shadowColor = [UIColor magentaColor];
    shadowLabel.shadowOffset = CGSizeMake(10, 5);
    [self.view addSubview:shadowLabel];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
