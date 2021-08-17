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

@property(nonatomic, copy) NSString *name;/* 姓名 */
@property(nonatomic, copy) NSString *icon;/* 头像 */
@property(nonatomic, assign) unsigned int age;/* 年龄 */
@property(nonatomic, copy) NSString *height;/* 身高 */
@property(nonatomic, strong) NSNumber *money;/* 资产 */
@property(nonatomic, assign) Sex sex;/* 性别 */
@property(nonatomic, assign, getter=isGay) BOOL gay;/* 是否是同性恋 */

@end

//Status模型
@interface Status : NSObject

@property(nonatomic, copy) NSString *text;
@property(nonatomic, strong) User *user;/* 其他模型类型 */
@property(nonatomic, strong) Status *retweetedStatus;/* 自我模型类型 */
@end

@interface Ad : NSObject

@property(nonatomic, copy) NSString *image;
@property(nonatomic, copy) NSString *url;

@end

@interface StatusResult : NSObject

/** 存放着一堆的微博数据（里面都是Status模型） */
@property(nonatomic, strong) NSMutableArray *statuses;
/** 存放着一堆的广告数据（里面都是Ad模型） */
@property(nonatomic, strong) NSArray *ads;
@property(nonatomic, strong) NSNumber *totalNumber;

@end

//多级映射，用点语法设置
@interface Bag : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) double price;

@end

@interface Student : NSObject

@property(nonatomic, copy) NSString *ID;
@property(nonatomic, copy) NSString *desc;
@property(nonatomic, copy) NSString *nowName;
@property(nonatomic, copy) NSString *oldName;
@property(nonatomic, copy) NSString *nameChangedTime;
@property(nonatomic, strong) Bag *bag;

@end

NS_ASSUME_NONNULL_END
