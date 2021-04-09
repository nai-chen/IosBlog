//
//  ViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/26.
//

#import "ViewController.h"
#import "Masonry.h"

#import "Item.h"
#import "DemoTableViewCell.h"

#import "AttributeStringNormalViewController.h"
#import "AttributeStringParagraphStyleViewController.h"
#import "UIColorViewController.h"
#import "NSNoticationViewController.h"

#import "UIViewFrameViewController.h"
#import "UIViewClipsToBoundsViewController.h"
#import "UIViewGestureRecongnizerViewController.h"
#import "UIViewCALayerViewController.h"
#import "UILabelTextAlignmentViewController.h"
#import "UILabelBreakModeViewController.h"
#import "UILabelBoundsViewController.h"
#import "UILabelOtherViewController.h"
#import "UIImageViewAnimationViewController.h"
#import "UIImageViewContentModeViewController.h"
#import "UIControlViewViewController.h"
#import "UIButtonNormalViewController.h"
#import "UIButtonStyleViewController.h"
#import "UIButtonEdgeInsetsViewController.h"
#import "UITextFieldNormalViewController.h"
#import "UITextFieldKeyBoardViewController.h"
#import "UITextFieldReturnTypeViewController.h"
#import "UITextFieldNotificationViewController.h"
#import "UITextViewNormalViewController.h"
#import "UITextViewInputViewController.h"
#import "UITextViewDelegateViewController.h"
#import "UISwitchNormalViewController.h"
#import "UIPageControlViewController.h"
#import "UISegmentedControlNormalViewController.h"
#import "UISegmentedControlSetViewController.h"
#import "UISegmentedControlOperationViewController.h"
#import "UISegmentedControlEventViewController.h"
#import "UISliderViewController.h"
#import "UIActivityIndicatorViewController.h"
#import "UIProgressViewController.h"
#import "UIStepperViewController.h"
#import "UIPickerViewController.h"
#import "UIDatePickerDateViewController.h"
#import "UIDatePickerTimeViewController.h"
#import "UIDatePickerDateAndTimeViewController.h"
#import "UIDatePickerCountDownTimerViewController.h"
#import "UIAlertControllerViewController.h"

#import "SVProgressHUDNormalViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView* tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (!self.item) {
        // Basic item
        Item* basicItem = [self basicItem];
        
        // Widget item
        Item* widgetItem = [self widgetItem];
        
        // Third item
        Item* thirdItem = [self thirdItem];
        
        self.item = [[Item alloc] initWithTitle:@""];
        self.item.children = @[basicItem, widgetItem, thirdItem];
    }
    
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[DemoTableViewCell class] forCellReuseIdentifier:@"DemoTableViewCellId"];
    [self.view addSubview: _tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
}

-(Item*) basicItem {
    // AttributeString
    Item* attributeStringNormalItem = [[Item alloc] initWithTitle:@"AttributeStringNormal"];
    attributeStringNormalItem.vc = [[AttributeStringNormalViewController alloc] init];
    
    Item* AttributeStringParagraphStyleItem = [[Item alloc] initWithTitle:@"AttributeStringParagraphStyle"];
    AttributeStringParagraphStyleItem.vc = [[AttributeStringParagraphStyleViewController alloc] init];
    
    // AttributeString end
    Item* attributeStringItem = [[Item alloc] initWithTitle:@"AttributeString"];
    attributeStringItem.children = @[attributeStringNormalItem, AttributeStringParagraphStyleItem];
    
    // UIColor
    Item* uiColorItem = [[Item alloc] initWithTitle:@"UIColor"];
    uiColorItem.vc = [[UIColorViewController alloc] init];
    
    // UIColor end
    
    // NSNotificationCenter
    Item* notificationCenterItem = [[Item alloc] initWithTitle:@"NSNotificationCenter"];
    notificationCenterItem.vc = [[NSNoticationViewController alloc] init];
    
    // end NSNotificationCenter
    
    Item* basicItem = [[Item alloc] initWithTitle:@"Basic"];
    basicItem.children = @[attributeStringItem, uiColorItem, notificationCenterItem];
    
    return basicItem;
}

