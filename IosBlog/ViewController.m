//
//  ViewController.m
//  IosBlog
//
//  Created by PeterChen on 2020/11/26.
//

#import "ViewController.h"

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
        
        // Component item
        Item *componentItem = [self componentItem];
        
        // Widget item
        Item *widgetItem = [self widgetItem];
        
        // Image item
        Item *imageItem = [self imageItem];
        
        self.item = [[Item alloc] initWithTitle:@""];
        self.item.children = @[applicationItem, componentItem, imageItem, widgetItem];
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
    // MJExtension
    Item *mjExtensionItem = [[Item alloc] initWithTitle:@"MJExtension"];
    mjExtensionItem.viewController = @"MJExtensionViewController";

    // OpenUDID
    Item *openUDIDItem = [[Item alloc] initWithTitle:@"OpenUDID"];
    openUDIDItem.viewController = @"OpenUDIDViewController";
    
    // AFNetworking
    Item *afNetworkingItem = [[Item alloc] initWithTitle:@"AFNetworking"];
    afNetworkingItem.viewController = @"AFNetworkingViewController";


    // UKOverlayView
    Item *overlayViewItem = [[Item alloc] initWithTitle:@"UKOverlayView"];
    overlayViewItem.viewController = @"UKOverlayViewController";
    
    // NestedScrollView
    Item *nestedTableViewItem = [[Item alloc] initWithTitle:@"NestedTableView"];
    nestedTableViewItem.viewController = @"NestedTableViewController";

    Item *nestedTabTableViewItem = [[Item alloc] initWithTitle:@"NestedTabTableView"];
    nestedTabTableViewItem.viewController = @"NestedTabTableViewController";
    
    Item *nestedScrollViewItem = [[Item alloc] initWithTitle:@"NestedScrollView"];
    nestedScrollViewItem.viewController = @"NestedScrollViewController";

    Item *nestedViewItem = [[Item alloc] initWithTitle:@"NestedView"];
    nestedViewItem.children = @[nestedTableViewItem, nestedTabTableViewItem, nestedScrollViewItem];
    // NestedScrollView end
    
    // UKInputTableView
    Item *inputTableViewItem = [[Item alloc] initWithTitle:@"UKInputTableView"];
    inputTableViewItem.viewController = @"UKInputTableViewController";
    
    Item *applicationItem = [[Item alloc] initWithTitle:@"Application"];
    applicationItem.children = @[mjExtensionItem, openUDIDItem, afNetworkingItem, overlayViewItem, nestedViewItem,
                                 inputTableViewItem];
    
    return applicationItem;
}

- (Item *)componentItem {
    // UserDefaults
    Item *userDefaultsItem = [[Item alloc] initWithTitle:@"UserDefaults"];
    userDefaultsItem.viewController = @"NSUserDefaultsViewController";
    
    
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

    // CoreData
    Item *coreDataItem = [[Item alloc] initWithTitle:@"CoreData"];
    coreDataItem.viewController = @"CoreDataViewController";
    
    // PushModal
    Item *pushModalItem = [[Item alloc] initWithTitle:@"PushModal"];
    pushModalItem.viewController = @"PushModalViewController";

    // PresentModal
    Item *presentModalItem = [[Item alloc] initWithTitle:@"PresentModal"];
    presentModalItem.viewController = @"PresentModalViewController";
    
    Item *componentItem = [[Item alloc] initWithTitle:@"Component"];
    componentItem.children = @[userDefaultsItem, notificationCenterItem, safeAreaItem,
                           urlConnectionItem, urlSessionItem, sandboxItem, keyedArchiverItem, coreDataItem,
                           pushModalItem, presentModalItem];
    
    return componentItem;
}

