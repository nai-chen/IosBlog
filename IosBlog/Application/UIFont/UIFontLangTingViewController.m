//
//  UIFontLangTingViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/14.
//

#import "UIFontLangTingViewController.h"
#import "Tool.h"

@interface UIFontLangTingViewController ()

@end

@implementation UIFontLangTingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25, 100, kDeviceWidth - 50, 30)];
    label.text = @"LangTing 17";
    [label setFont: [UIFont fontWithName:@"FZLTHJW--GB1-0" size:17]];
    [self.view addSubview:label];
}

@end
