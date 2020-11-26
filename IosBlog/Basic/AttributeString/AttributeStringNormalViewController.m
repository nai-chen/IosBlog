//
//  AttributeStringNormalViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/11.
//

#import "AttributeStringNormalViewController.h"

@interface AttributeStringNormalViewController ()

@end

@implementation AttributeStringNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableAttributedString* fontText = [[NSMutableAttributedString alloc] initWithString:@"正常字体25号粗体"];
    [fontText setAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:25]} range:NSMakeRange(4, 5)];

    UILabel* fontLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 320, 30)];
    fontLabel.font = [UIFont systemFontOfSize:17];
    fontLabel.attributedText = fontText;
    [self.view addSubview:fontLabel];
    
    NSMutableAttributedString* colorText = [[NSMutableAttributedString alloc] initWithString:@"红色字体蓝色背景"];
    [colorText addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 4)];
    [colorText addAttribute:NSBackgroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(4, 4)];

    UILabel* colorLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 150, 320, 30)];
    colorLabel.font = [UIFont systemFontOfSize:17];
    colorLabel.attributedText = colorText;
    [self.view addSubview:colorLabel];
    
    NSMutableAttributedString* kernText = [[NSMutableAttributedString alloc] initWithString:@"间距为5间距为10"];
    [kernText setAttributes:@{NSKernAttributeName:@5, NSBackgroundColorAttributeName:[UIColor redColor]} range:NSMakeRange(0, 4)];
    [kernText setAttributes:@{NSKernAttributeName:@10, NSBackgroundColorAttributeName:[UIColor blueColor]} range:NSMakeRange(4, 5)];

    UILabel* kernLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 200, 320, 30)];
    kernLabel.font = [UIFont systemFontOfSize:17];
    kernLabel.attributedText = kernText;
    [self.view addSubview:kernLabel];
    
    NSMutableAttributedString* lineText = [[NSMutableAttributedString alloc] initWithString:@"删除线下划线"];
    [lineText addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleSingle|NSUnderlinePatternDot) range:NSMakeRange(0, 3)];
    [lineText addAttribute:NSStrikethroughColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 3)];
    [lineText addAttribute:NSBaselineOffsetAttributeName value:@(0) range:NSMakeRange(0, 3)];
    
    [lineText addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(3, 3)];
    [lineText addAttribute:NSUnderlineColorAttributeName value:[UIColor blueColor] range:NSMakeRange(3, 3)];
    
    UILabel* lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 250, 320, 30)];
    lineLabel.font = [UIFont systemFontOfSize:17];
    lineLabel.attributedText = lineText;
    [self.view addSubview:lineLabel];
    
    NSMutableAttributedString* strokeText = [[NSMutableAttributedString alloc] initWithString:@"描边2描边4"];
    [strokeText addAttribute:NSStrokeWidthAttributeName value:@(2) range:NSMakeRange(0, 3)];
    [strokeText addAttribute:NSStrokeWidthAttributeName value:@(4) range:NSMakeRange(3, 3)];
    [strokeText addAttribute:NSStrokeColorAttributeName value:[UIColor redColor] range:NSMakeRange(1, 4)];

    UILabel* strokeLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 300, 320, 30)];
    strokeLabel.font = [UIFont systemFontOfSize:17];
    strokeLabel.attributedText = strokeText;
    [self.view addSubview:strokeLabel];
    
    NSMutableAttributedString* shadowText = [[NSMutableAttributedString alloc] initWithString:@"字体阴影"];
    NSShadow* shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor magentaColor];
    shadow.shadowOffset = CGSizeMake(10, 5);
    [shadowText addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(0, 4)];

    UILabel* shadowLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 350, 320, 30)];
    shadowLabel.font = [UIFont systemFontOfSize:17];
    shadowLabel.attributedText = shadowText;
    [self.view addSubview:shadowLabel];
    
    NSMutableAttributedString* baselineOffsetText = [[NSMutableAttributedString alloc] initWithString:@"正值上偏负值下偏"];
    [baselineOffsetText addAttribute:NSBaselineOffsetAttributeName value:@(5) range:NSMakeRange(2, 2)];
    [baselineOffsetText addAttribute:NSBaselineOffsetAttributeName value:@(-5) range:NSMakeRange(6, 2)];
    
    UILabel* baselineOffsetLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 400, 320, 30)];
    baselineOffsetLabel.font = [UIFont systemFontOfSize:17];
    baselineOffsetLabel.attributedText = baselineOffsetText;
    [self.view addSubview:baselineOffsetLabel];
    
    NSMutableAttributedString* obliquenessText = [[NSMutableAttributedString alloc] initWithString:@"负值左倾正值右倾"];
    [obliquenessText addAttribute:NSObliquenessAttributeName value:@(-0.5) range:NSMakeRange(2, 2)];
    [obliquenessText addAttribute:NSObliquenessAttributeName value:@(0.5) range:NSMakeRange(6, 2)];
    
    UILabel* obliquenessLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 450, 320, 30)];
    obliquenessLabel.font = [UIFont systemFontOfSize:17];
    obliquenessLabel.attributedText = obliquenessText;
    [self.view addSubview:obliquenessLabel];
    
    NSMutableAttributedString* expansionText = [[NSMutableAttributedString alloc] initWithString:@"负值压缩正值拉伸"];
    [expansionText addAttribute:NSExpansionAttributeName value:@(-0.5) range:NSMakeRange(0, 4)];
    [expansionText addAttribute:NSExpansionAttributeName value:@(0.5) range:NSMakeRange(4, 4)];
    
    UILabel* expansionLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 500, 320, 30)];
    expansionLabel.font = [UIFont systemFontOfSize:17];
    expansionLabel.attributedText = expansionText;
    [self.view addSubview:expansionLabel];
    
    NSMutableAttributedString* writingDirectionText = [[NSMutableAttributedString alloc] initWithString:@"文字排版从右往左"];
    [writingDirectionText addAttribute:NSWritingDirectionAttributeName value:@[@(NSWritingDirectionRightToLeft|NSWritingDirectionOverride)] range:NSMakeRange(0, 8)];
    
    UILabel* writingDirectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 550, 320, 30)];
    writingDirectionLabel.font = [UIFont systemFontOfSize:17];
    writingDirectionLabel.attributedText = writingDirectionText;
    [self.view addSubview:writingDirectionLabel];
    
    NSMutableAttributedString* attachmentText = [[NSMutableAttributedString alloc] initWithString:@"图文混排"];
    NSTextAttachment* attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed:@"icon_star"];
    attachment.bounds = CGRectMake(0, 0, 20, 20);
    NSAttributedString* attrImage = [NSAttributedString attributedStringWithAttachment: attachment];
    [attachmentText appendAttributedString:attrImage];
    
    UILabel* attachmentLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 600, 320, 30)];
    attachmentLabel.font = [UIFont systemFontOfSize:17];
    attachmentLabel.attributedText = attachmentText;
    [self.view addSubview:attachmentLabel];
}

@end
