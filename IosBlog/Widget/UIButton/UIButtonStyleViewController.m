//
//  UIButtonStyleViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/16.
//

#import "UIButtonStyleViewController.h"
#import "UIColor+Tool.h"

@interface UIButtonStyleViewController ()

@property(nonatomic, strong) UIButton *btn;

@end

@implementation UIButtonStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake(20, 100, 320, 30);
    [self.btn setTitle:@"未选" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor colorWithHex:0xCACACA alpha:1.0] forState: UIControlStateNormal];
    [self.btn setImage:[UIImage imageNamed:@"choice"] forState:UIControlStateNormal];
    [self.btn setImage:[UIImage imageNamed:@"choice"] forState:UIControlStateHighlighted];
    
    [self.btn setTitle:@"已选" forState:UIControlStateSelected];
    [self.btn setTitle:@"已选" forState:UIControlStateSelected|UIControlStateHighlighted];
    [self.btn setTitleColor:[UIColor colorWithHex:0xC19A79 alpha:1.0] forState: UIControlStateSelected];
    [self.btn setTitleColor:[UIColor colorWithHex:0xC19A79 alpha:1.0] forState: UIControlStateSelected|UIControlStateHighlighted];
    [self.btn setImage:[UIImage imageNamed:@"choice_s"] forState:UIControlStateSelected];
    [self.btn setImage:[UIImage imageNamed:@"choice_s"] forState:UIControlStateSelected|UIControlStateHighlighted];
    
    [self.btn addTarget:self action:@selector(singleTap:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.btn];
    
    UIButton *shadowButton = [UIButton buttonWithType:UIButtonTypeCustom];
    shadowButton.frame = CGRectMake(20, 150, 320, 30);
    [shadowButton setTitle:@"Shadow Color" forState:UIControlStateNormal];
    [shadowButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shadowButton setTitleShadowColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [shadowButton.titleLabel setShadowOffset:CGSizeMake(2, 2)];
    
    [self.view addSubview:shadowButton];
    
    UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    imageButton.frame = CGRectMake(80, 215, 55, 30);
    [imageButton setBackgroundImage:[UIImage imageNamed:@"btn_switch_off"] forState:UIControlStateNormal];
    [imageButton setBackgroundImage:[UIImage imageNamed:@"btn_switch_on"] forState:UIControlStateSelected];
    [imageButton addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventTouchUpInside];
    imageButton.adjustsImageWhenHighlighted = NO;
    imageButton.showsTouchWhenHighlighted = NO;
    
    [self.view addSubview:imageButton];
    
    UIButton *backgroundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backgroundButton.frame = CGRectMake(180, 200, 110, 60);
    [backgroundButton setBackgroundImage:[UIImage imageNamed:@"btn_switch_off"] forState:UIControlStateNormal];
    [backgroundButton setBackgroundImage:[UIImage imageNamed:@"btn_switch_on"] forState:UIControlStateSelected];
    [backgroundButton addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventTouchUpInside];
    backgroundButton.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:backgroundButton];
}

- (void)singleTap:(id)sender {
    self.btn.selected = !self.btn.selected;
}

- (void)switchChanged:(id)sender {
    UIButton *backgroundButton = sender;
    backgroundButton.selected = !backgroundButton.selected;
}

@end
