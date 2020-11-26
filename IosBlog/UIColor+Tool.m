//
//  UIColor+Tool.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/16.
//

#import "UIColor+Tool.h"

@implementation UIColor (Tool)

+ (UIColor *)colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha {
    return ColorWithRGB((hex & 0xFF0000) >> 16, (hex & 0xFF00) >> 8, hex & 0xFF, alpha);
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    unsigned int red = 0, green = 0, blue = 0;
    [[NSScanner scannerWithString:[hexString substringWithRange:NSMakeRange(0, 2)]] scanHexInt: &red];
    [[NSScanner scannerWithString:[hexString substringWithRange:NSMakeRange(2, 2)]] scanHexInt: &green];
    [[NSScanner scannerWithString:[hexString substringWithRange:NSMakeRange(4, 2)]] scanHexInt: &blue];
    
    return ColorWithRGB(red, green, blue, alpha);
}

@end
