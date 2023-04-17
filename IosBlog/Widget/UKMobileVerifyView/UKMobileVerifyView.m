//
//  UKMobileVerifyView.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/7.
//

#import "UKMobileVerifyView.h"

@interface UKMobileVerifyView() <UITextFieldDelegate>

@property(nonatomic, strong) UITextField *inputTextField;
@property(nonatomic, strong) UIView *contentView;
@property(nonatomic, strong) NSArray *itemViewArray;

@end

@implementation UKMobileVerifyView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInitialUI];
    }
    return self;
}

- (void)resignFirstResponder {
    [self.inputTextField resignFirstResponder];
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    
    NSLog(@"UKMobileVerifyView - %@", @"willMoveToWindow");
    if (newWindow) {
        NSLog(@"UKMobileVerifyView - %@", @"newWindow");
        [self.inputTextField becomeFirstResponder];
        
        UKMobileVerifyItemView *itemView = self.itemViewArray[0];
        [itemView setFocus:YES];
    } else {
        for (UKMobileVerifyItemView *itemView in self.itemViewArray) {
            [itemView setFocus:NO];
        }
        NSLog(@"UKMobileVerifyView - %@", @"null Window");
    }
}

- (void)setupInitialUI {
    [self addSubview:self.inputTextField];
    [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    
    CGFloat itemWidth = 40;
    CGFloat itemHeight = self.frame.size.height;
    CGFloat itemPadding = (self.frame.size.width - 160)/3;
    
    self.itemViewArray = @[[self itemViewWithFrame:CGRectMake(0, 0, itemWidth, itemHeight)],
                           [self itemViewWithFrame:CGRectMake(itemWidth+itemPadding, 0, itemWidth, itemHeight)],
                           [self itemViewWithFrame:CGRectMake((itemWidth+itemPadding)*2, 0, itemWidth, itemHeight)],
                           [self itemViewWithFrame:CGRectMake((itemWidth+itemPadding)*3, 0, itemWidth, itemHeight)]
    ];
    
    for (UKMobileVerifyItemView *itemView in self.itemViewArray) {
        [self.contentView addSubview:itemView];
    }
}

- (UITextField *)inputTextField {
    if (!_inputTextField) {
        _inputTextField = [[UITextField alloc] init];
        _inputTextField.keyboardType = UIKeyboardTypeNumberPad;
        _inputTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        _inputTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _inputTextField.delegate = self;
    }
    return _inputTextField;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor whiteColor];
        
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onContentAction:)];
        [_contentView addGestureRecognizer:recognizer];
        
    }
    return _contentView;
}

- (void)onContentAction:(UITapGestureRecognizer *)recognizer {
    [self.inputTextField becomeFirstResponder];
}

- (UKMobileVerifyItemView *)itemViewWithFrame:(CGRect)frame {
    return [[UKMobileVerifyItemView alloc] initWithFrame:frame];
}

#pragma mark - UITextFieldDelegate -
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSArray *array = [string componentsSeparatedByCharactersInSet:set];
    
    if ([@"" isEqualToString:[array componentsJoinedByString:@""]]) {
        NSMutableString *text = [[NSMutableString alloc] initWithString:textField.text];
        [text replaceCharactersInRange:range withString:string];

        if (text.length > [self.itemViewArray count]) {
            return false;
        }
        NSLog(@"UKMobileVerifyView %@", text);
        [self setSelection:text];
        
        if (text.length == [self.itemViewArray count] && self.delegate) {
            [self.delegate mobileVerifyDidFinish:text];
        }
        
        return true;
    }
    return false;
}

- (void)setSelection:(NSString *)text {
    NSInteger len = text.length;
    
    for (int index = 0; index < [self.itemViewArray count]; index++) {
        UKMobileVerifyItemView *itemView = self.itemViewArray[index];
        if (index < len) {
            [itemView setText:[text substringWithRange:NSMakeRange(index, 1)]];
        } else {
            [itemView setText:@""];
        }
        [itemView setFocus:NO];
    }
    
    if (len < [self.itemViewArray count]) {
        UKMobileVerifyItemView *itemView = self.itemViewArray[len];
        [itemView setFocus:YES];
    } else {
        UKMobileVerifyItemView *itemView = [self.itemViewArray lastObject];
        [itemView setFocus:YES];
    }
}

@end


@interface UKMobileVerifyItemView()

@property(nonatomic, strong) UILabel *textLabel;
@property(nonatomic, strong) UIView *cursorView;
@property(nonatomic, strong) CALayer *cursorLayer;
@property(nonatomic, strong) UIView *indicatorView;

@property(nonatomic, assign) BOOL focus;
@property(nonatomic, strong) CAKeyframeAnimation *animation;

@end

@implementation UKMobileVerifyItemView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInitialUI];
    }
    return self;
}

- (void)setText:(NSString *)text {
    self.textLabel.text = text;
}

- (void)setFocus:(BOOL)focus {
    if (focus) {
        [self.cursorLayer addAnimation:self.animation forKey:@"keypath_opacity"];
        if ([self.textLabel.text length] > 0) {
            [self.cursorView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self).offset(10);
            }];
        } else {
            [self.cursorView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
            }];
        }
        
        self.indicatorView.backgroundColor = UIColor.blueColor;
    } else {
        [self.cursorLayer removeAnimationForKey:@"keypath_opacity"];
        
        self.indicatorView.backgroundColor = UIColor.lightGrayColor;
    }
}

- (void)setupInitialUI {
    [self addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    [self addSubview:self.cursorView];
    [self.cursorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@2);
        make.height.equalTo(@20);
        make.center.equalTo(self);
    }];
    
    [self addSubview:self.indicatorView];
    [self.indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(@1.5);
    }];
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textColor = UIColor.blackColor;
        [_textLabel setFont:[UIFont boldSystemFontOfSize:22]];
        _textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _textLabel;
}

- (UIView *)cursorView {
    if (!_cursorView) {
        _cursorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2, 20)];
        [_cursorView.layer addSublayer:self.cursorLayer];
    }
    return _cursorView;
}

- (CALayer *)cursorLayer {
    if (!_cursorLayer) {
        _cursorLayer = [CALayer layer];
        _cursorLayer.frame = CGRectMake(0, 0, 2, 20);
        _cursorLayer.backgroundColor = UIColor.blueColor.CGColor;
        _cursorLayer.opacity = 0;
    }
    return _cursorLayer;
}

- (UIView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[UIView alloc] init];
        _indicatorView.backgroundColor = UIColor.lightGrayColor;
    }
    return _indicatorView;
}

- (CAKeyframeAnimation *)animation {
    if (!_animation) {
        _animation = [[CAKeyframeAnimation alloc] init];
        _animation.keyPath = @"opacity";
        _animation.repeatCount = MAXFLOAT;
        _animation.duration = 1.5;
        
        _animation.keyTimes = @[@(0), @(0.4), @(0.45), @(1)];
        _animation.values = @[@(1), @(1), @(0), @(0)];
    }
    return _animation;
}

@end

