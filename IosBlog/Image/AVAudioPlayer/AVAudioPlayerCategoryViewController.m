//
//  AVAudioPlayerCategoryViewController.m
//  IosBlog
//
//  Created by PeterChen on 2022/2/7.
//

#import "AVAudioPlayerCategoryViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface AVAudioPlayerCategoryViewController ()

@property(nonatomic, strong) AVAudioSession *audioSession;
@property(nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation AVAudioPlayerCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.audioSession = [AVAudioSession sharedInstance];
    [self.audioSession setActive:YES error:nil];
    
    for (AVAudioSessionCategory category in [self.audioSession availableCategories]) {
        NSLog(@"AVAudioSessionCategory %@", category);
    }
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"笨小孩" withExtension:@"mp3"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];

    UIButton *soloAmbientButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 200, 40)];
    [soloAmbientButton setTitle:@"SoloAmbient" forState:UIControlStateNormal];
    [soloAmbientButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:soloAmbientButton];
    
    [soloAmbientButton addTarget:self action:@selector(onSoloAmbientClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *ambientButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 150, 200, 40)];
    [ambientButton setTitle:@"Ambient" forState:UIControlStateNormal];
    [ambientButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:ambientButton];
    
    [ambientButton addTarget:self action:@selector(onAmbientClick:) forControlEvents:UIControlEventTouchUpInside];

    UIButton *playbackButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 200, 40)];
    [playbackButton setTitle:@"Playback" forState:UIControlStateNormal];
    [playbackButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:playbackButton];
    
    [playbackButton addTarget:self action:@selector(onPlaybackClick:) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton *recordButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 250, 200, 40)];
    [recordButton setTitle:@"Record" forState:UIControlStateNormal];
    [recordButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:recordButton];
    
    [recordButton addTarget:self action:@selector(onRecordClick:) forControlEvents:UIControlEventTouchUpInside];

    UIButton *playAndRecordButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 300, 200, 40)];
    [playAndRecordButton setTitle:@"PlayAndRecord" forState:UIControlStateNormal];
    [playAndRecordButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:playAndRecordButton];
    
    [playAndRecordButton addTarget:self action:@selector(onPlayAndRecordClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onSoloAmbientClick:(UIButton *)sender {
    [self setCategory:AVAudioSessionCategorySoloAmbient];
}

- (void)onAmbientClick:(UIButton *)sender {
    [self setCategory:AVAudioSessionCategoryAmbient];
}

- (void)onPlaybackClick:(UIButton *)sender {
    [self setCategory:AVAudioSessionCategoryPlayback];
}

- (void)onRecordClick:(UIButton *)sender {
    [self setCategory:AVAudioSessionCategoryRecord];
}

- (void)onPlayAndRecordClick:(UIButton *)sender {
    [self setCategory:AVAudioSessionCategoryPlayAndRecord];
}

- (void)setCategory:(AVAudioSessionCategory)category {
    [self stopAudio];

    [self.audioSession setCategory:category error:nil];
    
    if ([self.audioPlayer prepareToPlay]) {
        NSLog(@"prepareToPlay success");
    } else {
        NSLog(@"prepareToPlay fail");
    }
    
    [self playAudio];
}

- (void)dealloc {
    NSLog(@"dealloc");

    [self stopAudio];
}

- (void)stopAudio {
    [self.audioPlayer stop];
}

- (void)playAudio {
    if (![self.audioPlayer isPlaying]) {
        BOOL result = [self.audioPlayer play];
        NSLog(@"playAudio");
        if (result) {
            NSLog(@"success");
        } else {
            NSLog(@"fail");
        }
    }
}

- (void)pauseAudio {
    if ([self.audioPlayer isPlaying]) {
        [self.audioPlayer pause];
        NSLog(@"pauseAudio");
    }
}

@end
