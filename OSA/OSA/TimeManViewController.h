//
//  TimeManViewController.h
//  OSA
//
//  Created by Robert Warren on 4/5/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "timeManager.h"

@interface TimeManViewController : UIViewController <UITextFieldDelegate>
{
    timeManager *singesTime;
    UITextField *activeField;
}

@property (weak, nonatomic) IBOutlet UITextField *projName;
@property (weak, nonatomic) IBOutlet UITextField *days;
@property (weak, nonatomic) IBOutlet UITextField *hours;

@end
