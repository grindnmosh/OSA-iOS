//
//  ProjDetViewController.m
//  OSA
//
//  Created by Robert Warren on 4/5/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "ProjDetViewController.h"

@interface ProjDetViewController ()

@end

@implementation ProjDetViewController

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
    name = [NSString stringWithFormat:@"%@", [_insertObject2 assigned]];
    sched = [NSString stringWithFormat:@"%@", [_insertObject2 classSched]];
    date = [NSString stringWithFormat:@"%@", [_insertObject2 dated]];
    detail = [NSString stringWithFormat:@"%@", [_insertObject2 detailed]];
    url = [NSString stringWithFormat:@"%@", [_insertObject2 assUrl]];
    teacher = [NSString stringWithFormat:@"%@", [_insertObject2 taught]];
    mail = [NSString stringWithFormat:@"%@", [_insertObject2 eAddy]];
    chatMe = [NSString stringWithFormat:@"%@", [_insertObject2 service]];
    user = [NSString stringWithFormat:@"%@", [_insertObject2 userName]];
    
    
    self->_ProjName.text = name;
    self->_ClassName.text = sched;
    self->_dated.text = date;
    self->_projDetails.text = detail;
    self->_urlLabel.text = url;
    self->_teacherName.text = teacher;
    self->_teacherEmail.text = mail;
    self->_chatType.text = chatMe;
    self->_chatName.text = user;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(UIButton*)button
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
