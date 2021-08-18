//
//  AVPlayerViewControllerViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/18.
//

#import "AVPlayerViewControllerViewController.h"

#import <AVKit/AVKit.h>

@interface AVPlayerViewControllerViewController ()

@property(nonatomic, strong) AVPlayer *player;
@property(nonatomic, strong) UIView *playerView;
@property(nonatomic, strong) AVPlayerViewController *playerViewController;

@end

@implementation AVPlayerViewControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.playerView];
    
    UIButton *fullScreenPlayButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 400, 150, 20)];
    [fullScreenPlayButton setTitle:@"full screen play" forState:UIControlStateNormal];
    [fullScreenPlayButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [fullScreenPlayButton addTarget:self action:@selector(onFullScreenPlayClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fullScreenPlayButton];
    
    UIButton *viewPlayButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 400, 100, 20)];
    [viewPlayButton setTitle:@"view play" forState:UIControlStateNormal];
    [viewPlayButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [viewPlayButton addTarget:self action:@selector(onViewPlayClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:viewPlayButton];
    
    self.player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:@"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4"]];
}

- (void)onFullScreenPlayClick:(UIButton *)sender {
    AVPlayerViewController *playerViewController = [[AVPlayerViewController alloc] init];
    playerViewController.player = self.player;
    [self presentViewController:playerViewController animated:YES completion:nil];

    [self.player play];
}

- (void)onViewPlayClick:(UIButton *)sender {
    AVPlayerViewController *playerViewController = [[AVPlayerViewController alloc] init];
    playerViewController.player = self.player;
    playerViewController.view.frame = self.playerView.bounds;
    [self.playerView addSubview:playerViewController.view];
    
    [self.player play];
}

- (UIView *)playerView {
    if (!_playerView) {
        _playerView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 360, 240)];
    }
    return _playerView;
}

@end
