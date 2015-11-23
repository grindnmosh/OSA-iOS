//
//  ProfilerViewController.h
//  OSA
//
//  Created by Robert Warren on 4/5/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "profileManager.h"

@interface ProfilerViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    profileManager *updateProfile;
    UIImage *image;
    UITextField *activeField;
}
@property (weak, nonatomic) IBOutlet UIImageView *proImg;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *stud;
@property (weak, nonatomic) IBOutlet UITextField *con1;
@property (weak, nonatomic) IBOutlet UITextField *con2;
@property (weak, nonatomic) IBOutlet UITextField *con3;
@property (weak, nonatomic) IBOutlet UITextField *con4;
@property (weak, nonatomic) IBOutlet UITextField *con5;
@property (weak, nonatomic) IBOutlet UITextField *con6;
@property (weak, nonatomic) IBOutlet UITextField *con7;
@property (weak, nonatomic) IBOutlet UITextField *ph1;
@property (weak, nonatomic) IBOutlet UITextField *ph2;
@property (weak, nonatomic) IBOutlet UITextField *ph3;
@property (weak, nonatomic) IBOutlet UITextField *ph4;
@property (weak, nonatomic) IBOutlet UITextField *ph5;
@property (weak, nonatomic) IBOutlet UITextField *ph6;
@property (weak, nonatomic) IBOutlet UITextField *ph7;
@property (weak, nonatomic) IBOutlet UITextField *school;

@end
