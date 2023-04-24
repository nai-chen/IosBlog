//
//  UKCalendarCollectionViewCell.h
//  IosBlog
//
//  Created by PC010055 on 2023/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, UKCalendarDateDayStyle) {
    UKCalendarDateDayStyle_Current_Month    = 1,
    UKCalendarDateDayStyle_Last_Month       = 2,
    UKCalendarDateDayStyle_Next_Month       = 3,
};

typedef NS_ENUM(NSInteger, UKCalendarDateEventStyle) {
    UKCalendarDateEventStyle_Today    = 1,
};

@interface UKCalendarDate : NSObject

@property(nonatomic, assign) NSInteger day;
@property(nonatomic, assign) UKCalendarDateDayStyle dayStyle;
@property(nonatomic, assign) UKCalendarDateEventStyle eventStyle;

@end

@interface UKCalendarCollectionViewCell : UICollectionViewCell

- (void)setCalendarDate:(UKCalendarDate *)date;

@end

NS_ASSUME_NONNULL_END
