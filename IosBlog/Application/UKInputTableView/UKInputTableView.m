//
//  UKInputTableView.m
//  IosBlog
//
//  Created by PC010055 on 2023/4/18.
//

#import "UKInputTableView.h"

@implementation UKInputTableView

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

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    id view = [super hitTest:point withEvent:event];
    if (!([view isKindOfClass:[UITextView class]] || [view isKindOfClass:[UITextField class]])) {
        [self endEditing:YES];
    }
    return view;
}

@end
