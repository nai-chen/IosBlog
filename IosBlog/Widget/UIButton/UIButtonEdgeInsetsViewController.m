//
//  UIButtonEdgeInsetsViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/16.
//

#import "UIButtonEdgeInsetsViewController.h"
#import "UIColor+Tool.h"

@interface UIButtonEdgeInsetsViewController ()

@end

@implementation UIButtonEdgeInsetsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *normalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    normalBtn.frame = CGRectMake(20, 120, 320, 60);
    [normalBtn setTitle:@"已选" forState:UIControlStateNormal];
    [normalBtn setTitleColor:[UIColor colorWithHex:0xC19A79 alpha:1.0] forState: UIControlStateNormal];
    [normalBtn setImage:[UIImage imageNamed:@"choice_s"] forState:UIControlStateNormal];
    [normalBtn setBackgroundColor:[UIColor darkGrayColor]];
    normalBtn.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:normalBtn];
    
    UIButton *edgeInsetsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    edgeInsetsBtn.frame = CGRectMake(20, 200, 320, 60);
    edgeInsetsBtn.contentEdgeInsets = UIEdgeInsetsMake(10, 50, 0, 0);
    [edgeInsetsBtn setTitle:@"已选" forState:UIControlStateNormal];
    [edgeInsetsBtn setTitleColor:[UIColor colorWithHex:0xC19A79 alpha:1.0] forState: UIControlStateNormal];
    [edgeInsetsBtn setImage:[UIImage imageNamed:@"choice_s"] forState:UIControlStateNormal];
    [edgeInsetsBtn setBackgroundColor:[UIColor darkGrayColor]];
    edgeInsetsBtn.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:edgeInsetsBtn];
    
    UIButton *titleEdgeInsetsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    titleEdgeInsetsBtn.frame = CGRectMake(20, 280, 320, 60);
    titleEdgeInsetsBtn.titleEdgeInsets = UIEdgeInsetsMake(10, 50, 0, 0);
    [titleEdgeInsetsBtn setTitle:@"已选" forState:UIControlStateNormal];
    [titleEdgeInsetsBtn setTitleColor:[UIColor colorWithHex:0xC19A79 alpha:1.0] forState: UIControlStateNormal];
    [titleEdgeInsetsBtn setImage:[UIImage imageNamed:@"choice_s"] forState:UIControlStateNormal];
    [titleEdgeInsetsBtn setBackgroundColor:[UIColor darkGrayColor]];
    titleEdgeInsetsBtn.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:titleEdgeInsetsBtn];
    
    UIButton *imageEdgeInsetsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imageEdgeInsetsBtn.frame = CGRectMake(20, 360, 320, 60);
    imageEdgeInsetsBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, -10, 50);
    [imageEdgeInsetsBtn setTitle:@"已选" forState:UIControlStateNormal];
    [imageEdgeInsetsBtn setTitleColor:[UIColor colorWithHex:0xC19A79 alpha:1.0] forState: UIControlStateNormal];
    [imageEdgeInsetsBtn setImage:[UIImage imageNamed:@"choice_s"] forState:UIControlStateNormal];
    [imageEdgeInsetsBtn setBackgroundColor:[UIColor darkGrayColor]];
    imageEdgeInsetsBtn.adjustsImageWhenHighlighted = NO;
        
    [self.view addSubview:imageEdgeInsetsBtn];

}

@end
