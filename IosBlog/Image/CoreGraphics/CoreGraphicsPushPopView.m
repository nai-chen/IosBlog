//
//  CoreGraphicsPushPopView.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/20.
//

#import "CoreGraphicsPushPopView.h"

@implementation CoreGraphicsPushPopView

- (void)drawRect:(CGRect)rect {
    [[UIColor redColor] setFill];
    
    UIGraphicsPushContext(UIGraphicsGetCurrentContext());
    [[UIColor blackColor] setFill];
    UIGraphicsPopContext();
    
    UIRectFill(rect); // black color
}

@end
