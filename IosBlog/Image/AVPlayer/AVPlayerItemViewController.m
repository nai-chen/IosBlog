//
//  AVPlayerItemViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/18.
//

#import "AVPlayerItemViewController.h"

#import <AVKit/AVKit.h>

@interface AVPlayerItemViewController ()

@property(nonatomic, strong) AVPlayer *player;
@property(nonatomic, strong) AVPlayerItem *playerItem;
@property(nonatomic, strong) UIView *playerView;

@end

@implementation AVPlayerItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
 
    [self.view addSubview:self.playerView];
    
    self.playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:@"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4"]];
    self.player = [[AVPlayer alloc] initWithPlayerItem:self.playerItem];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;

    playerLayer.frame = self.playerView.bounds;
    [self.playerView.layer addSublayer:playerLayer];
    
    __weak __typeof(self)weakSelf = self;
    [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:nil usingBlock:^(CMTime time) {
        NSLog(@"%lld/%.2f", weakSelf.playerItem.currentTime.value/weakSelf.playerItem.currentTime.timescale,
              CMTimeGetSeconds(weakSelf.playerItem.duration));
    }];
    [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [self.playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)dealloc {
    [self.playerItem removeObserver:self forKeyPath:@"status"];
    [self.playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        switch (self.playerItem.status) {
            case AVPlayerItemStatusReadyToPlay:
                NSLog(@"AVPlayerItemStatusReadyToPlay");
                break;
            case AVPlayerItemStatusUnknown:
                NSLog(@"AVPlayerItemStatusUnknown");
                break;
            case AVPlayerItemStatusFailed:
                NSLog(@"AVPlayerItemStatusFailed");
                break;
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        NSArray<NSValue *> *array = _playerItem.loadedTimeRanges;

        //本次缓冲时间范围
        CMTimeRange timeRange = [array.firstObject CMTimeRangeValue];
        float startSeconds = CMTimeGetSeconds(timeRange.start);
        float durationSeconds = CMTimeGetSeconds(timeRange.duration);
        NSTimeInterval totalBuffer = startSeconds + durationSeconds;//缓冲总长度
        NSLog(@"当前缓冲时间：%f",totalBuffer);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
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