- (Item *)widgetItem {
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
        
    // AttributeString
    Item *attributeStringNormalItem = [[Item alloc] initWithTitle:@"AttributeStringNormal"];
    attributeStringNormalItem.viewController = @"AttributeStringNormalViewController";
    
    Item *AttributeStringParagraphStyleItem = [[Item alloc] initWithTitle:@"AttributeStringParagraphStyle"];
    AttributeStringParagraphStyleItem.viewController = @"AttributeStringParagraphStyleViewController";
    
    // AttributeString end
    Item *attributeStringItem = [[Item alloc] initWithTitle:@"AttributeString"];
    attributeStringItem.children = @[attributeStringNormalItem, AttributeStringParagraphStyleItem];

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
    
    // UITableView
    Item *uiTableViewPlainItem = [[Item alloc] initWithTitle:@"UITableViewPlain"];
    uiTableViewPlainItem.viewController = @"UITableViewPlainViewController";
    
    Item *uiTableViewGroupedItem = [[Item alloc] initWithTitle:@"UITableViewGrouped"];
    uiTableViewGroupedItem.viewController = @"UITableViewGroupedViewController";
    
    Item *uiTableViewCellItem = [[Item alloc] initWithTitle:@"UITableViewCell"];
    uiTableViewCellItem.viewController = @"UITableViewCellViewController";

    Item *uiTableViewEditItem = [[Item alloc] initWithTitle:@"UITableViewEdit"];
    uiTableViewEditItem.viewController = @"UITableViewEditViewController";
    
    Item *uiTableViewEdit2Item = [[Item alloc] initWithTitle:@"UITableViewEdit2"];
    uiTableViewEdit2Item.viewController = @"UITableViewEdit2ViewController";

    Item *uiTableViewEdit3Item = [[Item alloc] initWithTitle:@"UITableViewEdit3"];
    uiTableViewEdit3Item.viewController = @"UITableViewEdit3ViewController";
    
    Item *uiTableViewMoveItem = [[Item alloc] initWithTitle:@"UITableViewMove"];
    uiTableViewMoveItem.viewController = @"UITableViewMoveViewController";

    Item *uiTableViewItem = [[Item alloc] initWithTitle:@"UITableView"];
    uiTableViewItem.children = @[uiTableViewPlainItem, uiTableViewGroupedItem, uiTableViewCellItem, uiTableViewEditItem,
                                 uiTableViewEdit2Item, uiTableViewEdit3Item, uiTableViewMoveItem];
    // UITableView end
    
    // UKMobileVerifyView
    Item *uiMobileVerifyViewItem = [[Item alloc] initWithTitle:@"MobileVerifyView"];
    uiMobileVerifyViewItem.viewController = @"UKMobileVerifyViewController";
    
    // SVProgressHUD
    Item *svProgressHUDNormalItem = [[Item alloc] initWithTitle:@"SVProgressHUDNormal"];
    svProgressHUDNormalItem.viewController = @"SVProgressHUDNormalViewController";

    Item *svProgressHUDStyleItem = [[Item alloc] initWithTitle:@"SVProgressHUDStyle"];
    svProgressHUDStyleItem.viewController = @"SVProgressHUDStyleViewController";

    // SVProgressHUD end
    Item *svProgressHUDItem = [[Item alloc] initWithTitle:@"SVProgressHUD"];
    svProgressHUDItem.children = @[svProgressHUDNormalItem, svProgressHUDStyleItem];

    // MJRefresh
    Item *mjRefreshStateItem = [[Item alloc] initWithTitle:@"MJRefreshState"];
    mjRefreshStateItem.viewController = @"MJRefreshStateViewController";

    Item *mjRefreshNormalItem = [[Item alloc] initWithTitle:@"MJRefreshNormal"];
    mjRefreshNormalItem.viewController = @"MJRefreshNormalViewController";

    Item *mjRefreshGifItem = [[Item alloc] initWithTitle:@"MJRefreshGif"];
    mjRefreshGifItem.viewController = @"MJRefreshGifViewController";

    Item *mjRefreshAutoItem = [[Item alloc] initWithTitle:@"MJRefreshAuto"];
    mjRefreshAutoItem.viewController = @"MJRefreshAutoViewController";

    // MJRefresh end
    Item *mjRefreshItem = [[Item alloc] initWithTitle:@"MJRefresh"];
    mjRefreshItem.children = @[mjRefreshStateItem, mjRefreshNormalItem, mjRefreshGifItem, mjRefreshAutoItem];
    
    // UKTabView
    Item *uiNormalTabViewItem = [[Item alloc] initWithTitle:@"NormalTabView"];
    uiNormalTabViewItem.viewController = @"UKNormalTabViewController";

    Item *uiCustomTabViewItem = [[Item alloc] initWithTitle:@"CustomTabView"];
    uiCustomTabViewItem.viewController = @"UKCustomTabViewController";
    
    Item *uiTabViewItem = [[Item alloc] initWithTitle:@"TabView"];
    uiTabViewItem.children = @[uiNormalTabViewItem, uiCustomTabViewItem];
    // UKTabView end
    
    // UKAutographView
    Item *uiAutographViewItem = [[Item alloc] initWithTitle:@"UKAutographView"];
    uiAutographViewItem.viewController = @"UKAutographViewController";
    
    // UKCalendarView
    Item *uiCalendarViewItem = [[Item alloc] initWithTitle:@"UKCalendarView"];
    uiCalendarViewItem.viewController = @"UKCalendarViewController";
    
    Item *widgetItem = [[Item alloc] initWithTitle:@"Widget"];
    widgetItem.children = @[uiFontItem, uiViewItem, uiLabelItem, attributeStringItem, uiImageViewItem,
                            uiControlItem, uiButtonItem, uiTextFieldItem, uiTextViewItem, uiSwitchItem,
                            uiPageControlItem, uiSegmentedControlItem, uiSliderItem, uiActivityIndicatorViewItem, uiProgressViewItem,
                            uiStepperItem, uiPickerViewItem, uiDatePickerItem, uiAlertControllerItem, uiScrollViewItem,
                            uiCollectionViewItem, uiTableViewItem, uiMobileVerifyViewItem, uiTabViewItem,
                            svProgressHUDItem, mjRefreshItem, uiAutographViewItem, uiCalendarViewItem];

    return widgetItem;
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

    // UIImagePicker
    Item *imagePickerItem = [[Item alloc] initWithTitle:@"ImagePicker"];
    imagePickerItem.viewController = @"UIImagePickerViewController";

    // UIImageSave
    Item *savedPhotosAlbumItem = [[Item alloc] initWithTitle:@"SavedPhotosAlbum"];
    savedPhotosAlbumItem.viewController = @"UIImageSaveViewController";
    
    // Core Graphics
    Item *coreGraphicsNormalItem = [[Item alloc] initWithTitle:@"Normal"];
    coreGraphicsNormalItem.viewController = @"CoreGraphicsNormalViewController";
    
    Item *coreGraphicsStrokeItem = [[Item alloc] initWithTitle:@"Stroke"];
    coreGraphicsStrokeItem.viewController = @"CoreGraphicsStrokeViewController";
    
    Item *coreGraphicsPathItem = [[Item alloc] initWithTitle:@"Path"];
    coreGraphicsPathItem.viewController = @"CoreGraphicsPathViewController";
    
    Item *coreGraphicsCurveItem = [[Item alloc] initWithTitle:@"Curve"];
    coreGraphicsCurveItem.viewController = @"CoreGraphicsCurveViewController";
    
    Item *coreGraphicsOtherItem = [[Item alloc] initWithTitle:@"Other"];
    coreGraphicsOtherItem.viewController = @"CoreGraphicsOtherViewController";
    
    // Core Graphics end
    Item *coreGraphicsItem = [[Item alloc] initWithTitle:@"CoreGraphics"];
    coreGraphicsItem.children = @[coreGraphicsNormalItem, coreGraphicsStrokeItem, coreGraphicsPathItem, coreGraphicsCurveItem, coreGraphicsOtherItem];
    
    
    // UIBezierPathNormalViewController
    Item *bezierPathNormalItem = [[Item alloc] initWithTitle:@"Normal"];
    bezierPathNormalItem.viewController = @"UIBezierPathNormalViewController";
    
    Item *bezierPathAreaItem = [[Item alloc] initWithTitle:@"Area"];
    bezierPathAreaItem.viewController = @"UIBezierPathAreaViewController";
    
    Item *bezierPathCurveItem = [[Item alloc] initWithTitle:@"Curve"];
    bezierPathCurveItem.viewController = @"UIBezierPathCurveViewController";
    
    // UIBezierPathNormalViewController end
    Item *bezierPathItem = [[Item alloc] initWithTitle:@"UIBezierPath"];
    bezierPathItem.children = @[bezierPathNormalItem, bezierPathAreaItem, bezierPathCurveItem];
    
    // CALayer
    Item *caShapeLayerItem = [[Item alloc] initWithTitle:@"CAShapeLayer"];
    caShapeLayerItem.viewController = @"CAShapeLayerViewController";
    
    Item *gridientLayerItem = [[Item alloc] initWithTitle:@"GridentLayer"];
    gridientLayerItem.viewController = @"CAGradientLayerViewController";
    
    Item *maskItem = [[Item alloc] initWithTitle:@"CALayer Mask"];
    maskItem.viewController = @"CALayerMaskViewController";
    
    // CALayer end
    Item *caLayerItem = [[Item alloc] initWithTitle:@"CALayer"];
    caLayerItem.children = @[caShapeLayerItem, gridientLayerItem, maskItem];
    
    // AVAudioPlayer
    Item *avAudioPlayerNormalItem = [[Item alloc] initWithTitle:@"Normal"];
    avAudioPlayerNormalItem.viewController = @"AVAudioPlayerNormalViewController";
    
    Item *avAudioPlayerCategoryItem = [[Item alloc] initWithTitle:@"Category"];
    avAudioPlayerCategoryItem.viewController = @"AVAudioPlayerCategoryViewController";
    
    Item *avAudioPlayerNotificationItem = [[Item alloc] initWithTitle:@"Notification"];
    avAudioPlayerNotificationItem.viewController = @"AVAudioPlayerNotificationViewController";
    
    // AVAudioPlayer end
    Item *avAudioPlayerItem = [[Item alloc] initWithTitle:@"AVAudioPlayer"];
    avAudioPlayerItem.children = @[avAudioPlayerNormalItem, avAudioPlayerCategoryItem, avAudioPlayerNotificationItem];
    
    // CAEmitterLayer
    Item *emitterLayerNormalItem = [[Item alloc] initWithTitle:@"Normal"];
    emitterLayerNormalItem.viewController = @"CAEmitterLayerNormalViewController";
    
    Item *emitterLayerPropertyItem = [[Item alloc] initWithTitle:@"Property"];
    emitterLayerPropertyItem.viewController = @"CAEmitterLayerPropertyViewController";
    
    Item *emitterCellItem = [[Item alloc] initWithTitle:@"Cell"];
    emitterCellItem.viewController = @"CAEmitterCellViewController";
    
    Item *emitterExampleItem = [[Item alloc] initWithTitle:@"Example"];
    emitterExampleItem.viewController = @"CAEmitterExampleViewController";
    
    // CAEmitterLayer end
    Item *emitterLayerItem = [[Item alloc] initWithTitle:@"CAEmitterLayer"];
    emitterLayerItem.children = @[emitterLayerNormalItem, emitterLayerPropertyItem, emitterCellItem, emitterExampleItem];
    

    // YBImageBrowser
    Item *imageBrowserItem = [[Item alloc] initWithTitle:@"ImageBrowser"];
    imageBrowserItem.viewController = @"YBImageBrowserViewController";

    // AVCaptureDevice
    Item *avCaptureDeviceItem = [[Item alloc] initWithTitle:@"AVCaptureDevice"];
    avCaptureDeviceItem.viewController = @"AVCaptureDeviceViewController";

    // Image
    Item *imageItem = [[Item alloc] initWithTitle:@"Image"];
    imageItem.children = @[uiColorItem, animationItem, layerAnimationItem, coreAnimationItem, avPlayerItem,
                           imagePickerItem, savedPhotosAlbumItem, coreGraphicsItem, bezierPathItem, caLayerItem,
                           avAudioPlayerItem, emitterLayerItem, imageBrowserItem, avCaptureDeviceItem
    ];

    return imageItem;
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
