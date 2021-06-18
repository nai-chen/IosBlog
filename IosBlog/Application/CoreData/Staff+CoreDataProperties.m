//
//  Staff+CoreDataProperties.m
//  
//
//  Created by PeterChen on 2021/5/19.
//
//

#import "Staff+CoreDataProperties.h"

@implementation Staff (CoreDataProperties)

+ (NSFetchRequest<Staff *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Staff"];
}

@dynamic age;
@dynamic name;
@dynamic sex;

@end
