//
//  UITextFieldNotificationViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/17.
//

#import "UITextFieldNotificationViewController.h"

@interface UITextFieldNotificationViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField* textField;
@property (nonatomic) BOOL move;

@end

@implementation UITextFieldNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:)
             name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:)
             name:UIKeyboardWillHideNotification object:nil];
    
    UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 320, 30)];
    textField.placeholder = @"请输入";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    
    [self.view addSubview:textField];

    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(20, height - 100, 320, 30)];
    textField.placeholder = @"请输入";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    
    [self.view addSubview:textField];
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(20, height - 50, 320, 30)];
    textField.placeholder = @"请输入";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.keyboardType = UIKeyboardTypePhonePad;
    textField.delegate = self;
    
    [self.view addSubview:textField];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) keyboardWillShow:(NSNotification*) notification {
    NSLog(@"keyboardWillShow");
    
    NSDictionary* userinfo = [notification userInfo];
    NSValue* value = [userinfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardFrame = [value CGRectValue];
    NSLog(@"keyboard y = %f", keyboardFrame.origin.y);
    NSLog(@"keyboard Height = %f", keyboardFrame.size.height);
    
    float keyboardHeight = keyboardFrame.size.height;
    float textFieldHeight = CGRectGetMaxY(self.textField.frame);
    NSLog(@"textField height = %f", textFieldHeight);
    
    CGFloat bottomHeight = self.view.frame.size.height - textFieldHeight;
    CGFloat distance = bottomHeight - 5.0 - keyboardHeight;
    
    NSLog(@"bottomHeight = %f", bottomHeight);
    NSLog(@"distance = %f", distance);

    if (distance < 0) {
        self.move = TRUE;
        [UIView animateWithDuration:1.0 animations:^{
            //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
            self.view.frame = CGRectMake(0.0f, distance, self.view.frame.size.width, self.view.frame.size.height);
        }];
    }
}

-(void) keyboardWillHide:(NSNotification*) notification {
    NSLog(@"keyboardWillHide");
    if (self.move) {
        self.move = FALSE;
        [UIView animateWithDuration:1.0 animations:^{
            self.view.frame = CGRectMake(0.0f, 0, self.view.frame.size.width, self.view.frame.size.height);
        }];
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.textField = textField;
    return TRUE;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return TRUE;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.textField) {
        [self.textField resignFirstResponder];
    }
}

@end
