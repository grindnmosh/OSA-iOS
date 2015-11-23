//
//  ProfilerViewController.m
//  OSA
//
//  Created by Robert Warren on 4/5/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "ProfilerViewController.h"

@interface ProfilerViewController ()

@end

@implementation ProfilerViewController

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
    updateProfile = [profileManager aboutMe];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    if (updateProfile.studName != nil)
    {
        _proImg.image = updateProfile.itemImage;
        _name.text = updateProfile.studName;
        _stud.text = updateProfile.studId;
        _school.text = updateProfile.schoolName;
        _con1.text = updateProfile.con1;
        _con2.text = updateProfile.con2;
        _con3.text = updateProfile.con3;
        _con4.text = updateProfile.con4;
        _con5.text = updateProfile.con5;
        _ph1.text = updateProfile.ph1;
        _ph2.text = updateProfile.ph2;
        _ph3.text = updateProfile.ph3;
        _ph4.text = updateProfile.ph4;
        _ph5.text = updateProfile.ph5;
        
    }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
   
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
    if (self.view.frame.origin.y < 0 ) {
        [self setViewMovedUp:NO];
    }
}

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [_proImg setImage:image];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else if (button.tag == 1)
    {
        if ([_name.text  isEqual: @""])
        {
            //missing info alert
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information!" message:@"Please Enter your Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        else
        {
            updateProfile.itemImage = _proImg.image;
            updateProfile.studName = _name.text;
            updateProfile.studId = _stud.text;
            updateProfile.schoolName = _school.text;
            updateProfile.con1 = _con1.text;
            updateProfile.con2 = _con2.text;
            updateProfile.con3 = _con3.text;
            updateProfile.con4 = _con4.text;
            updateProfile.con5 = _con5.text;
            updateProfile.ph1 = _ph1.text;
            updateProfile.ph2 = _ph2.text;
            updateProfile.ph3 = _ph3.text;
            updateProfile.ph4 = _ph4.text;
            updateProfile.ph5 = _ph5.text;
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        
    }
    else if (button.tag == 2)
    {
        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        
        [self presentViewController:picker animated:YES completion:NULL];
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
