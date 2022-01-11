//
//  PresentModalPopupViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/1/6.
//

#import "PresentModalPopupViewController.h"

#import "Masonry.h"

@interface PresentModalPopupViewController ()

@property(nonatomic, strong) UIView *contentView;

@end

@implementation PresentModalPopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor blueColor];
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onSingleTap:)];
    [self.view addGestureRecognizer:recognizer];

    [self.view addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@100);
    }];
}

- (void)onSingleTap:(UIGestureRecognizer *)recognizer {
    CGPoint point = [recognizer locationInView:self.view];
    
    if (CGRectContainsPoint(self.contentView.frame, point) ) {
        return;
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Dialog VC dismiss");
    }];
}

@end
