//
//  TimeManViewController.m
//  OSA
//
//  Created by Robert Warren on 4/5/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "TimeManViewController.h"

@interface TimeManViewController ()

@end

@implementation TimeManViewController

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
    singesTime = [timeManager unique];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#define kMin 150

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeField = textField;
    //move the main view, so that the keyboard does not hide it.
    if (self.view.frame.origin.y + activeField.frame.origin. y >= kMin) {
        [self setViewMovedUp:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    activeField = nil;
    if (self.view.frame.origin.y < 0 ) {
        [self setViewMovedUp:NO];
    }
}



//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y = kMin - activeField.frame.origin.y ;
    }
    else
    {
        // revert back to the normal state.
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else if (button.tag == 1)
    {
        NSString *c1 = [_days text];
        NSString *c2 = [_hours text];
        if ([_projName.text isEqual:@""] || [c1 isEqualToString:@""] || [c2 isEqualToString:@""])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information!" message:@"Please Enter Product Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else
        {
            NSNumber *day = @([c1 intValue]);
            NSNumber *hour = @([c2 intValue]);
            singesTime.assignment = _projName.text;
            singesTime.daily = day;
            singesTime.hourly = hour;
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
