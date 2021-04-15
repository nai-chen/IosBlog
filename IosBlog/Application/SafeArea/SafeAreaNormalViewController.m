//
//  SafeAreaViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/4/14.
//

#import "SafeAreaNormalViewController.h"

@interface SafeAreaNormalViewController ()

/** 红色view 用于置顶 */
@property (nonatomic, strong) UIView * redView;

/** 橘色view 用于置底 */
@property (nonatomic, strong) UIView * orangeView;

@end

@implementation SafeAreaNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        
    self.title = @"屏幕适配";
    self.view.backgroundColor = [UIColor yellowColor];
    
    /** 创建红色view */
    UIView * redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    self.redView = redView;
    
    /** 创建橘色view */
    UIView * orangeView = [UIView new];
    orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeView];
    self.orangeView = orangeView;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

//    CGRect frame = self.view.frame;
//    NSLog(@"self.view - frame - %@", NSStringFromCGRect(frame));
//
//    CGRect layoutFrame = self.view.safeAreaLayoutGuide.layoutFrame;
//    NSLog(@"self.view - layoutFrame - %@", NSStringFromCGRect(layoutFrame));
//
//    UIEdgeInsets insets = self.view.safeAreaInsets;
//    NSLog(@"self.view - insets - %@", NSStringFromUIEdgeInsets(insets));
    
    /**
     layoutFrame.size.width 安全区域宽度
     layoutFrame.size.height 安全区域高度
     */
    CGRect layoutFrame = self.view.safeAreaLayoutGuide.layoutFrame;
    NSLog(@"self.view - layoutFrame - %@", NSStringFromCGRect(layoutFrame));
    
    /**
     inset.left 安全区域距离屏幕最左边的大小
     inset.right 安全区域距离屏幕最右边的大小
     inset.top 安全区域距离屏幕最上边的大小
     inset.bottom 安全区域距离屏幕最下边的大小
     */
    UIEdgeInsets insets = self.view.safeAreaInsets;
    
    /** 红色view置顶 */
    self.redView.frame = CGRectMake(insets.left, insets.top, layoutFrame.size.width, 100);
    
    /** 橘色view置底 */
    self.orangeView.frame = CGRectMake(insets.left, self.view.bounds.size.height - insets.bottom - 100, layoutFrame.size.width, 100);
}

@end
