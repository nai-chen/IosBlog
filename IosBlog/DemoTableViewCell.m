//
//  DemoTableViewCell.m
//  Demo
//
//  Created by PeterChen on 2020/11/10.
//

#import "DemoTableViewCell.h"

@interface DemoTableViewCell()

@property(nonatomic, strong) UILabel *titleLabel;

@end

@implementation DemoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@20);
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)setTitle:(NSString *)title {
    [self.titleLabel setText: title];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

@end
