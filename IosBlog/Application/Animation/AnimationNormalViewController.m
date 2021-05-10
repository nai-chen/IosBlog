//
//  AnimationViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/6.
//

#import "AnimationNormalViewController.h"

#import "UIColor+Tool.h"

@interface AnimationNormalViewController ()

@property (nonatomic, strong) UIView* animationView;

@end

@implementation AnimationNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animationView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 160, 60)];
    self.animationView.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:self.animationView];
    
    UIButton* frameButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 300, 150, 30)];
    [frameButton setTitle:@"frame animation" forState:UIControlStateNormal];
    [frameButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [frameButton addTarget:self action:@selector(onFrameAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: frameButton];
    
    UIButton* centerButton = [[UIButton alloc] initWithFrame:CGRectMake(175, 300, 150, 30)];
    [centerButton setTitle:@"center animation" forState:UIControlStateNormal];
    [centerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [centerButton addTarget:self action:@selector(onCenterAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: centerButton];
    
    UIButton* alphaButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 330, 150, 30)];
    [alphaButton setTitle:@"alpha animation" forState:UIControlStateNormal];
    [alphaButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [alphaButton addTarget:self action:@selector(onAlphaAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: alphaButton];
    
    UIButton* backgroundButton = [[UIButton alloc] initWithFrame:CGRectMake(175, 330, 150, 30)];
    [backgroundButton setTitle:@"background animation" forState:UIControlStateNormal];
    [backgroundButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [backgroundButton addTarget:self action:@selector(onBackgroundAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: backgroundButton];
    
    UIButton* transformButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 360, 150, 30)];
    [transformButton setTitle:@"transform animation" forState:UIControlStateNormal];
    [transformButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [transformButton addTarget:self action:@selector(onTransformAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: transformButton];
    
    UIButton* resetButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 450, 150, 30)];
    [resetButton setTitle:@"reset" forState:UIControlStateNormal];
    [resetButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [resetButton addTarget:self action:@selector(onResetClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: resetButton];
}

-(void) onFrameAnimationClick: (UIButton*) sender {
    [UIView animateWithDuration:1 animations:^(void) {
        self.animationView.frame = CGRectMake(20, 100, 320, 120);
    } completion:nil];
}

-(void) onCenterAnimationClick: (UIButton*) sender {
    [UIView animateWithDuration:0.5 animations:^(void) {
        self.animationView.center = CGPointMake(185, 175);
    } completion:nil];
}

-(void) onAlphaAnimationClick: (UIButton*) sender {
    [UIView animateWithDuration:0.5 animations:^(void) {
        self.animationView.alpha = 0.5;
    } completion:nil];
}

-(void) onBackgroundAnimationClick: (UIButton*) sender {
    [UIView animateWithDuration:0.5 animations:^(void) {
        self.animationView.backgroundColor = [UIColor blueColor];
    } completion:nil];
}

-(void) onTransformAnimationClick: (UIButton*) sender {
    [UIView animateWithDuration:0.5 animations:^(void) {
        self.animationView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } completion:nil];
}

-(void) onResetClick: (UIButton*) sender {
    self.animationView.frame = CGRectMake(20, 100, 160, 60);
    self.animationView.center = CGPointMake(100, 130);
    self.animationView.alpha = 1;
    self.animationView.backgroundColor = [UIColor magentaColor];
    self.animationView.transform = CGAffineTransformIdentity;
}


@end
