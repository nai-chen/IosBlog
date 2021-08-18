//
//  AttributeStringParagraphStyleViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/12.
//

#import "AttributeStringParagraphStyleViewController.h"

@interface AttributeStringParagraphStyleViewController ()

@end

@implementation AttributeStringParagraphStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *text = @"天地玄黄，宇宙洪荒。日月盈昃，辰宿列张。寒来暑往，秋收冬藏。闰余成岁，律吕调阳。云腾致雨，露结为霜。金生丽水，玉出昆冈。剑号巨阙，珠称夜光。果珍李柰，菜重芥姜。";
    
    NSMutableAttributedString *normalText = [[NSMutableAttributedString alloc] initWithString:text];

    UILabel *normalLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 320, 90)];
    normalLabel.attributedText = normalText;
    normalLabel.font = [UIFont systemFontOfSize:14];
    normalLabel.numberOfLines = 0;
    normalLabel.backgroundColor = [UIColor greenColor];
    [self.view addSubview: normalLabel];
    
    NSMutableAttributedString *lineSpacingText = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *lineSpacingParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    lineSpacingParagraphStyle.lineSpacing = 5;
    [lineSpacingText addAttribute:NSParagraphStyleAttributeName value:lineSpacingParagraphStyle range:NSMakeRange(0, [text length])];

    UILabel *lineSpacingLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 200, 320, 90)];
    lineSpacingLabel.attributedText = lineSpacingText;
    lineSpacingLabel.font = [UIFont systemFontOfSize:14];
    lineSpacingLabel.numberOfLines = 0;
    lineSpacingLabel.backgroundColor = [UIColor greenColor];
    [self.view addSubview: lineSpacingLabel];
    
    NSMutableAttributedString *lineHeadIndentText = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *lineHeadIndentParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    lineHeadIndentParagraphStyle.firstLineHeadIndent = 20;
    lineHeadIndentParagraphStyle.headIndent = 10;
    [lineHeadIndentText addAttribute:NSParagraphStyleAttributeName value:lineHeadIndentParagraphStyle range:NSMakeRange(0, [text length])];

    UILabel *lineHeadIndentLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 300, 320, 90)];
    lineHeadIndentLabel.attributedText = lineHeadIndentText;
    lineHeadIndentLabel.font = [UIFont systemFontOfSize:14];
    lineHeadIndentLabel.numberOfLines = 0;
    lineHeadIndentLabel.backgroundColor = [UIColor greenColor];
    [self.view addSubview: lineHeadIndentLabel];
    
    NSMutableAttributedString *alignmentText = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *alignmentParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    alignmentParagraphStyle.alignment = NSTextAlignmentCenter;
    [alignmentText addAttribute:NSParagraphStyleAttributeName value:alignmentParagraphStyle range:NSMakeRange(0, [text length])];

    UILabel *alignmentLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 400, 320, 90)];
    alignmentLabel.attributedText = alignmentText;
    alignmentLabel.font = [UIFont systemFontOfSize:14];
    alignmentLabel.numberOfLines = 0;
    alignmentLabel.backgroundColor = [UIColor greenColor];
    [self.view addSubview: alignmentLabel];
}

@end
