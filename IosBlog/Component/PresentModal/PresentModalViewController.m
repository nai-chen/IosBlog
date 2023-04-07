//
//  PresentModalViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/1/6.
//

#import "PresentModalViewController.h"

#import "PresentModalDialogViewController.h"
#import "PresentModalPopupViewController.h"
#import "PresentModalPopoverViewController.h"

@interface PresentModalViewController ()<UIPopoverPresentationControllerDelegate>

@property(nonatomic, assign) UIModalPresentationStyle presentationStyle;
@property(nonatomic, assign) UIModalTransitionStyle transitionStyle;
@property(nonatomic, strong) UIButton *presentationStyleButton;
@property(nonatomic, strong) UIButton *transitionStyleButton;

@end

@implementation PresentModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *showDialogButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 120, 50)];
    [showDialogButton setTitle:@"show dialog" forState:UIControlStateNormal];
    [showDialogButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [showDialogButton addTarget:self action:@selector(onShowDialogClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showDialogButton];
    
    UIButton *showPopupButton = [[UIButton alloc] initWithFrame:CGRectMake(130, 100, 120, 50)];
    [showPopupButton setTitle:@"show popup" forState:UIControlStateNormal];
    [showPopupButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [showPopupButton addTarget:self action:@selector(onShowPopupClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showPopupButton];
    
    UIButton *showPopoverButton = [[UIButton alloc] initWithFrame:CGRectMake(250, 100, 120, 50)];
    [showPopoverButton setTitle:@"show popover" forState:UIControlStateNormal];
    [showPopoverButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [showPopoverButton addTarget:self action:@selector(onShowPopoverClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showPopoverButton];
}

- (void)onShowDialogClick:(UIButton *)sender {
    PresentModalDialogViewController *dialogVc = [[PresentModalDialogViewController alloc] init];
    dialogVc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    dialogVc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    self.definesPresentationContext = YES;
    [self presentViewController:dialogVc animated:YES completion:^{
        NSLog(@"dialog show");
    }];
}

- (void)onShowPopupClick:(UIButton *)sender {
    PresentModalPopupViewController *popupVc = [[PresentModalPopupViewController alloc] init];
    popupVc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    popupVc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    self.definesPresentationContext = YES;
    [self presentViewController:popupVc animated:YES completion:^{
        NSLog(@"popup show");
    }];
}

- (void)onShowPopoverClick:(UIButton *)sender {
    PresentModalPopoverViewController *vc = [[PresentModalPopoverViewController alloc] init];
    vc.preferredContentSize = CGSizeMake(200, 100);
    vc.modalPresentationStyle = UIModalPresentationPopover;
    
    UIPopoverPresentationController *popoverVc = [vc popoverPresentationController];
    // 弹出窗控制器代理
    popoverVc.delegate = self;
    // 弹出窗箭头方向
    popoverVc.permittedArrowDirections = UIPopoverArrowDirectionUp;
    // 弹出窗显示的视图资源
    popoverVc.sourceView = sender;
    // 弹出窗显示的区域
    popoverVc.sourceRect = sender.bounds;
    // 弹出窗背景颜色
    popoverVc.backgroundColor = [UIColor blueColor];
    
    [self presentViewController:vc animated:TRUE completion:^{
        NSLog(@"popover show");
    }];
}

#pragma mark - UIPopoverPresentationControllerDelegate -
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

@end
