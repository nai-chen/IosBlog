//
//  AVPlayerNormalViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/18.
//

#import "AVPlayerNormalViewController.h"

#import <AVKit/AVKit.h>

@interface AVPlayerNormalViewController ()

@property(nonatomic, strong) AVPlayer *player;
@property(nonatomic, strong) UIView *playerView;

@end

@implementation AVPlayerNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
 
    [self.view addSubview:self.playerView];
    
    self.player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:@"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4"]];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
//    AVLayerVideoGravityResize, 非均匀模式。两个维度完全填充至整个视图区域
//    AVLayerVideoGravityResizeAspect, 等比例填充，直到一个维度到达区域边界
//    AVLayerVideoGravityResizeAspectFill, 等比例填充，直到填充满整个视图区域，其中一个维度的部分区域会被裁剪
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;

    playerLayer.frame = self.playerView.bounds;
    [self.playerView.layer addSublayer:playerLayer];
    
    [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 10) queue:nil usingBlock:^(CMTime time) {
            
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.player play];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.player pause];
}

- (UIView *)playerView {
    if (!_playerView) {
        _playerView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 360, 240)];
    }
    return _playerView;
}

@end
