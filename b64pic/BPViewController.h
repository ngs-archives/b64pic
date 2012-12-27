//
//  BPViewController.h
//  b64pic
//
//  Created by Atsushi Nagase on 12/27/12.
//  Copyright (c) 2012 LittleApps Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BPViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction)openPicker:(id)sender;

@end
