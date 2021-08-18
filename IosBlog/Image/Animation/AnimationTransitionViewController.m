//
//  AnimationTransitionViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/10.
//

#import "AnimationTransitionViewController.h"

@interface AnimationTransitionViewController ()

@property(nonatomic, strong) UIView *magentaView;
@property(nonatomic, strong) UIView *redView;
@property(nonatomic, strong) UIView *blueView;

@end

@implementation AnimationTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.magentaView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 160, 160)];
    self.magentaView.backgroundColor = [UIColor magentaColor];
    [self.view addSubview: self.magentaView];

    self.redView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160, 160)];
    self.redView.backgroundColor = [UIColor redColor];
    [self.magentaView addSubview: self.redView];
    
    self.blueView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160, 160)];
    self.blueView.backgroundColor = [UIColor blueColor];
//    [self.magentaView addSubview: self.blueView];

    UIButton *curlUpButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 300, 250, 30)];
    [curlUpButton setTitle:@"CurlUp animation" forState:UIControlStateNormal];
    [curlUpButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [curlUpButton addTarget:self action:@selector(onCurlUpAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: curlUpButton];
    
    UIButton *curlDownButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 330, 250, 30)];
    [curlDownButton setTitle:@"CurlDown animation" forState:UIControlStateNormal];
    [curlDownButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [curlDownButton addTarget:self action:@selector(onCurlDownAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: curlDownButton];
    
    UIButton *crossDissolveButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 360, 250, 30)];
    [crossDissolveButton setTitle:@"CrossDissolve animation" forState:UIControlStateNormal];
    [crossDissolveButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [crossDissolveButton addTarget:self action:@selector(onCrossDissolveAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: crossDissolveButton];
    
    UIButton *flipFromLeftButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 390, 250, 30)];
    [flipFromLeftButton setTitle:@"FlipFromLeft animation" forState:UIControlStateNormal];
    [flipFromLeftButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [flipFromLeftButton addTarget:self action:@selector(onFlipFromLeftAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: flipFromLeftButton];
    
    UIButton *flipFromRightButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 420, 250, 30)];
    [flipFromRightButton setTitle:@"FlipFromRight animation" forState:UIControlStateNormal];
    [flipFromRightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [flipFromRightButton addTarget:self action:@selector(onFlipFromRightAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: flipFromRightButton];
    
    UIButton *flipFromTopButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 450, 250, 30)];
    [flipFromTopButton setTitle:@"FlipFromTop animation" forState:UIControlStateNormal];
    [flipFromTopButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [flipFromTopButton addTarget:self action:@selector(onFlipFromTopAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: flipFromTopButton];
    
    UIButton *flipFromBottomButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 480, 250, 30)];
    [flipFromBottomButton setTitle:@"FlipFromBottom animation" forState:UIControlStateNormal];
    [flipFromBottomButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [flipFromBottomButton addTarget:self action:@selector(onFlipFromBottomAnimationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: flipFromBottomButton];
    
    UIButton *transitionFromViewToViewButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 510, 250, 30)];
    [transitionFromViewToViewButton setTitle:@"TransitionFromViewToView animation" forState:UIControlStateNormal];
    [transitionFromViewToViewButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [transitionFromViewToViewButton addTarget:self action:@selector(onTransitionFromViewToViewClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: transitionFromViewToViewButton];
    
    UIButton *resetButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 540, 250, 30)];
    [resetButton setTitle:@"Reset" forState:UIControlStateNormal];
    [resetButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [resetButton addTarget:self action:@selector(onResetClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: resetButton];
}

- (void)onCurlUpAnimationClick:(UIButton *)sender {
    [UIView transitionWithView:self.magentaView duration:2 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        [self.redView removeFromSuperview];
    } completion:nil];
}

- (void)onCurlDownAnimationClick:(UIButton *)sender {
    [UIView transitionWithView:self.magentaView duration:2 options:UIViewAnimationOptionTransitionCurlDown animations:^{
        [self.magentaView addSubview:self.blueView];
    } completion:nil];
}

- (void)onCrossDissolveAnimationClick:(UIButton *)sender {
    [UIView transitionWithView:self.magentaView duration:2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [self.redView removeFromSuperview];
    } completion:nil];
}

- (void)onFlipFromLeftAnimationClick:(UIButton *)sender {
    [UIView transitionWithView:self.magentaView duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [self.magentaView addSubview: self.blueView];
    } completion:nil];
}

- (void)onFlipFromRightAnimationClick:(UIButton *)sender {
    [UIView transitionWithView:self.magentaView duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        [self.magentaView addSubview: self.blueView];
    } completion:nil];
}

- (void)onFlipFromTopAnimationClick:(UIButton *)sender {
    [UIView transitionWithView:self.magentaView duration:2 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        [self.magentaView addSubview: self.blueView];
    } completion:nil];
}

- (void)onFlipFromBottomAnimationClick:(UIButton *)sender {
    [UIView transitionWithView:self.magentaView duration:2 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        [self.magentaView addSubview: self.blueView];
    } completion:nil];
}

- (void)onTransitionFromViewToViewClick:(UIButton *) sender {
    [UIView transitionFromView:self.redView toView:self.blueView duration:2
               options:UIViewAnimationOptionTransitionCurlDown completion:nil];
}

- (void)onResetClick:(UIButton *)sender {
    [self.redView removeFromSuperview];
    [self.blueView removeFromSuperview];
    
    [self.magentaView addSubview: self.redView];
}

@end
