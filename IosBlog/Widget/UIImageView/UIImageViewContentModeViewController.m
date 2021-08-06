//
//  UIImageViewContentModeViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/12.
//

#import "UIImageViewContentModeViewController.h"

@interface UIImageViewContentModeViewController ()

@end

@implementation UIImageViewContentModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self imageView:CGRectMake(20, 100, 100, 100) contentMode: UIViewContentModeScaleToFill];
    [self imageView:CGRectMake(130, 100, 100, 100) contentMode: UIViewContentModeScaleAspectFit];
    [self imageView:CGRectMake(240, 100, 100, 100) contentMode: UIViewContentModeScaleAspectFill];

    [self imageView:CGRectMake(10, 220, 110, 110) contentMode: UIViewContentModeTopLeft];
    [self imageView:CGRectMake(130, 220, 110, 110) contentMode: UIViewContentModeTop];
    [self imageView:CGRectMake(250, 220, 110, 110) contentMode: UIViewContentModeTopRight];
    
    [self imageView:CGRectMake(10, 340, 110, 110) contentMode: UIViewContentModeLeft];
    [self imageView:CGRectMake(130, 340, 110, 110) contentMode: UIViewContentModeCenter];
    [self imageView:CGRectMake(250, 340, 110, 110) contentMode: UIViewContentModeRight];
    
    [self imageView:CGRectMake(10, 460, 110, 110) contentMode: UIViewContentModeBottomLeft];
    [self imageView:CGRectMake(130, 460, 110, 110) contentMode: UIViewContentModeBottom];
    [self imageView:CGRectMake(250, 460, 110, 110) contentMode: UIViewContentModeBottomRight];
}

-(void) imageView:(CGRect)rect contentMode:(UIViewContentMode)mode {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.backgroundColor = [UIColor blackColor];
    imageView.image = [UIImage imageNamed:@"icon_iv_sample"];
    imageView.contentMode = mode;
    [self.view addSubview:imageView];
}

@end
