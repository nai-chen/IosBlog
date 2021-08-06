//
//  UITextViewInputViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/1/27.
//

#import "UITextViewInputViewController.h"

@interface UITextViewInputViewController ()

@property (nonatomic, strong) UITextView *textView;

@end

@implementation UITextViewInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.textView = [self textViewWithFrame: CGRectMake(20, 100, 320, 80)];
    [self.view addSubview:self.textView];
    
    UILabel *inputViewLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    inputViewLabel.text = @"没有键盘怎么办";
    inputViewLabel.font = [UIFont systemFontOfSize:28];
    inputViewLabel.textColor = [UIColor redColor];
    inputViewLabel.textAlignment = NSTextAlignmentCenter;
    self.textView.inputView = inputViewLabel;
    
    UILabel *inputAccessoryView = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    inputAccessoryView.text = @"点击我试试";
    inputAccessoryView.font = [UIFont systemFontOfSize:13];
    inputAccessoryView.textColor = [UIColor grayColor];
    inputAccessoryView.textAlignment = NSTextAlignmentRight;
    
    inputAccessoryView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    [inputAccessoryView addGestureRecognizer:tap];
    
    self.textView.inputAccessoryView = inputAccessoryView;
}

- (UITextView *)textViewWithFrame:(CGRect)frame {
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.text = @"Please input";
    textView.textColor = [UIColor blackColor];
    [textView setFont: [UIFont systemFontOfSize: 17]];
    textView.layer.borderWidth = 0.6;
    textView.layer.borderColor = [UIColor darkGrayColor].CGColor;

    return textView;
}

-(void) click:(UITapGestureRecognizer*) gestureRecognizer {
    self.textView.text = @"123";
}

@end
