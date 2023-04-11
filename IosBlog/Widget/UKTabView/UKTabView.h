//
//  UKTabView.h
//  IosBlog
//
//  Created by PC010055 on 2023/4/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class UKTabView;
@class UKTabItemView;

@protocol UKTabItemViewDelegate <NSObject>

- (void)onTabItemViewSelected:(UKTabItemView *)tabItemView;

@end

@interface UKTabItemView : UIView

@property(nonatomic, weak) id<UKTabItemViewDelegate> delegate;

- (void)setText:(NSString *)text;

- (void)setSelected:(BOOL)selected;

@end

@protocol UKTabViewDelegate <NSObject>

- (void)onTabView:(UKTabView *)tabView position:(NSInteger)position;

@end

@interface UKTabView : UIView

@property(nonatomic, weak) id<UKTabViewDelegate> delegate;

- (void)setIndicatorWidth:(NSInteger)width height:(NSInteger)height radius:(NSInteger)radius color:(UIColor *)color;

- (void)setItems:(NSArray<NSString *> *)items selection:(NSInteger)selection;

- (void)addItemView:(UKTabItemView *)itemView;

- (void)setSelection:(NSInteger)selection;

- (void)setSelection:(NSInteger)selection offsetRatio:(CGFloat)ratio;

@end

NS_ASSUME_NONNULL_END
