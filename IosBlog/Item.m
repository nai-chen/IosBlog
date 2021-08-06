//
//  Item.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/26.
//

#import "Item.h"

@implementation Item

- (instancetype)initWithTitle:(NSString *) title {
    if (self = [super init]) {
        _title = title;
    }
    return self;
}

@end
