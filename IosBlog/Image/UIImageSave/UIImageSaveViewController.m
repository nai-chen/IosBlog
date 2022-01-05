//
//  UIImageSaveViewController.m
//  IosBlog
//
//  Created by PeterChen on 2021/8/19.
//

#import "UIImageSaveViewController.h"

#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>

@interface UIImageSaveViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property(nonatomic, assign) NSInteger type;

@end

@implementation UIImageSaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.type = 0;
    
    UIButton *savePhotoButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 120, 250, 20)];
    [savePhotoButton setTitle:@"save photo" forState:UIControlStateNormal];
    [savePhotoButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [savePhotoButton addTarget:self action:@selector(onSavePhotoClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:savePhotoButton];

    UIButton *saveAssetsLibraryPhotoButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 150, 250, 20)];
    [saveAssetsLibraryPhotoButton setTitle:@"save assets library photo" forState:UIControlStateNormal];
    [saveAssetsLibraryPhotoButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [saveAssetsLibraryPhotoButton addTarget:self action:@selector(onSaveAssetsLibraryPhotoClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveAssetsLibraryPhotoButton];
    
    
    UIButton *photoLibrarySavePhotoButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 180, 250, 20)];
    [photoLibrarySavePhotoButton setTitle:@"save photo library photo" forState:UIControlStateNormal];
    [photoLibrarySavePhotoButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [photoLibrarySavePhotoButton addTarget:self action:@selector(onSavePhotoLibraryPhotoClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:photoLibrarySavePhotoButton];
    

    UIButton *saveVideoButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 240, 250, 20)];
    [saveVideoButton setTitle:@"save video" forState:UIControlStateNormal];
    [saveVideoButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [saveVideoButton addTarget:self action:@selector(onSaveVideoClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveVideoButton];
    
    UIButton *saveAssetsLibraryVideoButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 270, 250, 20)];
    [saveAssetsLibraryVideoButton setTitle:@"save asset library video" forState:UIControlStateNormal];
    [saveAssetsLibraryVideoButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [saveAssetsLibraryVideoButton addTarget:self action:@selector(onSaveAssetsLibraryVideoClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveAssetsLibraryVideoButton];
    
    UIButton *savePhotoLibraryVideoButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 300, 250, 20)];
    [savePhotoLibraryVideoButton setTitle:@"save photo library video" forState:UIControlStateNormal];
    [savePhotoLibraryVideoButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [savePhotoLibraryVideoButton addTarget:self action:@selector(onSavePhotoLibraryVideoClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:savePhotoLibraryVideoButton];
}

- (void)onSavePhotoClick:(UIButton *)sender {
    UIImagePickerController *vc = [[UIImagePickerController alloc] init];
    vc.sourceType = UIImagePickerControllerSourceTypeCamera;
    vc.delegate = self;
    
    [self presentViewController:vc animated:YES completion:nil];
    
    self.type = 0;
}

- (void)onSaveAssetsLibraryPhotoClick:(UIButton *)sender {
    [self onSavePhotoClick:sender];
    self.type = 1;
}

- (void)onSavePhotoLibraryPhotoClick:(UIButton *)sender {
    [self onSavePhotoClick:sender];
    self.type = 2;
}

- (void)onSaveVideoClick:(UIButton *)sender {
    UIImagePickerController *vc = [[UIImagePickerController alloc] init];
    vc.sourceType = UIImagePickerControllerSourceTypeCamera;
    vc.mediaTypes = @[@"public.movie"];
    vc.delegate = self;
    
    [self presentViewController:vc animated:YES completion:nil];
    self.type = 0;
}

- (void)onSaveAssetsLibraryVideoClick:(UIButton *)sender {
    [self onSaveVideoClick:sender];
    self.type = 1;
}

- (void)onSavePhotoLibraryVideoClick:(UIButton *)sender {
    [self onSaveVideoClick:sender];
    self.type = 2;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([@"public.image" isEqualToString:mediaType]) {
        UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        if (self.type == 0) {
            [self saveImage:originalImage];
        } else if (self.type == 1) {
            [self saveAssetLibraryImage:originalImage];
        } else if (self.type == 2) {
            [self savePhotoLibraryImage:originalImage];
        }
    } else if ([@"public.movie" isEqualToString:mediaType]) {
        NSURL *mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
        if (self.type == 0) {
            [self saveVideo:mediaURL];
        } else if (self.type == 1) {
            [self saveAssetLibraryVideo:mediaURL];
        } else if (self.type == 2) {
            [self savePhotoLibraryVideo:mediaURL];
        }
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveImage:(UIImage *)image {
    UIImageWriteToSavedPhotosAlbum(image, self,
           @selector(UIImageWriteToSavedPhotosAlbum_image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)UIImageWriteToSavedPhotosAlbum_image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        NSLog(@"UIImageWriteToSavedPhotosAlbum_image %@", error);
    } else {
        NSLog(@"UIImageWriteToSavedPhotosAlbum_image success");
    }
}

- (void)saveAssetLibraryImage:(UIImage *)image {
    ALAssetsLibrary *lib = [[ALAssetsLibrary alloc] init];
    [lib writeImageToSavedPhotosAlbum:image.CGImage metadata:nil completionBlock:^(NSURL *assetURL, NSError *error) {
        if (error) {
            NSLog(@"saveAssetLibraryImage %@", error);
        } else {
            NSLog(@"saveAssetLibraryImage success");
        }
    }];
}

- (void)savePhotoLibraryImage:(UIImage *)image {
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
            [PHAssetChangeRequest creationRequestForAssetFromImage:image];
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            if (error) {
                NSLog(@"savePhotoLibraryImage %@", error);
            } else {
                NSLog(@"savePhotoLibraryImage success");
            }
        }];
}



- (void)saveVideo:(NSURL *)mediaURL {
    UISaveVideoAtPathToSavedPhotosAlbum([mediaURL path], self,
            @selector(UISaveVideoAtPathToSavedPhotosAlbum_videoPath:didFinishSavingWithError:contextInfo:), nil);
}

- (void)UISaveVideoAtPathToSavedPhotosAlbum_videoPath:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        NSLog(@"UISaveVideoAtPathToSavedPhotosAlbum_videoPath %@", error);
    } else {
        NSLog(@"UISaveVideoAtPathToSavedPhotosAlbum_videoPath success");
    }
}

- (void)saveAssetLibraryVideo:(NSURL *)mediaURL {
    ALAssetsLibrary *lib = [[ALAssetsLibrary alloc] init];
    [lib writeVideoAtPathToSavedPhotosAlbum:mediaURL completionBlock:^(NSURL *assetURL, NSError *error) {
        if (error) {
            NSLog(@"saveAssetLibraryVideo %@", error);
        } else {
            NSLog(@"saveAssetLibraryVideo success");
        }
    }];
}

- (void)savePhotoLibraryVideo:(NSURL *)mediaURL {
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
            [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:mediaURL];
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            if (error) {
                NSLog(@"savePhotoLibraryVideo %@", error);
            } else {
                NSLog(@"savePhotoLibraryVideo success");
            }
        }];
}

- (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)maxSize{
    NSData * data = UIImageJPEGRepresentation(image, 1.0);
    CGFloat dataKBytes = data.length;
    CGFloat maxQuality = 0.9f;
    while (dataKBytes > maxSize && maxQuality >= 0.1f) {
        maxQuality = maxQuality - 0.1f;
        data = UIImageJPEGRepresentation(image, maxQuality);
        dataKBytes = data.length;
    }
    return data;
}

@end
