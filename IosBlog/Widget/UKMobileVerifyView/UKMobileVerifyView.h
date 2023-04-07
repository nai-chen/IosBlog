//
//  UKMobileVerifyView.h
//  IosBlog
//
//  Created by PC010055 on 2023/4/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UKMobileVerifyViewDelegate <NSObject>

- (void)mobileVerifyDidFinish:(NSString *)text;

@end

@interface UKMobileVerifyView : UIView

@property(nonatomic, strong) id<UKMobileVerifyViewDelegate> delegate;

- (void)resignFirstResponder;

@end

@interface UKMobileVerifyItemView : UIView

- (void)setFocus:(BOOL)focus;

- (void)setText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
