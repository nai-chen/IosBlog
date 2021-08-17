//
//  UICustomControl.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/13.
//

#import "UICustomControl.h"

@implementation UICustomControl

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    NSLog(@"beginTrackingWithTouch");
    return TRUE;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    NSLog(@"continueTrackingWithTouch");
    return TRUE;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    NSLog(@"endTrackingWithTouch");
}

- (void)cancelTrackingWithEvent:(UIEvent *)event {
    NSLog(@"cancelTrackingWithEvent");
}

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    NSLog(@"sendAction");
    [super sendAction:action to:target forEvent:event];
}

@end
