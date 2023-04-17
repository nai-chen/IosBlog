//
//  ImageBrowserCollectionViewCell.m
//  IosBlog
//
//  Created by PC010055 on 2023/3/30.
//

#import "ImageBrowserCollectionViewCell.h"
#import "SDWebImage.h"

@implementation ImageBrowserCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInitialUI];
    }
    return self;
}

- (void)setupInitialUI {
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
}

- (void)setImageUrl:(NSString *)imageUrl {
    [self setImageNSUrl:[NSURL URLWithString:imageUrl]];
}

- (void)setImageNSUrl:(NSURL *)url {
    [self.imageView sd_setImageWithURL:url placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.layer.masksToBounds = YES;
    }
    return _imageView;
}

@end
