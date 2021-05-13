//
//  UIFontFamilyViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/5/13.
//

#import "UIFontFamilyViewController.h"

@interface UIFontFamilyViewController ()

@end

@implementation UIFontFamilyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    for (NSString* familyName in [UIFont familyNames]) {
        NSLog(@"%@", familyName);
        
        for (NSString* fontName in [UIFont fontNamesForFamilyName:familyName]) {
            NSLog(@"    %@", fontName);
        }
    }
}

@end
