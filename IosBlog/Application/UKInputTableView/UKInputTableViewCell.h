//
//  UKInputTableViewCell.h
//  IosBlog
//
//  Created by PC010055 on 2023/4/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^InputChangeBlock)(NSString *);

@interface UKInputTableViewCell : UITableViewCell

@property(nonatomic, copy) InputChangeBlock inputChange;
@property(nonatomic, strong) UITextField *contentTextField;

- (void)setTitle:(NSString *)title hint:(NSString *)hint;

- (void)setDetail:(NSString *)detail;

@end

NS_ASSUME_NONNULL_END
