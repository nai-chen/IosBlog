//
//  MJExtensionViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/14.
//

#import "MJExtensionViewController.h"
#import "MJExtension.h"
#import "Model.h"

@interface MJExtensionViewController ()

@end

@implementation MJExtensionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self dict2Model];
    [self json2Model];
    [self complexDict2Model];
    [self arrayProperty2Model];
    [self propertyReplace2Model];
    [self array2Model];
    [self model2Dict];
    [self model2Array];
}

-(void) dict2Model {
    // 简单的字典
    NSDictionary *dict_user = @{
                   @"name" : @"Jack",
                   @"icon" : @"lufy.png",
                   @"age" : @20,
                   @"height" : @"1.55",
                   @"money" : @100.9,
                   @"sex" : @(SexFemale),/* 枚举需要使用NSNumber包装 */
                   @"gay" : @YES
           };

    User *user = [User mj_objectWithKeyValues:dict_user];
    NSLog(@"MJ---%@----%@---%u---%@---%@---%u----%d",
        user.name, user.icon, user.age, user.height, user.money, user.sex, user.gay);
}

-(void) json2Model {
    // 定义一个JSON字符串
    NSString *jsonStr = @"{\"name\":\"Jack\", \"icon\":\"lufy.png\", \"age\":20}";
    User *user = [User mj_objectWithKeyValues:jsonStr];
    NSLog(@"MJ---%@----%@---%u", user.name, user.icon, user.age);
}

-(void) complexDict2Model {
    //复杂的字典[模型中有个数组属性，数组里面又要装着其他模型的字典]
    NSDictionary *dict_m8m = @{
                  @"text" : @"Agree!Nice weather!",
                  @"user" : @{
                          @"name" : @"Jack",
                          @"icon" : @"lufy.png"
                  },
                  @"retweetedStatus" : @{
                          @"text" : @"Nice weather!",
                          @"user" : @{
                                  @"name" : @"Rose",
                                  @"icon" : @"nami.png"
                          }
                  }
          };
    
    //字典转模型，模型里面含有模型
    Status *status = [Status mj_objectWithKeyValues:dict_m8m];
    NSString *text = status.text;
    NSString *name = status.user.name;
    NSString *icon = status.user.icon;
    NSLog(@"mj-----text=%@, name=%@, icon=%@", text, name, icon);
    NSString *text2 = status.retweetedStatus.text;
    NSString *name2 = status.retweetedStatus.user.name;
    NSString *icon2 = status.retweetedStatus.user.icon;
    NSLog(@"mj-----text2=%@, name2=%@, icon2=%@", text2, name2, icon2);
}

-(void) arrayProperty2Model {
    //模型中有个数组属性，数组里面又要装着其他模型
    NSDictionary* dict_m8a = @{
        @"statuses" : @[
                    @{
                            @"text" : @"Nice weather!",
                            @"user" : @{
                                    @"name" : @"Rose",
                                    @"icon" : @"nami.png"
                            }
                    },
                    @{
                            @"text" : @"Go camping tomorrow!",
                            @"user" : @{
                                    @"name" : @"Jack",
                                    @"icon" : @"lufy.png"
                            }
                    }
            ],
            @"ads" : @[
                    @{
                            @"image" : @"ad01.png",
                            @"url" : @"http://www.ad01.com"
                    },
                    @{
                            @"image" : @"ad02.png",
                            @"url" : @"http://www.ad02.com"
                    }
            ],
            @"totalNumber" : @"2014"
    };
    
    /*
    [StatusResult mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                    @"statuses" : @"Status",
                    // @"statuses" : [Status class],
                    @"ads" : @"Ad"
                    // @"ads" : [Ad class]
            };
    }];
    */
    // Equals: StatusResult.m implements +mj_objectClassInArray method.

    // 以上方法在VC里写，如果多个地方解析该model，就要写多次，最好在model的.m文件写！
    // 字典转模型，支持模型的数组属性里面又装着模型
    StatusResult *result = [StatusResult mj_objectWithKeyValues:dict_m8a];

    // 打印博主信息
    for (Status *status in result.statuses) {
        NSString *text = status.text;
        NSString *name = status.user.name;
        NSString *icon = status.user.icon;
        NSLog(@"mj---text=%@, name=%@, icon=%@", text, name, icon);
    }

    // 打印广告
    for (Ad *ad in result.ads) {
        NSLog(@"mj---image=%@, url=%@", ad.image, ad.url);
    }
}

-(void) propertyReplace2Model {
    NSDictionary *dict_nokey = @{
                @"id" : @"20",
                @"desciption" : @"kids",
                @"name" : @{
                        @"newName" : @"lufy",
                        @"oldName" : @"kitty",
                        @"info" : @[
                                @"test-data",
                                @{
                                        @"nameChangedTime" : @"2013-08"
                                }
                        ]
                },
                @"other" : @{
                        @"bag" : @{
                                @"name" : @"a red bag",
                                @"price" : @100.7
                        }
                }
        };

    /*
    // How to map
    [Student mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{
                    @"ID" : @"id",
                    @"desc" : @"desciption",
                    @"oldName" : @"name.oldName",
                    @"nowName" : @"name.newName",
                    @"nameChangedTime" : @"name.info[1].nameChangedTime",
                    @"bag" : @"other.bag"
            };
    }]; */

    // Equals: Student.m implements +mj_replacedKeyFromPropertyName method.

    //字典转模型，支持多级映射
    Student *stu = [Student mj_objectWithKeyValues:dict_nokey];

    //打印
    NSLog(@"ID=%@, desc=%@, oldName=%@, nowName=%@, nameChangedTime=%@",
    stu.ID, stu.desc, stu.oldName, stu.nowName, stu.nameChangedTime);
    NSLog(@"bagName=%@, bagPrice=%f", stu.bag.name, stu.bag.price);
}

-(void) array2Model {
    NSArray *dictArray = @[
            @{
                    @"name" : @"Jack",
                    @"icon" : @"lufy.png"
            },
            @{
                    @"name" : @"Rose",
                    @"icon" : @"nami.png"
            }
    ];

    //字典数组转模型数组，使用的是mj_objectArrayWithKeyValuesArray:方法
    NSArray *userArray = [User mj_objectArrayWithKeyValuesArray:dictArray];

    //打印
    for (User *user in userArray) {
        NSLog(@"name=%@, icon=%@", user.name, user.icon);
    }
}

-(void) model2Dict {
    User *user = [[User alloc] init];
    user.name = @"Jack";
    user.icon = @"lufy.png";

    Status *status = [[Status alloc] init];
    status.user = user;
    status.text = @"Nice mood!";

    //模型转字典，使用的是mj_keyValues属性
    NSDictionary *statusDict = status.mj_keyValues;
    NSLog(@"%@", statusDict);
}

-(void) model2Array {
    //创建模型数组
    User *user1 = [[User alloc] init];
    user1.name = @"Jack";
    user1.icon = @"lufy.png";
    User *user2 = [[User alloc] init];
    user2.name = @"Rose";
    user2.icon = @"nami.png";
    NSArray *userArray = @[user1, user2];

    //模型数组转字典数组，使用的是mj_keyValuesArrayWithObjectArray:方法
    NSArray *dictArray = [User mj_keyValuesArrayWithObjectArray:userArray];
    NSLog(@"%@", dictArray);
}

@end
