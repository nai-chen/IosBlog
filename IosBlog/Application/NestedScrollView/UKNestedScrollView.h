//
//  UKNestedScrollView.h
//  IosBlog
//
//  Created by PC010055 on 2023/4/14.
//

#import <UIKit/UIKit.h>

#import "UKTabView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UKNestedScrollView : UIView

- (void)setHeaderView:(UIView *)headerView;

- (void)addTabView:(UKTabItemView *)itemView contentView:(UITableView *)contentView;

- (void)setSelection:(NSInteger)selection;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

@end

NS_ASSUME_NONNULL_END
