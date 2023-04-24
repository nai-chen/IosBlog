//
//  UKCalendarCollectionViewCell.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/21.
//

#import "UKCalendarCollectionViewCell.h"

@implementation UKCalendarDate

@end

@interface UKCalendarCollectionViewCell ()

@property(nonatomic, strong) UILabel *dayLabel;

@end

@implementation UKCalendarCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInitialUI];
    }
    return self;
}

- (void)setCalendarDate:(UKCalendarDate *)date {
    self.dayLabel.text = [NSString stringWithFormat:@"%ld", date.day];
    
    if (date.dayStyle == UKCalendarDateDayStyle_Current_Month) {
        self.dayLabel.textColor = [UIColor blackColor];
    } else {
        self.dayLabel.textColor = [UIColor lightGrayColor];
    }
    
    if (date.eventStyle == UKCalendarDateEventStyle_Today) {
        self.dayLabel.layer.backgroundColor = [UIColor blueColor].CGColor;
        self.dayLabel.textColor = [UIColor whiteColor];
    } else {
        self.dayLabel.layer.backgroundColor = [UIColor clearColor].CGColor;
    }
}

- (void)setupInitialUI {
    [self.contentView addSubview:self.dayLabel];
    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
        make.width.height.equalTo(@40);
    }];
}

- (UILabel *)dayLabel {
    if (!_dayLabel) {
        _dayLabel = [[UILabel alloc] init];
        [_dayLabel setFont:[UIFont systemFontOfSize:15]];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        _dayLabel.layer.cornerRadius = 20;
        _dayLabel.layer.masksToBounds = YES;
    }
    return _dayLabel;
}

@end
