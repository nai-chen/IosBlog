//
//  Person.h
//  IosBlog
//
//  Created by PeterChen on 2021/5/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<NSSecureCoding>

@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) NSInteger age;

@end

NS_ASSUME_NONNULL_END
