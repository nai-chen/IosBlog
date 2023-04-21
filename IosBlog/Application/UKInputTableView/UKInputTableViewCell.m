//
//  UKInputTableViewCell.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/18.
//

#import "UKInputTableViewCell.h"

@interface UKInputTableViewCell ()

@property(nonatomic, strong) UILabel *titleLabel;

@end

@implementation UKInputTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupInitialUI];
    }
    return self;
}

- (void)setTitle:(NSString *)title hint:(NSString *)hint {
    self.titleLabel.text = title;
    
    NSDictionary *attrs = @{
        NSForegroundColorAttributeName : [UIColor darkGrayColor]
    };
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:hint attributes:attrs];
    [self.contentTextField setAttributedPlaceholder:attrText];

}

- (void)setDetail:(NSString *)detail {
    self.contentTextField.text = detail;
}

- (void)setupInitialUI {
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.right.equalTo(self.contentView).offset(-15);
        make.top.equalTo(self.contentView).offset(24);
        make.height.equalTo(@24);
    }];
    
    [self.contentView addSubview:self.contentTextField];
    [self.contentTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.right.equalTo(self.contentView).offset(-15);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(12);
        make.height.equalTo(@50);
    }];
    
    UIView *separatorView = [[UIView alloc] init];
    separatorView.backgroundColor = [UIColor darkGrayColor];
    [self.contentView addSubview:separatorView];
    [separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        [_titleLabel setFont:[UIFont systemFontOfSize:17]];
    }
    return _titleLabel;
}

- (UITextField *)contentTextField {
    if (!_contentTextField) {
        _contentTextField = [[UITextField alloc] init];
        _contentTextField.textColor = [UIColor blackColor];
        [_contentTextField setFont:[UIFont systemFontOfSize:15]];
        
        [_contentTextField addTarget:self action:@selector(onInputTextChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _contentTextField;
}

- (void)onInputTextChanged:(UITextField *)textField {
    if (self.inputChange) {
        self.inputChange(textField.text);
    }
}

@end
