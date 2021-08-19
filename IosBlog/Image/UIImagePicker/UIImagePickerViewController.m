//
//  UIImagePickerViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/19.
//

#import "UIImagePickerViewController.h"

@interface UIImagePickerViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property(nonatomic, strong) UIImageView *pickerImageView;

@end

@implementation UIImagePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.pickerImageView];
    
    UIButton *pickPhotoButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 420, 120, 20)];
    [pickPhotoButton setTitle:@"pick photo" forState:UIControlStateNormal];
    [pickPhotoButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [pickPhotoButton addTarget:self action:@selector(onPickPhotoClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pickPhotoButton];
    
    UIButton *pickAlbumButton = [[UIButton alloc] initWithFrame:CGRectMake(140, 420, 120, 20)];
    [pickAlbumButton setTitle:@"pick album" forState:UIControlStateNormal];
    [pickAlbumButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [pickAlbumButton addTarget:self action:@selector(onPickAlbumClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pickAlbumButton];
    
    UIButton *pickCameraButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 450, 120, 20)];
    [pickCameraButton setTitle:@"pick camera" forState:UIControlStateNormal];
    [pickCameraButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [pickCameraButton addTarget:self action:@selector(onPickCameraClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pickCameraButton];
    
    UIButton *pickCameraVideoButton = [[UIButton alloc] initWithFrame:CGRectMake(140, 450, 120, 20)];
    [pickCameraVideoButton setTitle:@"pick video" forState:UIControlStateNormal];
    [pickCameraVideoButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [pickCameraVideoButton addTarget:self action:@selector(onPickCameraVideoClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pickCameraVideoButton];
    
    NSArray* mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    for (NSString* type in mediaTypes) {
       NSLog(@"media types:%@",type);
    }
}

- (UIImageView *)pickerImageView {
    if (!_pickerImageView) {
        _pickerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 300, 300)];
        _pickerImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        _pickerImageView.layer.backgroundColor = [UIColor blackColor].CGColor;
    }
    return _pickerImageView;
}

- (void)onPickPhotoClick:(UIButton *)sender {
    UIImagePickerController *vc = [[UIImagePickerController alloc] init];
    vc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    vc.allowsEditing = YES;
    vc.delegate = self;
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)onPickAlbumClick:(UIButton *)sender {
    UIImagePickerController *vc = [[UIImagePickerController alloc] init];
    vc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    vc.delegate = self;
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)onPickCameraClick:(UIButton *)sender {
    UIImagePickerController *vc = [[UIImagePickerController alloc] init];
    vc.sourceType = UIImagePickerControllerSourceTypeCamera;
    vc.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    vc.delegate = self;
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)onPickCameraVideoClick:(UIButton *)sender {
    UIImagePickerController *vc = [[UIImagePickerController alloc] init];
    vc.sourceType = UIImagePickerControllerSourceTypeCamera;
    vc.mediaTypes = @[@"public.movie"];
    vc.delegate = self;
    
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate -
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    NSLog(@"imagePickerController:didFinishPickingMediaWithInfo");

    UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    NSLog(@"mediaType: %@", mediaType);
    NSValue *cropRectValue = [info objectForKey:UIImagePickerControllerCropRect];
    NSLog(@"cropRect: %@", NSStringFromCGRect(cropRectValue.CGRectValue));
    NSURL *mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
    NSLog(@"mediaURL: %@", mediaURL);
    
    if ([@"public.image" isEqualToString:mediaType]) {
        if (editedImage) {
            self.pickerImageView.image = editedImage;
        } else {
            self.pickerImageView.image = originalImage;
        }
    } else if ([@"public.movie" isEqualToString:mediaType]) {

    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"imagePickerControllerDidCancel");
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
