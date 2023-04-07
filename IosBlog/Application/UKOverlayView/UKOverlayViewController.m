//
//  UKOverlayViewController.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/7.
//

#import "UKOverlayViewController.h"

#import "UKOverlayView.h"

@interface UKOverlayViewController ()

@property(nonatomic, strong) UIButton *addOverayViewButton;
@property(nonatomic, strong) UIButton *removeOverayViewButton;

@property(nonatomic, strong) UKOverlayView *overlayView;

@end

@implementation UKOverlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.addOverayViewButton];
    
    [self.view addSubview:self.removeOverayViewButton];
    
}

- (UIButton *)addOverayViewButton {
    if (!_addOverayViewButton) {
        _addOverayViewButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 140, 200, 50)];
        [_addOverayViewButton setTitle:@"Add Overlay View" forState:UIControlStateNormal];
        [_addOverayViewButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [_addOverayViewButton addTarget:self action:@selector(onAddClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addOverayViewButton;
}

- (void)onAddClick:(UIButton *)sender {
    [self.view addSubview:self.overlayView];
}

- (UIButton *)removeOverayViewButton {
    if (!_removeOverayViewButton) {
        _removeOverayViewButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 200, 50)];
        [_removeOverayViewButton setTitle:@"Remove Overlay View" forState:UIControlStateNormal];
        [_removeOverayViewButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [_removeOverayViewButton addTarget:self action:@selector(onRemoveClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _removeOverayViewButton;
}

- (void)onRemoveClick:(UIButton *)sender {
    [self.overlayView removeFromSuperview];
}

- (UKOverlayView *)overlayView {
    if (!_overlayView) {
        UIScreen *screen = [UIScreen mainScreen];
        _overlayView = [[UKOverlayView alloc] initWithFrame:screen.bounds];
    }
    return _overlayView;
}

@end
