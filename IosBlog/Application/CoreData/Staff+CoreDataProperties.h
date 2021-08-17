//
//  Staff+CoreDataProperties.h
//  
//
//  Created by PeterChen on 2021/5/19.
//
//

#import "Staff+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Staff (CoreDataProperties)

+ (NSFetchRequest<Staff *> *)fetchRequest;

@property(nonatomic) int64_t age;
@property(nullable, nonatomic, copy) NSString *name;
@property(nullable, nonatomic, copy) NSString *sex;

@end

NS_ASSUME_NONNULL_END
