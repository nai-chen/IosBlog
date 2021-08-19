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

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (!self.item) {
        // Application item
        Item *applicationItem = [self applicationItem];
        
        // Image item
        Item *imageItem = [self imageItem];
        
        // Widget item
        Item *widgetItem = [self widgetItem];
        
        // Third item
        Item *thirdItem = [self thirdItem];
        
        self.item = [[Item alloc] initWithTitle:@""];
        self.item.children = @[applicationItem, imageItem, widgetItem, thirdItem];
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

- (Item *)applicationItem {
    // UIFont
    Item *uiSystemFontItem = [[Item alloc] initWithTitle:@"UISystemFont"];
    uiSystemFontItem.viewController = @"UISystemFontViewController";
    
    Item *uiFontFamilyItem = [[Item alloc] initWithTitle:@"UIFontFamily"];
    uiFontFamilyItem.viewController = @"UIFontFamilyViewController";
    
    Item *uiPreferredFontItem = [[Item alloc] initWithTitle:@"UIPreferredFont"];
    uiPreferredFontItem.viewController = @"UIFontPreferredFontViewController";
    
    Item *uiFontLangTingItem = [[Item alloc] initWithTitle:@"UIFontLangTing"];
    uiFontLangTingItem.viewController = @"UIFontLangTingViewController";
    
    // UIFont end
    Item *uiFontItem = [[Item alloc] initWithTitle:@"UIFont"];
    uiFontItem.children = @[uiSystemFontItem, uiFontFamilyItem, uiPreferredFontItem, uiFontLangTingItem];
    
    // UserDefaults
    Item *userDefaultsItem = [[Item alloc] initWithTitle:@"UserDefaults"];
    userDefaultsItem.viewController = @"NSUserDefaultsViewController";
    
    // AttributeString
    Item *attributeStringNormalItem = [[Item alloc] initWithTitle:@"AttributeStringNormal"];
    attributeStringNormalItem.viewController = @"AttributeStringNormalViewController";
    
    Item *AttributeStringParagraphStyleItem = [[Item alloc] initWithTitle:@"AttributeStringParagraphStyle"];
    AttributeStringParagraphStyleItem.viewController = @"AttributeStringParagraphStyleViewController";
    
    // AttributeString end
    Item *attributeStringItem = [[Item alloc] initWithTitle:@"AttributeString"];
    attributeStringItem.children = @[attributeStringNormalItem, AttributeStringParagraphStyleItem];
    
    // NSNotificationCenter
    Item *notificationCenterItem = [[Item alloc] initWithTitle:@"NSNotificationCenter"];
    notificationCenterItem.viewController = @"NSNoticationViewController";

    // SafeArea
    Item *safeAreaItem = [[Item alloc] initWithTitle:@"SafeArea"];
    safeAreaItem.viewController = @"SafeAreaNormalViewController";

    // NSURLConnection
    Item *urlConnectionItem = [[Item alloc] initWithTitle:@"NSURLConnection"];
    urlConnectionItem.viewController = @"NSURLConnectionViewController";
    
    // NSURLSession
    Item *urlSessionItem = [[Item alloc] initWithTitle:@"NSURLSession"];
    urlSessionItem.viewController = @"NSURLSessionViewController";
    
    // Sandbox
    Item *sandboxItem = [[Item alloc] initWithTitle:@"Sandbox"];
    sandboxItem.viewController = @"SandboxViewController";
    
    // NSKeyedArchiver
    Item *keyedArchiverItem = [[Item alloc] initWithTitle:@"NSKeyedArchiver"];
    keyedArchiverItem.viewController = @"NSKeyedArchiverViewController";
    
    Item *applicationItem = [[Item alloc] initWithTitle:@"Application"];
    applicationItem.children = @[uiFontItem, userDefaultsItem, attributeStringItem, notificationCenterItem, safeAreaItem,
                           urlConnectionItem, urlSessionItem, sandboxItem, keyedArchiverItem];
    
    return applicationItem;
}

- (Item *)imageItem {
    // UIColor
    Item *uiColorItem = [[Item alloc] initWithTitle:@"UIColor"];
    uiColorItem.viewController = @"UIColorViewController";
    
    // Animation
    Item *animationNormalItem = [[Item alloc] initWithTitle:@"AnimationNormal"];
    animationNormalItem.viewController = @"AnimationNormalViewController";

    Item *animationTransformItem = [[Item alloc] initWithTitle:@"AnimationTransform"];
    animationTransformItem.viewController = @"AnimationTransformViewController";
    
    Item *animationCurveItem = [[Item alloc] initWithTitle:@"AnimationCurve"];
    animationCurveItem.viewController = @"AnimationCurveViewController";

    Item *animationSpringItem = [[Item alloc] initWithTitle:@"AnimationSpring"];
    animationSpringItem.viewController = @"AnimationSpringViewController";
    
    Item *animationTranstionItem = [[Item alloc] initWithTitle:@"AnimationTransition"];
    animationTranstionItem.viewController = @"AnimationTransitionViewController";
    
    Item *animationFrameItem = [[Item alloc] initWithTitle:@"AnimationFrame"];
    animationFrameItem.viewController = @"AnimationFrameViewController";
    
    // Animtion end
    Item *animationItem = [[Item alloc] initWithTitle:@"Animation"];
    animationItem.children = @[animationNormalItem, animationTransformItem, animationCurveItem, animationSpringItem,
                               animationTranstionItem, animationFrameItem];
    
    // Layer Animation
    Item *layerAnimationNormalItem = [[Item alloc] initWithTitle:@"Normal"];
    layerAnimationNormalItem.viewController = @"LayerAnimationNormalViewController";
    
    Item *layerAnimationTransactionItem = [[Item alloc] initWithTitle:@"Transaction"];
    layerAnimationTransactionItem.viewController = @"LayerAnimationTransactionViewController";
    
    Item *layerAnimationCustomItem = [[Item alloc] initWithTitle:@"Custom"];
    layerAnimationCustomItem.viewController = @"LayerAnimationCustomViewController";
    
    // Layer Animtion end
    Item *layerAnimationItem = [[Item alloc] initWithTitle:@"LayerAnimation"];
    layerAnimationItem.children = @[layerAnimationNormalItem, layerAnimationTransactionItem, layerAnimationCustomItem];
    
    // Core Animation
    Item *basicAnimationItem = [[Item alloc] initWithTitle:@"CABasicAnimation"];
    basicAnimationItem.viewController = @"CABasicAnimationViewController";
    
    Item *keyframeAnimationValueItem = [[Item alloc] initWithTitle:@"CAKeyframeAnimation_Value"];
    keyframeAnimationValueItem.viewController = @"CAKeyframeAnimationValueViewController";
    
    Item *keyframeAnimationPathItem = [[Item alloc] initWithTitle:@"CAKeyframeAnimation_Path"];
    keyframeAnimationPathItem.viewController = @"CAKeyframeAnimationPathViewController";
    
    Item *animationGroupPathItem = [[Item alloc] initWithTitle:@"CAAnimationGroup"];
    animationGroupPathItem.viewController = @"CAAnimationGroupViewController";
    
    // Core Animation end
    Item *coreAnimationItem = [[Item alloc] initWithTitle:@"CoreAnimation"];
    coreAnimationItem.children = @[basicAnimationItem, keyframeAnimationValueItem, keyframeAnimationPathItem, animationGroupPathItem];

    // AVPlayer
    Item *avPlayerNormalItem = [[Item alloc] initWithTitle:@"AVPlayerNormal"];
    avPlayerNormalItem.viewController = @"AVPlayerNormalViewController";
    
    Item *avPlayerItemItem = [[Item alloc] initWithTitle:@"AVPlayerItem"];
    avPlayerItemItem.viewController = @"AVPlayerItemViewController";
    
    Item *avPlayerViewControllerItem = [[Item alloc] initWithTitle:@"AVPlayerViewController"];
    avPlayerViewControllerItem.viewController = @"AVPlayerViewControllerViewController";
    
    // AVPlayer end
    Item *avPlayerItem = [[Item alloc] initWithTitle:@"AVPlayer"];
    avPlayerItem.children = @[avPlayerNormalItem, avPlayerItemItem, avPlayerViewControllerItem];

    Item *imagePickerItem = [[Item alloc] initWithTitle:@"ImagePicker"];
    imagePickerItem.viewController = @"UIImagePickerViewController";
//
//    // Core Graphics
//    Item *coreGraphicsItem = [[Item alloc] initWithTitle:@"CoreGraphics"];
    
    // Image
    Item *imageItem = [[Item alloc] initWithTitle:@"Image"];
    imageItem.children = @[uiColorItem, animationItem, layerAnimationItem, coreAnimationItem, avPlayerItem,
                           imagePickerItem
    ];

    return imageItem;
}


- (Item *)widgetItem {
    // UIView
    Item *uiViewFrameItem = [[Item alloc] initWithTitle:@"UIViewFrame"];
    uiViewFrameItem.viewController = @"UIViewFrameViewController";
    
    Item *uiViewClipsToBoundsItem = [[Item alloc] initWithTitle:@"UIViewClipsToBounds"];
    uiViewClipsToBoundsItem.viewController = @"UIViewClipsToBoundsViewController";
    
    Item *uiViewGestureRecongnizerItem = [[Item alloc] initWithTitle:@"UIViewGestureRecongnizer"];
    uiViewGestureRecongnizerItem.viewController = @"UIViewGestureRecongnizerViewController";
    
    Item *uiViewCALayerItem = [[Item alloc] initWithTitle:@"UIViewCALayer"];
    uiViewCALayerItem.viewController = @"UIViewCALayerViewController";

    // UIView end
    Item *uiViewItem = [[Item alloc] initWithTitle:@"UIView"];
    uiViewItem.children = @[uiViewFrameItem, uiViewClipsToBoundsItem, uiViewGestureRecongnizerItem, uiViewCALayerItem];
    
    // UILabel
    Item *uiLabelTextAlignmentItem = [[Item alloc] initWithTitle:@"UILabelTextAlignment"];
    uiLabelTextAlignmentItem.viewController = @"UILabelTextAlignmentViewController";
    
    Item *uiLabelBreakModeItem = [[Item alloc] initWithTitle:@"UILabelBreakMode"];
    uiLabelBreakModeItem.viewController = @"UILabelBreakModeViewController";
    
    Item *uiLabelBoundsItem = [[Item alloc] initWithTitle:@"UILabelBounds"];
    uiLabelBoundsItem.viewController = @"UILabelBoundsViewController";
    
    Item *uiLabelOtherItem = [[Item alloc] initWithTitle:@"UILabelOther"];
    uiLabelOtherItem.viewController = @"UILabelOtherViewController";
    
    // UILabel end
    Item *uiLabelItem = [[Item alloc] initWithTitle:@"UILabel"];
    uiLabelItem.children = @[uiLabelTextAlignmentItem, uiLabelBreakModeItem, uiLabelBoundsItem, uiLabelOtherItem];
    
    // UIImageView
    Item *uiImageAnimationViewItem = [[Item alloc] initWithTitle:@"UIImageViewAnimation"];
    uiImageAnimationViewItem.viewController = @"UIImageViewAnimationViewController";
    
    Item *uiImageContentModeViewItem = [[Item alloc] initWithTitle:@"UIImageViewContentMode"];
    uiImageContentModeViewItem.viewController = @"UIImageViewContentModeViewController";
    
    // UIImageView end
    Item *uiImageViewItem = [[Item alloc] initWithTitle:@"UIImageView"];
    uiImageViewItem.children = @[uiImageAnimationViewItem, uiImageContentModeViewItem];
    
    // UIControl
    Item *uiControlItem = [[Item alloc] initWithTitle:@"UIControl"];
    uiControlItem.viewController = @"UIControlViewViewController";
    // UIControl end
    
    // UIButton
    Item *uiButtonNormalItem = [[Item alloc] initWithTitle:@"UIButtonNormal"];
    uiButtonNormalItem.viewController = @"UIButtonNormalViewController";
    
    Item *uiButtonStyleItem = [[Item alloc] initWithTitle:@"UIButtonStyle"];
    uiButtonStyleItem.viewController = @"UIButtonStyleViewController";
    
    Item *uiButtonEdgeInsetsItem = [[Item alloc] initWithTitle:@"UIButtonEdgeInsets"];
    uiButtonEdgeInsetsItem.viewController = @"UIButtonEdgeInsetsViewController";
    
    // UIButton end
    Item *uiButtonItem = [[Item alloc] initWithTitle:@"UIButton"];
    uiButtonItem.children = @[uiButtonNormalItem, uiButtonStyleItem, uiButtonEdgeInsetsItem];
    
    // UITextField
    Item *uiTextFieldNormalItem = [[Item alloc] initWithTitle:@"UITextFieldNormal"];
    uiTextFieldNormalItem.viewController = @"UITextFieldNormalViewController";
    
    Item *uiTextFieldKeyBoardItem = [[Item alloc] initWithTitle:@"UITextFieldKeyBoard"];
    uiTextFieldKeyBoardItem.viewController = @"UITextFieldKeyBoardViewController";
    
    Item *uiTextFieldReturnTypeItem = [[Item alloc] initWithTitle:@"UITextFieldReturnType"];
    uiTextFieldReturnTypeItem.viewController = @"UITextFieldReturnTypeViewController";
    
    Item *uiTextFieldNotificationItem = [[Item alloc] initWithTitle:@"UITextFieldNotification"];
    uiTextFieldNotificationItem.viewController = @"UITextFieldNotificationViewController";
    
    // UITextField end
    Item *uiTextFieldItem = [[Item alloc] initWithTitle:@"UITextField"];
    uiTextFieldItem.children = @[uiTextFieldNormalItem, uiTextFieldKeyBoardItem, uiTextFieldReturnTypeItem, uiTextFieldNotificationItem];
    
    // UITextView
    Item *uiTextViewNormalItem = [[Item alloc] initWithTitle:@"UITextViewNormal"];
    uiTextViewNormalItem.viewController = @"UITextViewNormalViewController";
    
    Item *uiTextViewInputItem = [[Item alloc] initWithTitle:@"UITextViewInput"];
    uiTextViewInputItem.viewController = @"UITextViewInputViewController";
    
    Item *uiTextViewDelegateItem = [[Item alloc] initWithTitle:@"UITextViewDelegate"];
    uiTextViewDelegateItem.viewController = @"UITextViewDelegateViewController";
    
    // UITextView end
    Item *uiTextViewItem = [[Item alloc] initWithTitle:@"UITextView"];
    uiTextViewItem.children = @[uiTextViewNormalItem, uiTextViewInputItem, uiTextViewDelegateItem];
    
    // UISwitch
    Item *uiSwitchItem = [[Item alloc] initWithTitle:@"UISwitch"];
    uiSwitchItem.viewController = @"UISwitchNormalViewController";
    
    // UIPageControl
    Item *uiPageControlItem = [[Item alloc] initWithTitle:@"UIPageControl"];
    uiPageControlItem.viewController = @"UIPageControlViewController";
    
    // UISegmentedControl
    Item *uiSegmentedControlNormalItem = [[Item alloc] initWithTitle:@"UISegmentedControlNormal"];
    uiSegmentedControlNormalItem.viewController = @"UISegmentedControlNormalViewController";
    
    Item *uiSegmentedControlSetItem = [[Item alloc] initWithTitle:@"UISegmentedControlSet"];
    uiSegmentedControlSetItem.viewController = @"UISegmentedControlSetViewController";

    Item *uiSegmentedControlOperationItem = [[Item alloc] initWithTitle:@"UISegmentedControlOperation"];
    uiSegmentedControlOperationItem.viewController = @"UISegmentedControlOperationViewController";
    
    Item *uiSegmentedControlEventItem = [[Item alloc] initWithTitle:@"UISegmentedControlEvent"];
    uiSegmentedControlEventItem.viewController = @"UISegmentedControlEventViewController";
    
    // UISegmentedControl end
    Item *uiSegmentedControlItem = [[Item alloc] initWithTitle:@"UISegmentedControl"];
    uiSegmentedControlItem.children = @[uiSegmentedControlNormalItem, uiSegmentedControlSetItem, uiSegmentedControlOperationItem, uiSegmentedControlEventItem];
    
    // UISlider
    Item *uiSliderItem = [[Item alloc] initWithTitle:@"UISlider"];
    uiSliderItem.viewController = @"UISliderViewController";
    
    // UIActivityIndicatorView
    Item *uiActivityIndicatorViewItem = [[Item alloc] initWithTitle:@"UIActivityIndicatorView"];
    uiActivityIndicatorViewItem.viewController = @"UIActivityIndicatorViewController";
    
    // UIProgressView
    Item *uiProgressViewItem = [[Item alloc] initWithTitle:@"UIProgressView"];
    uiProgressViewItem.viewController = @"UIProgressViewController";
    
    // UIStepper
    Item *uiStepperItem = [[Item alloc] initWithTitle:@"UIStepper"];
    uiStepperItem.viewController = @"UIStepperViewController";
    
    // UIPickerView
    Item *uiPickerViewItem = [[Item alloc] initWithTitle:@"UIPickerView"];
    uiPickerViewItem.viewController = @"UIPickerViewController";
    
    // UIDatePicker
    Item *uiDatePickerDateItem = [[Item alloc] initWithTitle:@"UIDatePickerDate"];
    uiDatePickerDateItem.viewController = @"UIDatePickerDateViewController";
    
    Item *uiDatePickerTimeItem = [[Item alloc] initWithTitle:@"UIDatePickerTime"];
    uiDatePickerTimeItem.viewController = @"UIDatePickerTimeViewController";
    
    Item *uiDatePickerDateAndTimeItem = [[Item alloc] initWithTitle:@"UIDatePickerDateAndTime"];
    uiDatePickerDateAndTimeItem.viewController = @"UIDatePickerDateAndTimeViewController";
    
    Item *uiDatePickerCountDownTimerItem = [[Item alloc] initWithTitle:@"UIDatePickerCountDownTimer"];
    uiDatePickerCountDownTimerItem.viewController = @"UIDatePickerCountDownTimerViewController";
    
    // UIDatePicker end
    Item *uiDatePickerItem = [[Item alloc] initWithTitle:@"UIDatePicker"];
    uiDatePickerItem.children = @[uiDatePickerDateItem, uiDatePickerTimeItem, uiDatePickerDateAndTimeItem, uiDatePickerCountDownTimerItem];
    
    // UIAlertController
    Item *uiAlertControllerItem = [[Item alloc] initWithTitle:@"UIAlertController"];
    uiAlertControllerItem.viewController = @"UIAlertControllerViewController";
    
    // UIScrollView
    Item *uiScrollViewNormalItem = [[Item alloc] initWithTitle:@"UIScrollViewNormal"];
    uiScrollViewNormalItem.viewController = @"UIScrollViewNormalViewController";

    Item *uiScrollViewZoomItem = [[Item alloc] initWithTitle:@"UIScrollViewZoom"];
    uiScrollViewZoomItem.viewController = @"UIScrollViewZoomViewController";
    
    Item *uiScrollViewPageItem = [[Item alloc] initWithTitle:@"UIScrollViewPage"];
    uiScrollViewPageItem.viewController = @"UIScrollViewPageViewController";
    
    // UIScrollView end
    Item *uiScrollViewItem = [[Item alloc] initWithTitle:@"UIScrollView"];
    uiScrollViewItem.children = @[uiScrollViewNormalItem, uiScrollViewZoomItem, uiScrollViewPageItem];
    
    // UICollectionView
    Item *uiCollectionViewNormalItem = [[Item alloc] initWithTitle:@"UICollectionViewNormal"];
    uiCollectionViewNormalItem.viewController = @"UICollectionViewNormalViewController";
    
    Item *uiCollectionViewLayoutItem = [[Item alloc] initWithTitle:@"UICollectionViewLayout"];
    uiCollectionViewLayoutItem.viewController = @"UICollectionViewLayoutViewController";
    
    Item *uiCollectionViewFlowLayoutItem = [[Item alloc] initWithTitle:@"UICollectionViewFlowLayout"];
    uiCollectionViewFlowLayoutItem.viewController = @"UICollectionViewFlowLayoutViewController";
    
    Item *uiCollectionViewCircleLayoutItem = [[Item alloc] initWithTitle:@"UICollectionViewCircleLayout"];
    uiCollectionViewCircleLayoutItem.viewController = @"UICollectionViewCircleLayoutViewController";

    Item *uiCollectionViewWheelLayoutItem = [[Item alloc] initWithTitle:@"UICollectionViewWheelLayout"];
    uiCollectionViewWheelLayoutItem.viewController = @"UICollectionViewWheelLayoutViewController";

    // UICollectionView end
    Item *uiCollectionViewItem = [[Item alloc] initWithTitle:@"UICollectionView"];
    uiCollectionViewItem.children = @[uiCollectionViewNormalItem, uiCollectionViewLayoutItem, uiCollectionViewFlowLayoutItem,
                                      uiCollectionViewCircleLayoutItem, uiCollectionViewWheelLayoutItem];
    
    Item *widgetItem = [[Item alloc] initWithTitle:@"Widget"];
    widgetItem.children = @[uiViewItem, uiLabelItem, uiImageViewItem, uiControlItem, uiButtonItem, uiTextFieldItem,
                            uiTextViewItem, uiSwitchItem, uiPageControlItem, uiSegmentedControlItem, uiSliderItem,
                            uiActivityIndicatorViewItem, uiProgressViewItem, uiStepperItem, uiPickerViewItem,
                            uiDatePickerItem, uiAlertControllerItem, uiScrollViewItem, uiCollectionViewItem];
    
    return widgetItem;
}

- (Item *)thirdItem {
    // MJExtension
    Item *mjExtensionItem = [[Item alloc] initWithTitle:@"MJExtension"];
    mjExtensionItem.viewController = @"MJExtensionViewController";
    
    // SVProgressHUD
    Item *svProgressHUDNormalItem = [[Item alloc] initWithTitle:@"SVProgressHUDNormal"];
    svProgressHUDNormalItem.viewController = @"SVProgressHUDNormalViewController";
    
    // SVProgressHUD end
    Item *svProgressHUDItem = [[Item alloc] initWithTitle:@"SVProgressHUD"];
    svProgressHUDItem.children = @[svProgressHUDNormalItem];
    
    // AFNetworking
    Item *afNetworkingItem = [[Item alloc] initWithTitle:@"AFNetworking"];
    afNetworkingItem.viewController = @"AFNetworkingViewController";
    
    Item *thirdItem = [[Item alloc] initWithTitle: @"Third"];
    thirdItem.children = @[mjExtensionItem, svProgressHUDItem, afNetworkingItem];
    
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
    DemoTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"DemoTableViewCellId" forIndexPath:indexPath];
    
    Item *item = self.item.children[indexPath.row];
    [tableViewCell setTitle: item.title];
    
    return tableViewCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 52;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Item *item = self.item.children[indexPath.row];
    if (item.children) {
        ViewController *viewController = [[ViewController alloc] init];
        viewController.item = item;
        [self.navigationController pushViewController:viewController animated:true];
    } else {
        Class cls = NSClassFromString(item.viewController);
        [self.navigationController pushViewController:[[cls alloc] init] animated:true];
    }
}

@end
