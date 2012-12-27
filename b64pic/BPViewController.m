//
//  BPViewController.m
//  b64pic
//
//  Created by Atsushi Nagase on 12/27/12.
//  Copyright (c) 2012 LittleApps Inc. All rights reserved.
//

#import "BPViewController.h"
#import "UIImage+shrinking.h"
#import "NSData+Base64.h"

@interface BPViewController ()

@end

@implementation BPViewController

- (IBAction)openPicker:(id)sender {
  [[[UIActionSheet alloc]
    initWithTitle:@"Openinig Picker" delegate:self
    cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil
    otherButtonTitles:@"Camera", @"Photo Library", nil] showInView:self.view];;
}

- (void)pickPhotoWithSourceType:(UIImagePickerControllerSourceType)sourceType {
  if([UIImagePickerController availableMediaTypesForSourceType:sourceType]) {
    UIImagePickerController *vc = [[UIImagePickerController alloc] init];
    [vc setDelegate:self];
    [vc setAllowsEditing:YES];
    [vc setSourceType:sourceType];
    [self presentViewController:vc animated:YES completion:NULL];
  } else {
    [[[UIAlertView alloc]
      initWithTitle:@"Unsupported source type"
      message:nil delegate:nil cancelButtonTitle:@"OK"
      otherButtonTitles:nil] show];
  }
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
  switch (buttonIndex) {
    case 0:
      [self pickPhotoWithSourceType:UIImagePickerControllerSourceTypeCamera];
      break;
    case 1:
      [self pickPhotoWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
      break;
  }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  UIImage *img = info[UIImagePickerControllerEditedImage];
  UIImage *imgs = [img imageByShrinkingWithSize:CGSizeMake(500, 500)];
  NSData *data = UIImageJPEGRepresentation(imgs, 0.7);
  [self.textView setText:[NSString stringWithFormat:@"data:image/jpeg;base64,%@", data.base64EncodedString]];
  [picker dismissViewControllerAnimated:YES completion:NULL];
}


@end
