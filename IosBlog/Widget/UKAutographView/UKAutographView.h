//
//  UKAutographView.h
//  IosBlog
//
//  Created by PC010055 on 2023/4/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class UKAutographView;

@protocol UKAutographViewDelegate <NSObject>

- (void)autographViewDidBegin:(UKAutographView *)autographView;

@end

@interface UKAutographView : UIView

@property(nonatomic, weak) id<UKAutographViewDelegate> delegate;

// 宽高比，默认5:4
- (void)setImageRatio:(CGFloat)ratio;

- (void)clear;

- (UIImage *)save;

@end

NS_ASSUME_NONNULL_END
