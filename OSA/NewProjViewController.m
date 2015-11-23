//
//  NewProjViewController.m
//  OSA
//
//  Created by Robert Warren on 4/5/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "NewProjViewController.h"

@interface NewProjViewController ()

@end

@implementation NewProjViewController

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
    assignmentList = [Assigned assDataArray];
    singlesDay = [singleProj singleOBJ];
    classList = [AllClass classDatArray];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    teachers = [[NSMutableArray alloc] initWithObjects: nil];
}

-(void)viewDidAppear:(BOOL)animated
{
    if (assignmentList.assignmentsArray != nil)
    {
        for (int i =0; i < [assignmentList.assignmentsArray count]; i++)
        {
            NSString *Instruct = [[assignmentList.assignmentsArray objectAtIndex:i] taught];
            if (teachers != nil)
            {
                if ([teachers containsObject:Instruct])
                {}
                else
                {
                    [teachers addObject:Instruct];
                    
                }
                
            }
        }
    }
   

}

#define kMin 150

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeField = textField;
    if (self.view.frame.origin.y + activeField.frame.origin. y >= kMin) {
        [self setViewMovedUp:YES];
    }
    if (activeField == _className)
    {
        autocompleteTableView = [[UITableView alloc] initWithFrame:
                                 CGRectMake(60, 140, 200, 120) style:UITableViewStylePlain];
    }
    else if (activeField == _teacher)
    {
        autocompleteTableView = [[UITableView alloc] initWithFrame:
                                 CGRectMake(60, 345, 200, 120) style:UITableViewStylePlain];
    }
    autocompleteTableView.delegate = self;
    autocompleteTableView.dataSource = self;
    autocompleteTableView.scrollEnabled = YES;
    autocompleteTableView.hidden = YES;
    [self.view addSubview:autocompleteTableView];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    activeField = nil;
    autocompleteTableView.hidden = YES;
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

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (((teachers != nil && [teachers count] != 0)) || ((classList.classesArray != nil) && ([classList.classesArray count] != 0)))
    {
        if ((activeField ==_teacher) || (activeField == _className))
        {
        
            autocompleteTableView.hidden = NO;
            
            NSString *substring = [NSString stringWithString:textField.text];
            substring = [substring
                         stringByReplacingCharactersInRange:range withString:string];
            [self searchAutocompleteEntriesWithSubstring:substring];
            return YES;
        }
        
    }
    return YES;
    
}

- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring{
    
    [autocompleteTeachers removeAllObjects];
    if (activeField == _teacher)
    {
        for(NSString *curString in teachers) {
            NSRange substringRange = [curString rangeOfString:substring];
            if (substringRange.location == 0) {
                [autocompleteTeachers addObject:curString];
            }
        }
    }
    else if (activeField ==_className)
    {
        for(NSString *curString in classList.classesArray) {
            NSRange substringRange = [curString rangeOfString:substring];
            if (substringRange.location == 0) {
                [autocompleteTeachers addObject:curString];
            }
        }
    }
    [autocompleteTableView reloadData];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    if (activeField == _teacher)
    {
         return [teachers count];;
    }
    else if (activeField == _className)
    {
        NSLog(@"%lu", (unsigned long)[classList.classesArray count]);
         return [classList.classesArray count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Test";
    UITableViewCell *classCell = [autocompleteTableView dequeueReusableCellWithIdentifier: cellId];
    if (classCell == nil)
    {
        classCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        classCell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    if (activeField == _teacher)
    {
        classCell.textLabel.text = [teachers objectAtIndex:indexPath.row];
    }
    else if (activeField == _className)
    {
        NSLog(@"%@", [classList.classesArray objectAtIndex:indexPath.row]);
        classCell.textLabel.text = [classList.classesArray objectAtIndex:indexPath.row];
    }
    //return label
    return classCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (activeField == _teacher)
    {
       self->_teacher.text = [teachers objectAtIndex:indexPath.row];
    }
    else if (activeField == _className)
    {
        self->_className.text = [classList.classesArray objectAtIndex:indexPath.row];
    }
   
    autocompleteTableView.hidden = YES;
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
        if ([_projName.text  isEqual: @""] || [_className.text  isEqual: @""] || [_due.text  isEqual: @""] || [_teacher.text  isEqual: @""])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information!" message:@"Please fill in all required fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else
        {
            singlesDay.assignIt = _projName.text;
            singlesDay.schooled = _className.text;
            singlesDay.dateMe = _due.text;
            singlesDay.detailing = _details.text;
            singlesDay.webbie = _link.text;
            singlesDay.instruct = _teacher.text;
            singlesDay.mailer = _email.text;
            singlesDay.chatting = _chatType.text;
            singlesDay.chatter = _chatName.text;
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }
       
        
        
    }
}

@end
