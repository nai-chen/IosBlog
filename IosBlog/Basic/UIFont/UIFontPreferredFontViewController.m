//
//  UIFontPreferredFontViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/13.
//

#import "UIFontPreferredFontViewController.h"
#import "Tool.h"

@interface UIFontPreferredFontViewController ()

@end

@implementation UIFontPreferredFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(25, 100, kDeviceWidth - 50, 30)];
    label.text = @"UIFontTextStyleTitle1";
    [label setFont: [UIFont preferredFontForTextStyle:UIFontTextStyleTitle1]];
    [self.view addSubview:label];

    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 130, kDeviceWidth - 50, 30)];
    label.text = @"UIFontTextStyleTitle2";
    [label setFont: [UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 160, kDeviceWidth - 50, 30)];
    label.text = @"UIFontTextStyleTitle3";
    [label setFont: [UIFont preferredFontForTextStyle:UIFontTextStyleTitle3]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 190, kDeviceWidth - 50, 30)];
    label.text = @"UIFontTextStyleHeadline";
    [label setFont: [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 220, kDeviceWidth - 50, 30)];
    label.text = @"UIFontTextStyleSubheadline";
    [label setFont: [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 250, kDeviceWidth - 50, 30)];
    label.text = @"UIFontTextStyleBody";
    [label setFont: [UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 280, kDeviceWidth - 50, 30)];
    label.text = @"UIFontTextStyleCallout";
    [label setFont: [UIFont preferredFontForTextStyle:UIFontTextStyleCallout]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 310, kDeviceWidth - 50, 30)];
    label.text = @"UIFontTextStyleFootnote";
    [label setFont: [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 340, kDeviceWidth - 50, 30)];
    label.text = @"UIFontTextStyleCaption1";
    [label setFont: [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 370, kDeviceWidth - 50, 30)];
    label.text = @"UIFontTextStyleCaption2";
    [label setFont: [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2]];
    [self.view addSubview:label];
}

@end
