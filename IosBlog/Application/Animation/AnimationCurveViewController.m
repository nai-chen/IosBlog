//
//  AnimationCurveViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/7.
//

#import "AnimationCurveViewController.h"

@interface AnimationCurveViewController ()

@property (nonatomic, strong) UIImageView* easeInOutImageView;
@property (nonatomic, strong) UIImageView* easeInImageView;
@property (nonatomic, strong) UIImageView* easeOutImageView;
@property (nonatomic, strong) UIImageView* linearImageView;

@end

@implementation AnimationCurveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.easeInOutImageView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 400, 32, 32)];
    self.easeInOutImageView.image = [UIImage imageNamed:@"icon_star"];
    [self.view addSubview: self.easeInOutImageView];
    
    self.easeInImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 400, 32, 32)];
    self.easeInImageView.image = [UIImage imageNamed:@"icon_star"];
    [self.view addSubview: self.easeInImageView];
    
    self.easeOutImageView = [[UIImageView alloc] initWithFrame:CGRectMake(175, 400, 32, 32)];
    self.easeOutImageView.image = [UIImage imageNamed:@"icon_star"];
    [self.view addSubview: self.easeOutImageView];
    
    self.linearImageView = [[UIImageView alloc] initWithFrame:CGRectMake(250, 400, 32, 32)];
    self.linearImageView.image = [UIImage imageNamed:@"icon_star"];
    [self.view addSubview: self.linearImageView];
    
    UIButton* curveButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 450, 100, 30)];
    [curveButton setTitle:@"animation" forState:UIControlStateNormal];
    [curveButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [curveButton addTarget:self action:@selector(onCurveAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: curveButton];
    
    UIButton* resetButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 450, 100, 30)];
    [resetButton setTitle:@"reset" forState:UIControlStateNormal];
    [resetButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [resetButton addTarget:self action:@selector(onResetClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: resetButton];
}

-(void) onCurveAnimation: (UIButton*) sender {
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.easeInOutImageView.frame = CGRectMake(25, 100, 32, 32);
    } completion:nil];
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.easeInImageView.frame = CGRectMake(100, 100, 32, 32);
    } completion:nil];

    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.easeOutImageView.frame = CGRectMake(175, 100, 32, 32);
    } completion:nil];

    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.linearImageView.frame = CGRectMake(250, 100, 32, 32);
    } completion:nil];

}

-(void) onResetClick: (UIButton*) sender {
    self.easeInOutImageView.frame = CGRectMake(25, 400, 32, 32);
    self.easeInImageView.frame = CGRectMake(100, 400, 32, 32);
    self.easeOutImageView.frame = CGRectMake(175, 400, 32, 32);
    self.linearImageView.frame = CGRectMake(250, 400, 32, 32);
}

@end
