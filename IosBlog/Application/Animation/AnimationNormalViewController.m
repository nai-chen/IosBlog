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
    
    self.animationView = [[UIView alloc] initWithFrame:CGRectMake(20, 80, 160, 160)];
    self.animationView.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:self.animationView];
    
    UIView* childrenView = [[UIView alloc] initWithFrame:CGRectMake(40, 40, 80, 80)];
    childrenView.backgroundColor = [UIColor whiteColor];
    [self.animationView addSubview:childrenView];
    
    UIButton* frameButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 360, 150, 30)];
    [frameButton setTitle:@"frame animation" forState:UIControlStateNormal];
    [frameButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [frameButton addTarget:self action:@selector(onFrameAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: frameButton];
    
    UIButton* boundsButton = [[UIButton alloc] initWithFrame:CGRectMake(175, 360, 150, 30)];
    [boundsButton setTitle:@"bounds animation" forState:UIControlStateNormal];
    [boundsButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [boundsButton addTarget:self action:@selector(onBoundsAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: boundsButton];
    
    UIButton* centerButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 390, 150, 30)];
    [centerButton setTitle:@"center animation" forState:UIControlStateNormal];
    [centerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [centerButton addTarget:self action:@selector(onCenterAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: centerButton];

    UIButton* alphaButton = [[UIButton alloc] initWithFrame:CGRectMake(175, 390, 150, 30)];
    [alphaButton setTitle:@"alpha animation" forState:UIControlStateNormal];
    [alphaButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [alphaButton addTarget:self action:@selector(onAlphaAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: alphaButton];

    UIButton* backgroundButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 420, 150, 30)];
    [backgroundButton setTitle:@"background animation" forState:UIControlStateNormal];
    [backgroundButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [backgroundButton addTarget:self action:@selector(onBackgroundAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: backgroundButton];

    UIButton* transformButton = [[UIButton alloc] initWithFrame:CGRectMake(175, 420, 150, 30)];
    [transformButton setTitle:@"transform animation" forState:UIControlStateNormal];
    [transformButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [transformButton addTarget:self action:@selector(onTransformAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: transformButton];
    
    UIButton* resetButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 480, 150, 30)];
    [resetButton setTitle:@"reset" forState:UIControlStateNormal];
    [resetButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [resetButton addTarget:self action:@selector(onResetClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: resetButton];
}

-(void) onFrameAnimationClick: (UIButton*) sender {
    [UIView animateWithDuration:1 animations:^(void) {
        self.animationView.frame = CGRectMake(20, 80, 240, 240);
    } completion:nil];
}

-(void) onBoundsAnimationClick: (UIButton*) sender {
    [UIView animateWithDuration:1 animations:^(void) {
        self.animationView.bounds = CGRectMake(30, 30, 160, 160);
    } completion:nil];
}

-(void) onCenterAnimationClick: (UIButton*) sender {
    [UIView animateWithDuration:1 animations:^(void) {
        self.animationView.center = CGPointMake(160, 220);
    } completion:nil];
}

-(void) onAlphaAnimationClick: (UIButton*) sender {
    [UIView animateWithDuration:1 animations:^(void) {
        self.animationView.alpha = 0.2;
    } completion:nil];
}

-(void) onBackgroundAnimationClick: (UIButton*) sender {
    [UIView animateWithDuration:1 animations:^(void) {
        self.animationView.backgroundColor = [UIColor blueColor];
    } completion:nil];
}

-(void) onTransformAnimationClick: (UIButton*) sender {
    [UIView animateWithDuration:1 animations:^(void) {
        self.animationView.transform = CGAffineTransformMakeRotation(M_PI_4);
    } completion:nil];
}

-(void) onResetClick: (UIButton*) sender {
    self.animationView.frame = CGRectMake(20, 80, 160, 160);
    self.animationView.bounds = CGRectMake(0, 0, 160, 160);
    self.animationView.alpha = 1;
    self.animationView.backgroundColor = [UIColor magentaColor];
    self.animationView.transform = CGAffineTransformIdentity;
}

@end
