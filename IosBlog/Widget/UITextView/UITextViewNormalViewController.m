//
//  UITextViewNormalViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/1/27.
//

#import "UITextViewNormalViewController.h"

@interface UITextViewNormalViewController ()

@end

@implementation UITextViewNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextView *textView1 = [self textViewWithFrame: CGRectMake(20, 100, 320, 80)];
    textView1.clearsOnInsertion = YES;
    [self.view addSubview:textView1];
    
    UITextView *textView2 = [self textViewWithFrame: CGRectMake(20, 200, 320, 80)];
    textView2.editable = false;
    textView2.selectable = false;
    [self.view addSubview:textView2];
    
    UITextView *textView3 = [self textViewWithFrame: CGRectMake(20, 300, 320, 80)];
    NSDictionary *attrDict = @{
        NSForegroundColorAttributeName : [UIColor redColor]
    };
    NSAttributedString *text = [[NSAttributedString alloc] initWithString:@"红色前景色" attributes:attrDict];
    textView3.attributedText = text;
    textView3.allowsEditingTextAttributes = NO;
    [self.view addSubview:textView3];
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


@end
