//
//  AVAudioPlayerNormalViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/2/7.
//

#import "AVAudioPlayerNormalViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface AVAudioPlayerNormalViewController () <AVAudioPlayerDelegate>

@property(nonatomic, strong) AVAudioPlayer *audioPlayer;
@property(nonatomic, strong) UISlider *processSlider;
@property(nonatomic, strong) UISlider *volumeSlider;

@property(nonatomic, strong) NSTimer *timer;

@end

@implementation AVAudioPlayerNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setActive:YES error:nil];

    NSURL *url = [[NSBundle mainBundle] URLForResource:@"笨小孩" withExtension:@"mp3"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    self.audioPlayer.delegate = self;
    if ([self.audioPlayer prepareToPlay]) {
        NSLog(@"prepareToPlay success");
    } else {
        NSLog(@"prepareToPlay fail");
    }
    
    UIButton *playButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 40)];
    [playButton setTitle:@"播放" forState:UIControlStateNormal];
    [playButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:playButton];
    
    [playButton addTarget:self action:@selector(onPlayClick:) forControlEvents:UIControlEventTouchUpInside];

    UIButton *pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 100, 100, 40)];
    [pauseButton setTitle:@"暂停" forState:UIControlStateNormal];
    [pauseButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:pauseButton];
    
    [pauseButton addTarget:self action:@selector(onPauseClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *processLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 40, 40)];
    processLabel.text = @"进度";
    processLabel.textColor = [UIColor blueColor];
    [self.view addSubview:processLabel];
    
    self.processSlider = [[UISlider alloc] initWithFrame:CGRectMake(80, 200, 200, 40)];
    self.processSlider.continuous = YES;
    [self.processSlider addTarget:self action:@selector(onProcessSliderChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.processSlider];
    
    UILabel *volumeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 240, 40, 40)];
    volumeLabel.text = @"音量";
    volumeLabel.textColor = [UIColor blueColor];
    [self.view addSubview:volumeLabel];
    
    self.volumeSlider = [[UISlider alloc] initWithFrame:CGRectMake(80, 240, 200, 40)];
    self.volumeSlider.value = self.audioPlayer.volume;
    [self.volumeSlider addTarget:self action:@selector(onVolumeSliderChange:) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:self.volumeSlider];
}

- (void)dealloc {
    NSLog(@"dealloc");

    [self stopAudio];
}

- (void)stopAudio {
    [self.audioPlayer stop];
    [self.timer invalidate];
    self.timer = nil;
}

- (void)onPlayClick:(UIButton *)sender {
    [self playAudio];
}

- (void)playAudio {
    if (![self.audioPlayer isPlaying]) {
        BOOL result = [self.audioPlayer play];
        NSLog(@"playAudio");
        if (result) {
            __weak typeof(self) weakSelf = self;
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
                NSLog(@"currentTime = %.2f", weakSelf.audioPlayer.currentTime);
                weakSelf.processSlider.value = weakSelf.audioPlayer.currentTime/weakSelf.audioPlayer.duration;
            }];
            NSLog(@"success");
        } else {
            NSLog(@"fail");
        }
    }
}

- (void)onPauseClick:(UIButton *)sender {
    [self pauseAudio];
}

- (void)pauseAudio {
    if ([self.audioPlayer isPlaying]) {
        [self.audioPlayer pause];
        [self.timer invalidate];
        self.timer = nil;
        NSLog(@"pauseAudio");
    }
}

- (void)onProcessSliderChange:(UISlider *)slider {
    NSLog(@"%.2f", slider.value * self.audioPlayer.duration);
    
    self.audioPlayer.currentTime = slider.value * self.audioPlayer.duration;
}

- (void)onVolumeSliderChange:(UISlider *)slider {
    NSLog(@"%.2f", slider.value);
    self.audioPlayer.volume = slider.value * self.audioPlayer.duration;
}

#pragma mark - AVAudioPlayerDelegate -
// 播放完成之后回调以下方法
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"audioPlayerDidFinish");
    
    [self stopAudio];
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error {
    NSLog(@"audioPlayerDecodeError");
}
@end
