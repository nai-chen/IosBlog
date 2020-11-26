//
//  UIColor+Tool.h
//  IosBlog
//
//  Created by PeterChen on 2020/11/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define ColorWithRGB(R,G,B,A) [UIColor colorWithRed:((R)/255.0) green:((G)/255.0) blue:((B)/255.0) alpha:(A)];

@interface UIColor (Tool)

+(UIColor*) colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha;

+(UIColor*) colorWithHexString:(NSString*)hexString alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
