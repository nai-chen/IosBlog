//
//  Item.h
//  IosBlog
//
//  Created by PeterChen on 2020/11/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class UIViewController;

@interface Item : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *children;
@property (nonatomic, strong) UIViewController *vc;
@property (nonatomic, copy) NSString *viewController;

- (instancetype)initWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
