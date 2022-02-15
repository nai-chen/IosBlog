//
//  CAEmitterAnimationViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/2/14.
//

#import "CAEmitterAnimationViewController.h"

@interface CAEmitterAnimationViewController ()

@end

@implementation CAEmitterAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view.layer addSublayer:self.emitterLayer];
}

@end
