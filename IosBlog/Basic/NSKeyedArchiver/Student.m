//
//  Student.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/18.
//

#import "Person.h"

@implementation Person

- (NSString *)description {
    return [NSString stringWithFormat:@"@% - %ld", self.name, self.age];
}

@end
