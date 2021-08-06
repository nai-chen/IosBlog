//
//  UITextFieldNormalViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/16.
//

#import "UITextFieldNormalViewController.h"

@interface UITextFieldNormalViewController ()

@end

@implementation UITextFieldNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITextField *textField = [self textFiledWithFrame: CGRectMake(20, 100, 320, 40)];
    textField.backgroundColor = [UIColor grayColor];
    [self.view addSubview:textField];
    
    textField = [self textFiledWithFrame: CGRectMake(20, 160, 320, 40) borderStyle:UITextBorderStyleLine];
    [self.view addSubview:textField];
    
    textField = [self textFiledWithFrame: CGRectMake(20, 220, 320, 40) borderStyle:UITextBorderStyleBezel];
    [self.view addSubview:textField];
    
    textField = [self textFiledWithFrame: CGRectMake(20, 280, 320, 40) borderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:textField];
}

-(UITextField *)textFiledWithFrame:(CGRect)frame {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.textColor = [UIColor whiteColor];
    textField.textAlignment = NSTextAlignmentCenter;
    textField.font = [UIFont systemFontOfSize:14];
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes: @{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    textField.secureTextEntry = YES;
    return textField;
}

-(UITextField *)textFiledWithFrame:(CGRect)frame borderStyle:(UITextBorderStyle)borderStyle {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.textColor = [UIColor blackColor];
    textField.textAlignment = NSTextAlignmentCenter;
    textField.font = [UIFont systemFontOfSize:14];
    textField.placeholder = @"请输入 ";
    textField.borderStyle = borderStyle;
    return textField;
}

@end
