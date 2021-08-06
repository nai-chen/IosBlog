//
//  UITextFieldKeyBoardViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/17.
//

#import "UITextFieldKeyBoardViewController.h"

@interface UITextFieldKeyBoardViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

@end

@implementation UITextFieldKeyBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self textFieldWithFrame:CGRectMake(20, 100, 150, 30) hint:@"Default" andKeyboardType:UIKeyboardTypeDefault];
    [self textFieldWithFrame:CGRectMake(190, 100, 150, 30) hint:@"ASCIICapable" andKeyboardType:UIKeyboardTypeASCIICapable];
    
    [self textFieldWithFrame:CGRectMake(20, 150, 150, 30) hint:@"NumbersAndPunctuation" andKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    [self textFieldWithFrame:CGRectMake(190, 150, 150, 30) hint:@"URL" andKeyboardType:UIKeyboardTypeURL];
    
    [self textFieldWithFrame:CGRectMake(20, 200, 150, 30) hint:@"NumbersPad" andKeyboardType:UIKeyboardTypeNumberPad];
    [self textFieldWithFrame:CGRectMake(190, 200, 150, 30) hint:@"PhonePad" andKeyboardType:UIKeyboardTypePhonePad];
    
    [self textFieldWithFrame:CGRectMake(20, 250, 150, 30) hint:@"NamePhonePad" andKeyboardType:UIKeyboardTypeNamePhonePad];
    [self textFieldWithFrame:CGRectMake(190, 250, 150, 30) hint:@"EmailAddress" andKeyboardType:UIKeyboardTypeEmailAddress];
    
    [self textFieldWithFrame:CGRectMake(20, 300, 150, 30) hint:@"DecimalPad" andKeyboardType:UIKeyboardTypeDecimalPad];
    [self textFieldWithFrame:CGRectMake(190, 300, 150, 30) hint:@"Twitter" andKeyboardType:UIKeyboardTypeTwitter];
    
    [self textFieldWithFrame:CGRectMake(20, 350, 150, 30) hint:@"WebSearch" andKeyboardType:UIKeyboardTypeWebSearch];
    [self textFieldWithFrame:CGRectMake(190, 350, 150, 30) hint:@"ASCIICapableNumberPad" andKeyboardType:UIKeyboardTypeASCIICapableNumberPad];
}

-(void) textFieldWithFrame:(CGRect)frame hint:(NSString*) hint andKeyboardType:(UIKeyboardType)type {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.placeholder = hint;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    textField.keyboardType = type;
    
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
    
    if (self.textField) {
        [self.textField resignFirstResponder];
    }
}

@end
