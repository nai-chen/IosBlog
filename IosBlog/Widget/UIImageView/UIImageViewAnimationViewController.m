//
//  UIImageViewAnimationViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/12.
//

#import "UIImageViewAnimationViewController.h"

@interface UIImageViewAnimationViewController ()
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation UIImageViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageView = [[UIImageView alloc] initWithFrame: CGRectMake(80, 100, 160, 110)];
    self.imageView.animationImages = @[[UIImage imageNamed:@"gif_00"],
                                  [UIImage imageNamed:@"gif_01"],
                                  [UIImage imageNamed:@"gif_02"],
                                  [UIImage imageNamed:@"gif_03"],
                                  [UIImage imageNamed:@"gif_04"],
                                  [UIImage imageNamed:@"gif_05"],
                                  [UIImage imageNamed:@"gif_06"],
                                  [UIImage imageNamed:@"gif_07"],
                                  [UIImage imageNamed:@"gif_08"],
                                  [UIImage imageNamed:@"gif_09"],
                                  [UIImage imageNamed:@"gif_10"],
                                  [UIImage imageNamed:@"gif_11"],
                                  [UIImage imageNamed:@"gif_12"],
                                  [UIImage imageNamed:@"gif_13"],
                                  [UIImage imageNamed:@"gif_14"]];
    self.imageView.animationDuration = 1;
    self.imageView.animationRepeatCount = 1;
    self.imageView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview: self.imageView];
    
    UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 240, 160, 30)];
    [startButton setTitle:@"start" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [startButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: startButton];
}

-(void) buttonClick:(id)sender {
//    [self.imageView stopAnimating];
    [self.imageView startAnimating];
}

@end
