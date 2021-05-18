//
//  Person.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/18.
//

#import "Person.h"

@implementation Person

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aEncoder {
    [aEncoder encodeObject:self.name forKey:@"name"];
    [aEncoder encodeInteger:self.age forKey:@"age"];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - %ld", self.name, self.age];
}

@end
