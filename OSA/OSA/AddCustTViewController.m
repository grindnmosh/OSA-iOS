//
//  AddCustTViewController.m
//  OSA
//
//  Created by Robert Warren on 4/16/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "AddCustTViewController.h"

@interface AddCustTViewController ()

@end

@implementation AddCustTViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    timersCollection = [timeManager unique];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#define kMin 150

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeField = textField;
    
    if (self.view.frame.origin.y + activeField.frame.origin. y >= kMin) {
        [self setViewMovedUp:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    activeField = nil;
    if (self.view.frame.origin.y < 0 )
    {
        [self setViewMovedUp:NO];
    }
}


//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        rect.origin.y = kMin - activeField.frame.origin.y ;
    }
    else
    {
        rect.origin.y = 0;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

- (void)keyboardWillShow:(NSNotification *)notif
{
    
    if ([activeField isFirstResponder] && activeField.frame.origin.y + self.view.frame.origin.y >= kMin)
    {
        [self setViewMovedUp:YES];
    }
    else if (![activeField isFirstResponder] && activeField.frame.origin.y  + self.view.frame.origin.y < kMin)
    {
        [self setViewMovedUp:NO];
    }
}

- (void)keyboardWillHide:(NSNotification *)notif
{
    if (self.view.frame.origin.y < 0 ) {
        [self setViewMovedUp:NO];
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else if (button.tag == 1)
    {
        
        NSDate *passingDate = _datePicker.date;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterLongStyle];
        NSString *string = [dateFormatter stringFromDate:passingDate];
        timersCollection.eventTitle = _eventName.text;
        timersCollection.eventTime = string;
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
