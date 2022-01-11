//
//  PresentModalDialogViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/1/6.
//

#import "PresentModalDialogViewController.h"

#import "Masonry.h"

@interface PresentModalDialogViewController ()

@end

@implementation PresentModalDialogViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor blueColor];
    
    contentView.layer.cornerRadius = 5;
    contentView.layer.masksToBounds = YES;
 
    [self.view addSubview:contentView];
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.mas_equalTo(@280);
        make.height.mas_equalTo(@100);
    }];

    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"back";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(@40);
        make.centerX.equalTo(contentView);
        make.bottom.equalTo(contentView);
    }];
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onSingleTap:)];
    [label addGestureRecognizer:recognizer];
}

- (void)onSingleTap:(UIGestureRecognizer *)recognizer {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Dialog VC dismiss");
    }];
}

@end
