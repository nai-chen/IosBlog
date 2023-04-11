//
//  UKTabView.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/10.
//

#import "UKTabView.h"
#import "Masonry.h"

@interface UKTabItemView ()

@property(nonatomic, strong) UIButton *itemButton;
@property(nonatomic, strong) UIView *indicatorView;

@end

@implementation UKTabItemView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupInitialUI];
    }
    return self;
}

- (void)setupInitialUI {
    [self addSubview:self.itemButton];
    [self.itemButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    
    [self addSubview:self.indicatorView];
    [self.indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.height.equalTo(@2);
        make.centerX.equalTo(self);
        make.width.equalTo(@60);
    }];
}

- (void)setText:(NSString *)text {
    [self.itemButton setTitle:text forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected {
    [self.itemButton setSelected:selected];
    self.indicatorView.hidden = !selected;

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

- (UIView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[UIView alloc] init];
        
        _indicatorView.layer.backgroundColor = [UIColor blueColor].CGColor;
        _indicatorView.layer.cornerRadius = 1;
        _indicatorView.layer.masksToBounds = YES;
        _indicatorView.hidden = YES;
    }
    return _indicatorView;
}

@end

@interface UKTabView() <UKTabItemViewDelegate>

// 0 表示不显示
@property(nonatomic, assign) NSInteger indicatorWidth;
@property(nonatomic, assign) NSInteger indicatorHeight;
@property(nonatomic, assign) NSInteger indicatorRadius;
@property(nonatomic, strong) UIColor *indicatorColor;
// 实际的提示栏长度
@property(nonatomic, assign) CGFloat indicatorActualWidth;
@property(nonatomic, strong) CAShapeLayer *indicatorLayer;

@property(nonatomic, assign) NSInteger selection;
@property(nonatomic, assign) CGFloat offsetRatio;

@property(nonatomic, strong) NSMutableArray<UKTabItemView *> *tabItemViews;

@end

@implementation UKTabView

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
    self.indicatorWidth = 0;
    self.indicatorHeight = 0;
    self.indicatorRadius = 0;
    self.indicatorColor = [UIColor blueColor];
    self.indicatorActualWidth = 0;
    self.indicatorLayer = [[CAShapeLayer alloc] init];

    _selection = -1;
    self.offsetRatio = 0;
    self.tabItemViews = [[NSMutableArray alloc] init];
}

- (void)setIndicatorWidth:(NSInteger)width height:(NSInteger)height radius:(NSInteger)radius color:(UIColor *)color {
    self.indicatorWidth = width;
    self.indicatorHeight = height;
    self.indicatorRadius = radius;
    self.indicatorColor = color;

    if (width > 0) {
        self.indicatorLayer.fillColor = self.indicatorColor.CGColor;
        [self.layer addSublayer:self.indicatorLayer];
    } else {
        [self.indicatorLayer removeFromSuperlayer];
    }
}

- (void)setItems:(NSArray<NSString *> *)items selection:(NSInteger)selection {
    [self.tabItemViews removeAllObjects];

    UKTabItemView *lastItemView = nil;
    for (NSString *item in items) {
        UKTabItemView *tabItemView = [[UKTabItemView alloc] init];
        [tabItemView setText:item];
        [self addSubview:tabItemView];

        [tabItemView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (lastItemView) {
                make.left.equalTo(lastItemView.mas_right);
            } else {
                make.left.equalTo(self);
            }
            make.top.bottom.equalTo(self);
            make.width.equalTo(self).multipliedBy(1.0/item.length);
        }];

        lastItemView = tabItemView;

        [self internalAddTabItemView:tabItemView];
    }

    self.indicatorActualWidth = 0;
    [self setSelection:selection];
}

- (void)addItemView:(UKTabItemView *)itemView {
    NSInteger len = self.subviews.count;

    for (UIView *view in self.subviews) {
        [view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self).multipliedBy(1.0/(len + 1));
        }];
    }

    [self addSubview:itemView];
    [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (len == 0) {
            make.left.equalTo(self);
        } else {
            make.left.equalTo(self.subviews[len - 1].mas_right);
        }
        make.top.bottom.equalTo(self);
        make.width.equalTo(self).multipliedBy(1.0/(len + 1));
    }];

    self.indicatorActualWidth = 0;
    [self internalAddTabItemView:itemView];
}

- (void)internalAddTabItemView:(UKTabItemView *)itemView {
    itemView.tag = self.tabItemViews.count;
    [self.tabItemViews addObject:itemView];

    itemView.delegate = self;
}

- (void)setSelection:(NSInteger)selection {
    if (selection >= 0) {
        if (selection != self.selection) {
            if (self.selection >= 0) {
                [self.tabItemViews[self.selection] setSelected:NO];
            }

            _selection = selection;
            [self.tabItemViews[self.selection] setSelected:YES];
        }
        [self drawIndicatorView];
    }
}

- (void)setSelection:(NSInteger)selection offsetRatio:(CGFloat)ratio {
    if (selection >= 0) {
        self.offsetRatio = ratio;
        
        [self setSelection:selection];
    }
}

- (void)drawIndicatorView {
    if (self.indicatorWidth > 0 && self.frame.size.width > 0 && self.tabItemViews.count > 0) {
        CGFloat itemWidth = self.frame.size.width*1.0/self.tabItemViews.count;
        BOOL initialized = self.indicatorActualWidth != 0;

        CGFloat startX = itemWidth * self.selection + itemWidth * self.offsetRatio;

        if (!initialized) {
            self.indicatorActualWidth = self.indicatorWidth;

            if (itemWidth <= self.indicatorWidth) {
                self.indicatorActualWidth = itemWidth;
            }
        }

        if (self.indicatorActualWidth < itemWidth) {
            startX += (itemWidth - self.indicatorActualWidth) / 2;
        }

        if (!initialized) {
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.indicatorActualWidth, self.indicatorHeight) cornerRadius:self.indicatorRadius];
            self.indicatorLayer.path = path.CGPath;
        }

        BOOL anim = self.offsetRatio == 0;
        
        if (!anim) {
            [CATransaction begin];
            [CATransaction setDisableActions:true];
        }
        
        self.indicatorLayer.frame = CGRectMake(startX, self.frame.size.height - self.indicatorHeight, self.indicatorActualWidth, self.indicatorHeight);
        
        if (!anim) {
            [CATransaction commit];
        }
    }
}

#pragma mark - UKTabItemViewDelegate -
- (void)onTabItemViewSelected:(UKTabItemView *)tabItemView {
    [self setSelection:tabItemView.tag];

    [self.delegate onTabView:self position:self.selection];
}

@end