-(Item*) widgetItem {
    // UIView
    Item* uiViewFrameItem = [[Item alloc] initWithTitle:@"UIViewFrame"];
    uiViewFrameItem.vc = [[UIViewFrameViewController alloc] init];
    
    Item* uiViewClipsToBoundsItem = [[Item alloc] initWithTitle:@"UIViewClipsToBounds"];
    uiViewClipsToBoundsItem.vc = [[UIViewClipsToBoundsViewController alloc] init];
    
    Item* uiViewGestureRecongnizerItem = [[Item alloc] initWithTitle:@"UIViewGestureRecongnizer"];
    uiViewGestureRecongnizerItem.vc = [[UIViewGestureRecongnizerViewController alloc] init];
    
    Item* uiViewCALayerItem = [[Item alloc] initWithTitle:@"UIViewCALayer"];
    uiViewCALayerItem.vc = [[UIViewCALayerViewController alloc] init];

    // UIView end
    Item* uiViewItem = [[Item alloc] initWithTitle:@"UIView"];
    uiViewItem.children = @[uiViewFrameItem, uiViewClipsToBoundsItem, uiViewGestureRecongnizerItem, uiViewCALayerItem];
    
    // UILabel
    Item* uiLabelTextAlignmentItem = [[Item alloc] initWithTitle:@"UILabelTextAlignment"];
    uiLabelTextAlignmentItem.vc = [[UILabelTextAlignmentViewController alloc] init];
    
    Item* uiLabelBreakModeItem = [[Item alloc] initWithTitle:@"UILabelBreakMode"];
    uiLabelBreakModeItem.vc = [[UILabelBreakModeViewController alloc] init];
    
    Item* uiLabelBoundsItem = [[Item alloc] initWithTitle:@"UILabelBounds"];
    uiLabelBoundsItem.vc = [[UILabelBoundsViewController alloc] init];
    
    Item* uiLabelOtherItem = [[Item alloc] initWithTitle:@"UILabelOther"];
    uiLabelOtherItem.vc = [[UILabelOtherViewController alloc] init];
    
    // UILabel end
    Item* uiLabelItem = [[Item alloc] initWithTitle:@"UILabel"];
    uiLabelItem.children = @[uiLabelTextAlignmentItem, uiLabelBreakModeItem, uiLabelBoundsItem, uiLabelOtherItem];
    
    // UIImageView
    Item* uiImageAnimationViewItem = [[Item alloc] initWithTitle:@"UIImageViewAnimation"];
    uiImageAnimationViewItem.vc = [[UIImageViewAnimationViewController alloc] init];
    
    Item* uiImageContentModeViewItem = [[Item alloc] initWithTitle:@"UIImageViewContentMode"];
    uiImageContentModeViewItem.vc = [[UIImageViewContentModeViewController alloc] init];
    
    // UIImageView end
    Item* uiImageViewItem = [[Item alloc] initWithTitle:@"UIImageView"];
    uiImageViewItem.children = @[uiImageAnimationViewItem, uiImageContentModeViewItem];
    
    // UIControl
    Item* uiControlItem = [[Item alloc] initWithTitle:@"UIControl"];
    uiControlItem.vc = [[UIControlViewViewController alloc] init];
    // UIControl end
    
    // UIButton
    Item* uiButtonNormalItem = [[Item alloc] initWithTitle:@"UIButtonNormal"];
    uiButtonNormalItem.vc = [[UIButtonNormalViewController alloc] init];
    
    Item* uiButtonStyleItem = [[Item alloc] initWithTitle:@"UIButtonStyle"];
    uiButtonStyleItem.vc = [[UIButtonStyleViewController alloc] init];
    
    Item* uiButtonEdgeInsetsItem = [[Item alloc] initWithTitle:@"UIButtonEdgeInsets"];
    uiButtonEdgeInsetsItem.vc = [[UIButtonEdgeInsetsViewController alloc] init];
    
    // UIButton end
    Item* uiButtonItem = [[Item alloc] initWithTitle:@"UIButton"];
    uiButtonItem.children = @[uiButtonNormalItem, uiButtonStyleItem, uiButtonEdgeInsetsItem];
    
    // UITextField
    Item* uiTextFieldNormalItem = [[Item alloc] initWithTitle:@"UITextFieldNormal"];
    uiTextFieldNormalItem.vc = [[UITextFieldNormalViewController alloc] init];
    
    Item* uiTextFieldKeyBoardItem = [[Item alloc] initWithTitle:@"UITextFieldKeyBoard"];
    uiTextFieldKeyBoardItem.vc = [[UITextFieldKeyBoardViewController alloc] init];
    
    Item* uiTextFieldReturnTypeItem = [[Item alloc] initWithTitle:@"UITextFieldReturnType"];
    uiTextFieldReturnTypeItem.vc = [[UITextFieldReturnTypeViewController alloc] init];
    
    Item* uiTextFieldNotificationItem = [[Item alloc] initWithTitle:@"UITextFieldNotification"];
    uiTextFieldNotificationItem.vc = [[UITextFieldNotificationViewController alloc] init];
    
    // UITextField end
    Item* uiTextFieldItem = [[Item alloc] initWithTitle:@"UITextField"];
    uiTextFieldItem.children = @[uiTextFieldNormalItem, uiTextFieldKeyBoardItem, uiTextFieldReturnTypeItem, uiTextFieldNotificationItem];
    
    // UITextView
    Item* uiTextViewNormalItem = [[Item alloc] initWithTitle:@"UITextViewNormal"];
    uiTextViewNormalItem.vc = [[UITextViewNormalViewController alloc] init];
    
    Item* uiTextViewInputItem = [[Item alloc] initWithTitle:@"UITextViewInput"];
    uiTextViewInputItem.vc = [[UITextViewInputViewController alloc] init];
    
    Item* uiTextViewDelegateItem = [[Item alloc] initWithTitle:@"UITextViewDelegate"];
    uiTextViewDelegateItem.vc = [[UITextViewDelegateViewController alloc] init];
    
    // UITextView end
    Item* uiTextViewItem = [[Item alloc] initWithTitle:@"UITextView"];
    uiTextViewItem.children = @[uiTextViewNormalItem, uiTextViewInputItem, uiTextViewDelegateItem];
    
    // UISwitch
    Item* uiSwitchItem = [[Item alloc] initWithTitle:@"UISwitch"];
    uiSwitchItem.vc = [[UISwitchNormalViewController alloc] init];
    
    // UIPageControl
    Item* uiPageControlItem = [[Item alloc] initWithTitle:@"UIPageControl"];
    uiPageControlItem.vc = [[UIPageControlViewController alloc] init];
    
    // UISegmentedControl
    Item* uiSegmentedControlNormalItem = [[Item alloc] initWithTitle:@"UISegmentedControlNormal"];
    uiSegmentedControlNormalItem.vc = [[UISegmentedControlNormalViewController alloc] init];
    
    Item* uiSegmentedControlSetItem = [[Item alloc] initWithTitle:@"UISegmentedControlSet"];
    uiSegmentedControlSetItem.vc = [[UISegmentedControlSetViewController alloc] init];

    Item* uiSegmentedControlOperationItem = [[Item alloc] initWithTitle:@"UISegmentedControlOperation"];
    uiSegmentedControlOperationItem.vc = [[UISegmentedControlOperationViewController alloc] init];
    
    Item* uiSegmentedControlEventItem = [[Item alloc] initWithTitle:@"UISegmentedControlEvent"];
    uiSegmentedControlEventItem.vc = [[UISegmentedControlEventViewController alloc] init];
    
    // UISegmentedControl end
    Item* uiSegmentedControlItem = [[Item alloc] initWithTitle:@"UISegmentedControl"];
    uiSegmentedControlItem.children = @[uiSegmentedControlNormalItem, uiSegmentedControlSetItem, uiSegmentedControlOperationItem, uiSegmentedControlEventItem];
    
    // UISlider
    Item* uiSliderItem = [[Item alloc] initWithTitle:@"UISlider"];
    uiSliderItem.vc = [[UISliderViewController alloc] init];
    
    // UIActivityIndicatorView
    Item* uiActivityIndicatorViewItem = [[Item alloc] initWithTitle:@"UIActivityIndicatorView"];
    uiActivityIndicatorViewItem.vc = [[UIActivityIndicatorViewController alloc] init];
    
    // UIProgressView
    Item* uiProgressViewItem = [[Item alloc] initWithTitle:@"UIProgressView"];
    uiProgressViewItem.vc = [[UIProgressViewController alloc] init];
    
    // UIStepper
    Item* uiStepperItem = [[Item alloc] initWithTitle:@"UIStepper"];
    uiStepperItem.vc = [[UIStepperViewController alloc] init];
    
    // UIPickerView
    Item* uiPickerViewItem = [[Item alloc] initWithTitle:@"UIPickerView"];
    uiPickerViewItem.vc = [[UIPickerViewController alloc] init];
    
    // UIDatePicker
    Item* uiDatePickerDateItem = [[Item alloc] initWithTitle:@"UIDatePickerDate"];
    uiDatePickerDateItem.vc = [[UIDatePickerDateViewController alloc] init];
    
    Item* uiDatePickerTimeItem = [[Item alloc] initWithTitle:@"UIDatePickerTime"];
    uiDatePickerTimeItem.vc = [[UIDatePickerTimeViewController alloc] init];
    
    Item* uiDatePickerDateAndTimeItem = [[Item alloc] initWithTitle:@"UIDatePickerDateAndTime"];
    uiDatePickerDateAndTimeItem.vc = [[UIDatePickerDateAndTimeViewController alloc] init];
    
    Item* uiDatePickerCountDownTimerItem = [[Item alloc] initWithTitle:@"UIDatePickerCountDownTimer"];
    uiDatePickerCountDownTimerItem.vc = [[UIDatePickerCountDownTimerViewController alloc] init];
    
    // UIDatePicker end
    Item* uiDatePickerItem = [[Item alloc] initWithTitle:@"UIDatePicker"];
    uiDatePickerItem.children = @[uiDatePickerDateItem, uiDatePickerTimeItem, uiDatePickerDateAndTimeItem, uiDatePickerCountDownTimerItem];
    
    // UIAlertController
    Item* uiAlertControllerItem = [[Item alloc] initWithTitle:@"UIAlertController"];
    uiAlertControllerItem.vc = [[UIAlertControllerViewController alloc] init];
    
    Item* widgetItem = [[Item alloc] initWithTitle:@"Widget"];
    widgetItem.children = @[uiViewItem, uiLabelItem, uiImageViewItem, uiControlItem, uiButtonItem, uiTextFieldItem,
                            uiTextViewItem, uiSwitchItem, uiPageControlItem, uiSegmentedControlItem, uiSliderItem,
                            uiActivityIndicatorViewItem, uiProgressViewItem, uiStepperItem, uiPickerViewItem,
                            uiDatePickerItem, uiAlertControllerItem];
    
    return widgetItem;
}

-(Item*) thirdItem {
    // SVProgressHUD
    Item* svProgressHUDNormalItem = [[Item alloc] initWithTitle:@"SVProgressHUDNormal"];
    svProgressHUDNormalItem.vc = [[SVProgressHUDNormalViewController alloc] init];
    
    // SVProgressHUD end
    Item* svProgressHUDItem = [[Item alloc] initWithTitle:@"SVProgressHUD"];
    svProgressHUDItem.children = @[svProgressHUDNormalItem];
    
    Item* thirdItem = [[Item alloc] initWithTitle: @"Third"];
    thirdItem.children = @[svProgressHUDItem];
    
    return thirdItem;
}

#pragma mark - UITableView -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.item.children.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoTableViewCell* tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"DemoTableViewCellId" forIndexPath:indexPath];
    
    Item* item = self.item.children[indexPath.row];
    [tableViewCell setTitle: item.title];
    
    return tableViewCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 52;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Item* item = self.item.children[indexPath.row];
    if (item.children) {
        ViewController* vc = [[ViewController alloc] init];
        vc.item = item;
        [self.navigationController pushViewController:vc animated:true];
    } else {
        [self.navigationController pushViewController:item.vc animated:true];
    }
}

@end
