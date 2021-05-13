//
//  UISystemFontViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/13.
//

#import "UISystemFontViewController.h"
#import "Tool.h"

@interface UISystemFontViewController ()

@end

@implementation UISystemFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(25, 100, kDeviceWidth - 50, 30)];
    label.text = @"System Bold 17";
    [label setFont: [UIFont systemFontOfSize:17]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 130, kDeviceWidth - 50, 30)];
    label.text = @"Bold System Bold 17";
    [label setFont: [UIFont boldSystemFontOfSize:17]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 160, kDeviceWidth - 50, 30)];
    label.text = @"Italic System Bold 17";
    [label setFont: [UIFont italicSystemFontOfSize:17]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 190, kDeviceWidth - 50, 30)];
    label.text = @"System Bold 17 UIFontWeightUltraLight";
    [label setFont: [UIFont systemFontOfSize:17 weight:UIFontWeightUltraLight]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 220, kDeviceWidth - 50, 30)];
    label.text = @"System Bold 17 UIFontWeightThin";
    [label setFont: [UIFont systemFontOfSize:17 weight:UIFontWeightThin]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 250, kDeviceWidth - 50, 30)];
    label.text = @"System Bold 17 UIFontWeightLight";
    [label setFont: [UIFont systemFontOfSize:17 weight:UIFontWeightLight]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 280, kDeviceWidth - 50, 30)];
    label.text = @"System Bold 17 UIFontWeightRegular";
    [label setFont: [UIFont systemFontOfSize:17 weight:UIFontWeightRegular]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 310, kDeviceWidth - 50, 30)];
    label.text = @"System Bold 17 UIFontWeightMedium";
    [label setFont: [UIFont systemFontOfSize:17 weight:UIFontWeightMedium]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 340, kDeviceWidth - 50, 30)];
    label.text = @"System Bold 17 UIFontWeightSemibold";
    [label setFont: [UIFont systemFontOfSize:17 weight:UIFontWeightSemibold]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 370, kDeviceWidth - 50, 30)];
    label.text = @"System Bold 17 UIFontWeightBold";
    [label setFont: [UIFont systemFontOfSize:17 weight:UIFontWeightBold]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 400, kDeviceWidth - 50, 30)];
    label.text = @"System Bold 17 UIFontWeightHeavy";
    [label setFont: [UIFont systemFontOfSize:17 weight:UIFontWeightHeavy]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(25, 430, kDeviceWidth - 50, 30)];
    label.text = @"System Bold 17 UIFontWeightBlack";
    [label setFont: [UIFont systemFontOfSize:17 weight:UIFontWeightBlack]];
    [self.view addSubview:label];
    
    UIFont* font = [UIFont systemFontOfSize:17];
    NSLog(@"familyName = %@, fontName = %@ pointSize = %.2f lineHeight = %.2f capHeight = %.2f xHeight = %.2f",
          font.familyName, font.fontName, font.pointSize, font.lineHeight, font.capHeight, font.xHeight);
    
    NSLog(@"labelFontSize = %.2f, buttonFontSize = %.2f, smallSystemFontSize = %.2f, systemFontSize = %.2f",
          [UIFont labelFontSize], [UIFont buttonFontSize], [UIFont smallSystemFontSize], [UIFont systemFontSize]);
}

@end
