//
//  AnimationFrameViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/11.
//

#import "AnimationFrameViewController.h"

@interface AnimationFrameViewController ()

@property(nonatomic, strong) UIView *magentaView;

@end

@implementation AnimationFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.magentaView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 160, 160)];
    self.magentaView.backgroundColor = [UIColor magentaColor];
    [self.view addSubview: self.magentaView];
    
    UIButton *keyFramesButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 450, 200, 30)];
    [keyFramesButton setTitle:@"KeyFrames animation" forState:UIControlStateNormal];
    [keyFramesButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [keyFramesButton addTarget:self action:@selector(onKeyFramesAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: keyFramesButton];
}

- (void)onKeyFramesAnimation:(UIButton *)sender {
    [UIView animateKeyframesWithDuration:1 delay:0 options:0 animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.2 animations:^{
            self.magentaView.frame = CGRectMake(120, 100, 160, 160);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.2 relativeDuration:0.7 animations:^{
            self.magentaView.frame = CGRectMake(160, 240, 80, 80);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.7 relativeDuration:1 animations:^{
            self.magentaView.frame = CGRectMake(20, 100, 160, 160);
        }];
    } completion:nil];
}

@end
