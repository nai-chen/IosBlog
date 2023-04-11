//
//  UKCustomTabItemView.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/10.
//

#import "UKCustomTabItemView.h"
#import "Masonry.h"

@interface UKCustomTabItemView()

@property(nonatomic, strong) UIButton *itemButton;

@end

@implementation UKCustomTabItemView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupInitialUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInitialUI];
    }
    return self;
}

- (void)setupInitialUI {
    [self addSubview:self.itemButton];
    [self.itemButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self);
    }];

}

- (void)setText:(NSString *)text {
    [self.itemButton setTitle:text forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected {
    [self.itemButton setSelected:selected];

    if (selected) {
        [self.itemButton.titleLabel setFont:[UIFont systemFontOfSize:17]];
    } else {
        [self.itemButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    }
}

- (UIButton *)itemButton {
    if (!_itemButton) {
        _itemButton = [[UIButton alloc] init];
        [_itemButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_itemButton setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        
        [_itemButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        
        [_itemButton addTarget:self action:@selector(onItemClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _itemButton;
}

- (void)onItemClick:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate onTabItemViewSelected:self];
    }
}

@end
