//
//  SVProgressHUDStyleViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/1/13.
//

#import "SVProgressHUDStyleViewController.h"

#import "SVProgressHUD.h"

@interface SVProgressHUDStyleViewController ()

@property(nonatomic, assign) SVProgressHUDStyle style;
@property(nonatomic, assign) SVProgressHUDMaskType maskType;
@property(nonatomic, assign) SVProgressHUDAnimationType animationType;

@property(nonatomic, strong) UIButton *styleButton;
@property(nonatomic, strong) UIButton *maskTypeButton;
@property(nonatomic, strong) UIButton *animTypeButton;

@end

@implementation SVProgressHUDStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self makeStyleButton:CGRectMake(30, 100, 200, 30) title:@"StyleLight" style:SVProgressHUDStyleLight cheked:YES];
    [self makeStyleButton:CGRectMake(30, 130, 200, 30) title:@"StyleDark" style:SVProgressHUDStyleDark cheked:NO];
    [self makeStyleButton:CGRectMake(30, 160, 200, 30) title:@"StyleCustom" style:SVProgressHUDStyleCustom cheked:NO];
    
    [self makeMaskTypeButton:CGRectMake(30, 220, 200, 30) title:@"MaskTypeNone" style:SVProgressHUDMaskTypeNone cheked:YES];
    [self makeMaskTypeButton:CGRectMake(30, 250, 200, 30) title:@"MaskTypeClear" style:SVProgressHUDMaskTypeClear cheked:NO];
    [self makeMaskTypeButton:CGRectMake(30, 280, 200, 30) title:@"MaskTypeBlack" style:SVProgressHUDMaskTypeBlack cheked:NO];
    [self makeMaskTypeButton:CGRectMake(30, 310, 200, 30) title:@"MaskTypeGradient" style:SVProgressHUDMaskTypeGradient cheked:NO];
    [self makeMaskTypeButton:CGRectMake(30, 340, 200, 30) title:@"MaskTypeCustom" style:SVProgressHUDMaskTypeCustom cheked:NO];
    
    [self makeAnimTypeButton:CGRectMake(30, 400, 200, 30) title:@"AnimationTypeFlat" style:SVProgressHUDAnimationTypeFlat cheked:YES];
    [self makeAnimTypeButton:CGRectMake(30, 430, 200, 30) title:@"AnimationTypeNative" style:SVProgressHUDAnimationTypeNative cheked:NO];
    
    UIButton *showButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 490, 100, 30)];
    [showButton setTitle:@"show" forState:UIControlStateNormal];
    [showButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [showButton addTarget:self action:@selector(onShowClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showButton];
    
    UIButton *dismissButton = [[UIButton alloc] initWithFrame:CGRectMake(160, 490, 100, 30)];
    [dismissButton setTitle:@"dismiss" forState:UIControlStateNormal];
    [dismissButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [dismissButton addTarget:self action:@selector(onDismissClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismissButton];
}

- (void)onShowClick:(UIButton *)sender {
    [SVProgressHUD setDefaultStyle:self.style];
    if (SVProgressHUDStyleCustom == self.style) {
//        [SVProgressHUD setForegroundColor:[UIColor greenColor]];
//        [SVProgressHUD setBackgroundColor:[UIColor blueColor]];
//        [SVProgressHUD setBackgroundLayerColor:[UIColor whiteColor]];
    }

    [SVProgressHUD setDefaultMaskType:self.maskType];
    [SVProgressHUD setDefaultAnimationType:self.animationType];    

    [SVProgressHUD showWithStatus:@"加载中..."];
    
    [SVProgressHUD dismissWithDelay:5];
}

- (void)onDismissClick:(UIButton *)sender {
    [SVProgressHUD dismiss];
}

- (void)makeStyleButton:(CGRect)frame title:(NSString *)title style:(SVProgressHUDStyle)style cheked:(BOOL)check {
    UIButton *styleButton = [[UIButton alloc] initWithFrame:frame];
    [styleButton setTitle:title forState:UIControlStateNormal];
    [styleButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    if (check) {
        [styleButton setImage:[UIImage imageNamed:@"choice_s"] forState:UIControlStateNormal];
        self.style = style;
        self.styleButton = styleButton;
    } else {
        [styleButton setImage:[UIImage imageNamed:@"choice"] forState:UIControlStateNormal];
    }
    
    [styleButton addTarget:self action:@selector(onStyleClick:) forControlEvents:UIControlEventTouchUpInside];
    styleButton.tag = style;
    
    [self.view addSubview:styleButton];
}

- (void)onStyleClick:(UIButton *)sender {
    if (sender != self.styleButton) {
        self.style = sender.tag;
        
        [self.styleButton setImage:[UIImage imageNamed:@"choice"] forState:UIControlStateNormal];
        [sender setImage:[UIImage imageNamed:@"choice_s"] forState:UIControlStateNormal];

        self.styleButton = sender;
    }
}

- (void)makeMaskTypeButton:(CGRect)frame title:(NSString *)title style:(SVProgressHUDMaskType)maskType cheked:(BOOL)check {
    UIButton *maskTypeButton = [[UIButton alloc] initWithFrame:frame];
    [maskTypeButton setTitle:title forState:UIControlStateNormal];
    [maskTypeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    if (check) {
        [maskTypeButton setImage:[UIImage imageNamed:@"choice_s"] forState:UIControlStateNormal];
        self.maskType = maskType;
        self.maskTypeButton = maskTypeButton;
    } else {
        [maskTypeButton setImage:[UIImage imageNamed:@"choice"] forState:UIControlStateNormal];
    }
    
    [maskTypeButton addTarget:self action:@selector(onMaskTypeClick:) forControlEvents:UIControlEventTouchUpInside];
    maskTypeButton.tag = maskType;
    
    [self.view addSubview:maskTypeButton];
}

- (void)onMaskTypeClick:(UIButton *)sender {
    if (sender != self.maskTypeButton) {
        self.maskType = sender.tag;
        
        [self.maskTypeButton setImage:[UIImage imageNamed:@"choice"] forState:UIControlStateNormal];
        [sender setImage:[UIImage imageNamed:@"choice_s"] forState:UIControlStateNormal];

        self.maskTypeButton = sender;
    }
}

- (void)makeAnimTypeButton:(CGRect)frame title:(NSString *)title style:(SVProgressHUDAnimationType)animType cheked:(BOOL)check {
    UIButton *animTypeButton = [[UIButton alloc] initWithFrame:frame];
    [animTypeButton setTitle:title forState:UIControlStateNormal];
    [animTypeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    if (check) {
        [animTypeButton setImage:[UIImage imageNamed:@"choice_s"] forState:UIControlStateNormal];
        self.animationType = animType;
        self.animTypeButton = animTypeButton;
    } else {
        [animTypeButton setImage:[UIImage imageNamed:@"choice"] forState:UIControlStateNormal];
    }
    
    [animTypeButton addTarget:self action:@selector(onAnimTypeClick:) forControlEvents:UIControlEventTouchUpInside];
    animTypeButton.tag = animType;
    
    [self.view addSubview:animTypeButton];
}

- (void)onAnimTypeClick:(UIButton *)sender {
    if (sender != self.animTypeButton) {
        self.animationType = sender.tag;
        
        [self.animTypeButton setImage:[UIImage imageNamed:@"choice"] forState:UIControlStateNormal];
        [sender setImage:[UIImage imageNamed:@"choice_s"] forState:UIControlStateNormal];

        self.animTypeButton = sender;
    }
}

@end
