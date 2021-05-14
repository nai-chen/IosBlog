//
//  Model.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/14.
//

#import "Model.h"
#import "MJExtension.h"

@implementation User

@end

@implementation Status

@end

@implementation Ad

@end

@implementation StatusResult

+ (NSDictionary *)mj_objectClassInArray {
    return @{
                    @"statuses" : @"Status",
                    @"ads" : @"Ad"
            };
}

@end

@implementation Bag

@end

@implementation Student

+(NSDictionary *)mj_replacedKeyFromPropertyName {
    
    // 实现这个方法的目的：告诉MJExtension框架模型中的属性名对应着字典的哪个key
    return @{
            @"ID" : @"id",
            @"desc" : @"desciption",
            @"oldName" : @"name.oldName",
            @"nowName" : @"name.newName",
            @"nameChangedTime" : @"name.info[1].nameChangedTime",
            @"bag" : @"other.bag"
    };
    
}

@end
