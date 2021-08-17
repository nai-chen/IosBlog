//
//  AnimationCurveViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/7.
//

#import "AnimationCurveViewController.h"

@interface AnimationCurveViewController ()

@property(nonatomic, strong) UIImageView *easeInOutImageView;
@property(nonatomic, strong) UIImageView *easeInImageView;
@property(nonatomic, strong) UIImageView *easeOutImageView;
@property(nonatomic, strong) UIImageView *linearImageView;

@end

@implementation AnimationCurveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *easeInOutLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 80, 82, 20)];
    easeInOutLabel.text = @"inOut";
    easeInOutLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:easeInOutLabel];
    
    self.easeInOutImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 400, 32, 32)];
    self.easeInOutImageView.image = [UIImage imageNamed:@"icon_star"];
    [self.view addSubview: self.easeInOutImageView];
    
    UILabel *easeInLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 80, 82, 20)];
    easeInLabel.text = @"in";
    easeInLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:easeInLabel];
    
    self.easeInImageView = [[UIImageView alloc] initWithFrame:CGRectMake(125, 400, 32, 32)];
    self.easeInImageView.image = [UIImage imageNamed:@"icon_star"];
    [self.view addSubview: self.easeInImageView];
    
    UILabel *easeOutLabel = [[UILabel alloc] initWithFrame:CGRectMake(175, 80, 82, 20)];
    easeOutLabel.text = @"out";
    easeOutLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:easeOutLabel];
    
    self.easeOutImageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 400, 32, 32)];
    self.easeOutImageView.image = [UIImage imageNamed:@"icon_star"];
    [self.view addSubview: self.easeOutImageView];
    
    UILabel *linearLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 80, 82, 20)];
    linearLabel.text = @"linear";
    linearLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:linearLabel];
    
    self.linearImageView = [[UIImageView alloc] initWithFrame:CGRectMake(275, 400, 32, 32)];
    self.linearImageView.image = [UIImage imageNamed:@"icon_star"];
    [self.view addSubview: self.linearImageView];
    
    UIButton *curveButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 450, 100, 30)];
    [curveButton setTitle:@"animation" forState:UIControlStateNormal];
    [curveButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [curveButton addTarget:self action:@selector(onCurveAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: curveButton];
    
    UIButton *resetButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 450, 100, 30)];
    [resetButton setTitle:@"reset" forState:UIControlStateNormal];
    [resetButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [resetButton addTarget:self action:@selector(onResetClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: resetButton];
}

- (void)onCurveAnimation:(UIButton *)sender {
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.easeInOutImageView.frame = CGRectMake(50, 100, 32, 32);
    } completion:nil];
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.easeInImageView.frame = CGRectMake(125, 100, 32, 32);
    } completion:nil];

    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.easeOutImageView.frame = CGRectMake(200, 100, 32, 32);
    } completion:nil];

    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.linearImageView.frame = CGRectMake(275, 100, 32, 32);
    } completion:nil];

}

- (void)onResetClick:(UIButton *)sender {
    self.easeInOutImageView.frame = CGRectMake(50, 400, 32, 32);
    self.easeInImageView.frame = CGRectMake(125, 400, 32, 32);
    self.easeOutImageView.frame = CGRectMake(200, 400, 32, 32);
    self.linearImageView.frame = CGRectMake(275, 400, 32, 32);
}

@end
