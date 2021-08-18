//
//  AnimationTransformViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/10.
//

#import "AnimationTransformViewController.h"

@interface AnimationTransformViewController ()

@property(nonatomic, strong) UIImageView *imageView;

@end

@implementation AnimationTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 80, 160, 240)];
    self.imageView.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:self.imageView];
    
    UIButton *translationButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 380, 150, 30)];
    [translationButton setTitle:@"translation animation" forState:UIControlStateNormal];
    [translationButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [translationButton addTarget:self action:@selector(onTranslationAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: translationButton];
    
    UIButton *scaleButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 410, 150, 30)];
    [scaleButton setTitle:@"scale animation" forState:UIControlStateNormal];
    [scaleButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [scaleButton addTarget:self action:@selector(onScaleAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: scaleButton];
    
    UIButton *rotationButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 440, 150, 30)];
    [rotationButton setTitle:@"rotation animation" forState:UIControlStateNormal];
    [rotationButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rotationButton addTarget:self action:@selector(onRotationAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: rotationButton];
    
    UIButton *revertButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 470, 150, 30)];
    [revertButton setTitle:@"revert animation" forState:UIControlStateNormal];
    [revertButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [revertButton addTarget:self action:@selector(onRevertAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: revertButton];

    UIButton *concatButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 500, 150, 30)];
    [concatButton setTitle:@"concat animation" forState:UIControlStateNormal];
    [concatButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [concatButton addTarget:self action:@selector(onConcatAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: concatButton];
    
    UIButton *resetButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 530, 150, 30)];
    [resetButton setTitle:@"reset animation" forState:UIControlStateNormal];
    [resetButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [resetButton addTarget:self action:@selector(onResetAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: resetButton];
}

- (void)onTranslationAnimationClick:(UIButton *)sender {
    [UIView animateWithDuration:2 animations:^{
        self.imageView.transform = CGAffineTransformMakeTranslation(100, 20);
    }];
}

- (void)onScaleAnimationClick:(UIButton *)sender {
    [UIView animateWithDuration:2 animations:^{
        self.imageView.transform = CGAffineTransformMakeScale(0.6, 0.6);
    }];
}

- (void)onRotationAnimationClick:(UIButton *)sender {
    [UIView animateWithDuration:2 animations:^{
        self.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }];
}

- (void)onRevertAnimationClick:(UIButton *)sender {
    [UIView animateWithDuration:2 animations:^{
        self.imageView.transform = CGAffineTransformInvert(CGAffineTransformMakeRotation(M_PI_2));
    }];
}

- (void)onConcatAnimationClick:(UIButton *)sender {
    [UIView animateWithDuration:2 animations:^{
        self.imageView.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(M_PI),
                                           CGAffineTransformMakeScale(0.5, 0.5));
    }];
}

- (void)onResetAnimationClick:(UIButton *)sender {
    self.imageView.transform = CGAffineTransformIdentity;
}

@end
