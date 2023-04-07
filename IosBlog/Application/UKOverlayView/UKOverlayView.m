//
//  UKOverlayView.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/7.
//

#import "UKOverlayView.h"


@implementation UKOverlayView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInitialUI];
    }
    return self;
}

- (void)setupInitialUI {
    if (@available(iOS 13.0, *)) {
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.backgroundColor = [UIColor lightGrayColor];
        self.layer.compositingFilter = @"saturationBlendMode";
        self.layer.zPosition = FLT_MAX;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return nil;
}

@end
