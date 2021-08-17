//
//  UITextFieldReturnTypeViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/17.
//

#import "UITextFieldReturnTypeViewController.h"

@interface UITextFieldReturnTypeViewController () <UITextFieldDelegate>

@property(nonatomic, strong) UITextField *textField;

@end

@implementation UITextFieldReturnTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self textFieldWithFrame:CGRectMake(20, 100, 150, 30) hint:@"Default" andReturnType:UIReturnKeyDefault];
    [self textFieldWithFrame:CGRectMake(190, 100, 150, 30) hint:@"Go" andReturnType:UIReturnKeyGo];
    
    [self textFieldWithFrame:CGRectMake(20, 150, 150, 30) hint:@"Google" andReturnType:UIReturnKeyGoogle];
    [self textFieldWithFrame:CGRectMake(190, 150, 150, 30) hint:@"Join" andReturnType:UIReturnKeyJoin];
    
    [self textFieldWithFrame:CGRectMake(20, 200, 150, 30) hint:@"Next" andReturnType:UIReturnKeyNext];
    [self textFieldWithFrame:CGRectMake(190, 200, 150, 30) hint:@"Route" andReturnType:UIReturnKeyRoute];
    
    [self textFieldWithFrame:CGRectMake(20, 250, 150, 30) hint:@"Search" andReturnType:UIReturnKeySearch];
    [self textFieldWithFrame:CGRectMake(190, 250, 150, 30) hint:@"Send" andReturnType:UIReturnKeySend];
    
    [self textFieldWithFrame:CGRectMake(20, 300, 150, 30) hint:@"Yahoo" andReturnType:UIReturnKeyYahoo];
    [self textFieldWithFrame:CGRectMake(190, 300, 150, 30) hint:@"Done" andReturnType:UIReturnKeyDone];
    
    [self textFieldWithFrame:CGRectMake(20, 350, 150, 30) hint:@"EmergencyCall" andReturnType:UIReturnKeyEmergencyCall];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)keyboardHide:(UITapGestureRecognizer *)tap{
    NSLog(@"keyboardHide");
    if (self.textField) {
        [self.textField resignFirstResponder];
    }
}

- (void)textFieldWithFrame:(CGRect)frame hint:(NSString *) hint andReturnType:(UIReturnKeyType)type {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.placeholder = hint;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    textField.returnKeyType = type;
    
    if ([hint isEqual:@"Go"]) {
        textField.keyboardAppearance = UIKeyboardAppearanceDark;
    } else if ([hint isEqual:@"Search"]) {
        textField.keyboardAppearance = UIKeyboardAppearanceLight;
    }
    
    [self.view addSubview:textField];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"textFieldShouldBeginEditing");
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"textFieldDidBeginEditing");
    
    self.textField = textField;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"textFieldShouldEndEditing");
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"textFieldDidEndEditing");
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    NSLog(@"textFieldDidEndEditing reason");
    
    self.textField = nil;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string; {
    NSLog(@"[%ld %ld] %@", range.location, range.length, string);
    return TRUE;
}

- (void)textFieldDidChangeSelection:(UITextField *)textField {
    NSLog(@"textFieldDidChangeSelection");
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    NSLog(@"textFieldShouldClear");
    
    return TRUE;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"textFieldShouldReturn");
    
    [textField resignFirstResponder];
    return TRUE;
}

@end
