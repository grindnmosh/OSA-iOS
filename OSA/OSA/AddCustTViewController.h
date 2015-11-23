//
//  AddCustTViewController.h
//  OSA
//
//  Created by Robert Warren on 4/16/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "timeManager.h"

@interface AddCustTViewController : UIViewController <UITextFieldDelegate>
{
    timeManager *timersCollection;
    
    UITextField *activeField;
}

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *eventName;


@end
