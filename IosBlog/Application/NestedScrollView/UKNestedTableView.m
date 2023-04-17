//
//  UKNestedTableView.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/14.
//

#import "UKNestedTableView.h"

@implementation UKNestedTableView

- (instancetype)init {
    self = [super initWithFrame:CGRectZero style:UITableViewStylePlain];

    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.separatorColor = [UIColor clearColor];
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
                
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }

        self.estimatedRowHeight = 0.000;
        self.estimatedSectionHeaderHeight = 0.000;
        self.estimatedSectionFooterHeight = 0.000;
        
        if (@available(iOS 13.0,*)) {
            self.automaticallyAdjustsScrollIndicatorInsets = NO;
        }

        if (@available(iOS 15.0,*)) { // 去除表格头留白
            self.sectionHeaderTopPadding = YES;
         }
    }
    return self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
