//
//  AppDelegate.h
//  IosBlog
//
//  Created by PeterChen on 2020/11/26.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(nonatomic, strong) UIWindow *window;

@property(nonatomic, assign) CGFloat windowWidth;
@property(nonatomic, assign) CGFloat windowHeight;
@property(nonatomic, assign) CGFloat windowStatusBarHeight;
@property(nonatomic, assign) CGFloat windowBottomSafeHeight;

@end

