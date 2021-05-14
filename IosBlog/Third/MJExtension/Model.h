//
//  Model.h
//  IosBlog
//
//  Created by PeterChen on 2021/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    SexMale,
    SexFemale
} Sex;

@interface User : NSObject

@property (copy, nonatomic) NSString *name;/* 姓名 */
@property (copy, nonatomic) NSString *icon;/* 头像 */
@property (assign, nonatomic) unsigned int age;/* 年龄 */
@property (copy, nonatomic) NSString *height;/* 身高 */
@property (strong, nonatomic) NSNumber *money;/* 资产 */
@property (assign, nonatomic) Sex sex;/* 性别 */
@property (assign, nonatomic, getter=isGay) BOOL gay;/* 是否是同性恋 */

@end

//Status模型
@interface Status : NSObject

@property (copy, nonatomic) NSString *text;
@property (strong, nonatomic) User *user;/* 其他模型类型 */
@property (strong, nonatomic) Status *retweetedStatus;/* 自我模型类型 */
@end

@interface Ad : NSObject

@property (copy, nonatomic) NSString *image;
@property (copy, nonatomic) NSString *url;

@end

@interface StatusResult : NSObject

/** 存放着一堆的微博数据（里面都是Status模型） */
@property (strong, nonatomic) NSMutableArray *statuses;
/** 存放着一堆的广告数据（里面都是Ad模型） */
@property (strong, nonatomic) NSArray *ads;
@property (strong, nonatomic) NSNumber *totalNumber;

@end

//多级映射，用点语法设置
@interface Bag : NSObject

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) double price;

@end

@interface Student : NSObject

@property (copy, nonatomic) NSString *ID;
@property (copy, nonatomic) NSString *desc;
@property (copy, nonatomic) NSString *nowName;
@property (copy, nonatomic) NSString *oldName;
@property (copy, nonatomic) NSString *nameChangedTime;
@property (strong, nonatomic) Bag *bag;

@end

NS_ASSUME_NONNULL_END
