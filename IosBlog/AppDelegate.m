//
//  AppDelegate.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/26.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    [self.window setBackgroundColor: [UIColor whiteColor]];
    
    
    NSLog(@"window.frame = %@", NSStringFromCGRect(self.window.frame));
    NSLog(@"window.safeArea.layoutFrame = %@", NSStringFromCGRect(self.window.safeAreaLayoutGuide.layoutFrame));
    NSLog(@"window.safeArea.edgeInsets = %@", NSStringFromUIEdgeInsets(self.window.safeAreaInsets));

    
    ViewController *viewController = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
