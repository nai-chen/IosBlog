//
//  UITextViewDelegateViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/1/27.
//

#import "UITextViewDelegateViewController.h"

@interface UITextViewDelegateViewController () <UITextViewDelegate>

@end

@implementation UITextViewDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextView *textView1 = [self textViewWithFrame:CGRectMake(20, 100, 320, 80)];
    textView1.delegate = self;
    [self.view addSubview:textView1];
    
    UITextView *textView2 = [self textViewWithFrame:CGRectMake(20, 200, 320, 80)];
    textView2.delegate = self;
    textView2.editable = NO;
    [self.view addSubview:textView2];
}

- (UITextView *) textViewWithFrame:(CGRect)frame {
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.text = @"http://www.baidu.com";
    textView.textColor = [UIColor blackColor];
    [textView setFont: [UIFont systemFontOfSize: 17]];
    textView.layer.borderWidth = 0.6;
    textView.layer.borderColor = [UIColor darkGrayColor].CGColor;

    return textView;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    NSLog(@"textViewShouldBeginEditing:");
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    NSLog(@"textViewShouldEndEditing:");
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"textViewDidBeginEditing:");
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    NSLog(@"textViewDidEndEditing:");
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSLog(@"textView:shouldChangeTextInRange:replacementText:");
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"textViewDidChange:");
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    NSLog(@"textViewDidChangeSelection:");
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction {
    NSLog(@"textView:shouldInteractWithURL:");
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction {
    NSLog(@"textView:shouldInteractWithTextAttachment:");
    return YES;
}

@end
