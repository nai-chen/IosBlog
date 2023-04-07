//
//  UKMobileVerifyViewController.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/7.
//

#import "UKMobileVerifyViewController.h"

#import "UKMobileVerifyView.h"

@interface UKMobileVerifyViewController () <UKMobileVerifyViewDelegate>

@property(nonatomic, strong) UKMobileVerifyView *mobileVerifyView;

@end

@implementation UKMobileVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mobileVerifyView];
}

- (UKMobileVerifyView *)mobileVerifyView {
    if (!_mobileVerifyView) {
        _mobileVerifyView = [[UKMobileVerifyView alloc] initWithFrame:CGRectMake(50, 100, 250, 60)];
        _mobileVerifyView.delegate = self;
    }
    return _mobileVerifyView;
}

#pragma mark - UKMobileVerifyViewDelegate -
- (void)mobileVerifyDidFinish:(NSString *)text {
    NSLog(@"mobileVerifyDidFinish text = %@", text);
}

@end
