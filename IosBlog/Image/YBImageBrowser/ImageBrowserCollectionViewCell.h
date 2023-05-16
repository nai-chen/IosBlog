//
//  ImageBrowserCollectionViewCell.h
//  IosBlog
//
//  Created by PC010055 on 2023/3/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageBrowserCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong) UIImageView *imageView;

- (void)setImage:(UIImage *)image;

- (void)setImageUrl:(NSString *)url;

- (void)setImageNSUrl:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
