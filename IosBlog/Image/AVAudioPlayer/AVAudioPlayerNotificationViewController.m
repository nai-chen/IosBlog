//
//  AVAudioPlayerNotificationViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/2/7.
//

#import "AVAudioPlayerNotificationViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface AVAudioPlayerNotificationViewController ()

@property(nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation AVAudioPlayerNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[AVAudioSession sharedInstance] setActive:YES error:nil];
        
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"笨小孩" withExtension:@"mp3"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
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
        
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AVAudioSessionInterruption:) name:AVAudioSessionInterruptionNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AVAudioSessionSilenceSecondaryAudioHint:) name:AVAudioSessionSilenceSecondaryAudioHintNotification object:nil];
}

- (void)dealloc {
    NSLog(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self];

    [self stopAudio];
}

- (void)stopAudio {
    [self.audioPlayer stop];
}

- (void)onPlayClick:(UIButton *)sender {
    [self playAudio];
}

- (void)playAudio {
    if (![self.audioPlayer isPlaying]) {
        BOOL result = [self.audioPlayer play];
        NSLog(@"play");
        if (result) {
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
        NSLog(@"pause");
    }
}

#pragma mark - Notification -
- (void)AVAudioSessionInterruption:(NSNotification *)notificaiton {
    NSLog(@"AVAudioSessionInterruption");
    NSInteger reason = [[notificaiton.userInfo objectForKey:AVAudioSessionInterruptionTypeKey] integerValue];
    
    if (reason == AVAudioSessionInterruptionTypeBegan) {
        NSLog(@"AVAudioSessionInterruptionTypeBegan");
        [self onPauseClick:nil];
    } else if (reason == AVAudioSessionInterruptionTypeEnded) {
        NSLog(@"AVAudioSessionInterruptionTypeEnded");
    }
}

- (void)AVAudioSessionSilenceSecondaryAudioHint:(NSNotification *)notification {
    NSLog(@"AVAudioSessionSilenceSecondaryAudioHint");
    NSInteger reason = [[notification.userInfo objectForKey:AVAudioSessionSilenceSecondaryAudioHintTypeKey] integerValue];
    
    if (reason == AVAudioSessionSilenceSecondaryAudioHintTypeBegin) {
        NSLog(@"AVAudioSessionSilenceSecondaryAudioHintTypeBegin");
    } else if (reason == AVAudioSessionSilenceSecondaryAudioHintTypeEnd) {
        NSLog(@"AVAudioSessionSilenceSecondaryAudioHintTypeEnd");
    }
}

@end
