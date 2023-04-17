//
//  UKAutographViewController.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/17.
//

#import "UKAutographViewController.h"

#import "UKAutographView.h"

#import "UIColor+Tool.h"

@interface UKAutographViewController () <UKAutographViewDelegate>

@property(nonatomic, strong) UIView *contentView;
@property(nonatomic, strong) UKAutographView *autographView;
@property(nonatomic, strong) UILabel *tipsLabel;
@property(nonatomic, strong) UIButton *reSignButton;
@property(nonatomic, strong) UIButton *confirmButton;

@property(nonatomic, strong) UIImageView *showImageView;

@end

@implementation UKAutographViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupInitialUI];
}

- (void)setupInitialUI {
    UIView *separatorLine1 = [[UIView alloc] init];
    separatorLine1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:separatorLine1];
    [separatorLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@0.5);
        make.top.equalTo(self.view).offset(kStatusBarHeight + 49);
    }];
    
    [self.view addSubview:self.contentView];
    
    [self.contentView addSubview:self.autographView];
    [self.autographView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-70);
    }];

    [self.contentView addSubview:self.tipsLabel];
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.autographView);
        make.width.equalTo(@300);
        make.height.equalTo(@20);
    }];
    
    [self.contentView addSubview:self.showImageView];
    [self.showImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView);
        make.width.equalTo(@100);
        make.height.equalTo(@80);
    }];

    UIView *separatorLine2 = [[UIView alloc] init];
    separatorLine2.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:separatorLine2];
    [separatorLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.height.equalTo(@0.5);
        make.top.equalTo(self.autographView.mas_bottom);
    }];

    [self.contentView addSubview:self.reSignButton];
    [self.reSignButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(25);
        make.width.equalTo(self.contentView).multipliedBy(0.5).offset(-35);
        make.top.equalTo(self.autographView.mas_bottom).offset(10);
        make.height.equalTo(@50);
    }];

    [self.contentView addSubview:self.confirmButton];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-25);
        make.width.equalTo(self.contentView).multipliedBy(0.5).offset(-35);
        make.top.equalTo(self.autographView.mas_bottom).offset(10);
        make.height.equalTo(@50);
    }];
    
}

- (UIView *)contentView {
    if (!_contentView) {
        CGFloat width = kScreenHeight - kStatusBarHeight - 50 - kBottomSafeHeight;
        CGFloat height = kScreenWidth;
        CGPoint center = CGPointMake(height/2, kStatusBarHeight + 50 + width / 2);
        
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(center.x - width/2, center.y - height/2, width, height)];
        [_contentView setTransform:CGAffineTransformMakeRotation(M_PI_2)];
    }
    return _contentView;
}

- (UKAutographView *)autographView {
    if (!_autographView) {
        _autographView = [[UKAutographView alloc] init];
        
        _autographView.delegate = self;
    }
    return _autographView;
}

- (UILabel *)tipsLabel {
    if (!_tipsLabel) {
        _tipsLabel = [[UILabel alloc] init];
        _tipsLabel.text = @"请在此空白区域签署您的姓名";
        _tipsLabel.textColor = [UIColor lightGrayColor];
        [_tipsLabel setFont:[UIFont systemFontOfSize:14]];
        _tipsLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _tipsLabel;
}

- (UIImageView *)showImageView {
    if (!_showImageView) {
        _showImageView = [[UIImageView alloc] init];
        _showImageView.backgroundColor = [UIColor yellowColor];
        _showImageView.hidden = YES;
    }
    return _showImageView;
}

- (UIButton *)reSignButton {
    if (!_reSignButton) {
        _reSignButton = [[UIButton alloc] init];
        
        [_reSignButton setTitle:@"重签" forState:UIControlStateNormal];
        [_reSignButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_reSignButton.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
        
        _reSignButton.layer.cornerRadius = 3;
        _reSignButton.layer.masksToBounds = YES;
        _reSignButton.layer.borderColor = [UIColor blueColor].CGColor;
        _reSignButton.layer.borderWidth = 1;
        
        [_reSignButton setAdjustsImageWhenHighlighted:NO];
        
        [_reSignButton addTarget:self action:@selector(reSignClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reSignButton;
}

- (void)reSignClick:(UIButton *)sender {
    [self.autographView clear];
    self.confirmButton.enabled = NO;
    self.tipsLabel.hidden = NO;
    self.showImageView.hidden = YES;
}

- (UIButton *)confirmButton {
    if (!_confirmButton) {
        _confirmButton = [[UIButton alloc] init];
        [_confirmButton setTitle:@"提交" forState:UIControlStateNormal];
        [_confirmButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
 
        [_confirmButton setBackgroundImage:[[UIColor blueColor] colorToImage] forState:UIControlStateNormal];
        [_confirmButton setBackgroundImage:[[UIColor darkGrayColor] colorToImage] forState:UIControlStateDisabled];

        _confirmButton.layer.cornerRadius = 3;
        _confirmButton.layer.masksToBounds = YES;

        [_confirmButton setEnabled: NO];
        [_confirmButton setAdjustsImageWhenHighlighted:NO];
        
        [_confirmButton addTarget:self action:@selector(confirmClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmButton;
}

- (void)confirmClick:(UIButton *)sender {
    UIImage *autographImage = [self.autographView save];/var/folders/wz/blmv9rsx6b39m59g4mcvg7v40000gp/T/simulator_screenshot_8A268390-1898-4451-8884-BBCBD6225651.png
    self.showImageView.image = autographImage;
    self.showImageView.hidden = NO;
}

#pragma mark - UKAutographViewDelegate -
- (void)autographViewDidBegin:(UKAutographView *)autographView {
    self.confirmButton.enabled = YES;
    self.tipsLabel.hidden = YES;
    self.showImageView.hidden = YES;
}

@end
