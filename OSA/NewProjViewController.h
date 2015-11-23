//
//  NewProjViewController.h
//  OSA
//
//  Created by Robert Warren on 4/5/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleProj.h"
#import "Assigned.h"
#import "AllClass.h"

@interface NewProjViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
{
    singleProj *singlesDay;
    Assigned *assignmentList;
    AllClass *classList;
    
    UITableView *autocompleteTableView;
    UITextField *activeField;
    
    NSMutableArray *autocompleteTeachers;
    NSMutableArray *teachers;
    NSMutableArray *classes;
    
    
    IBOutlet UIScrollView *scrollView;
}
@property (weak, nonatomic) IBOutlet UITextField *projName;
@property (weak, nonatomic) IBOutlet UITextField *className;
@property (weak, nonatomic) IBOutlet UITextField *due;
@property (weak, nonatomic) IBOutlet UITextView *details;
@property (weak, nonatomic) IBOutlet UITextField *link;
@property (weak, nonatomic) IBOutlet UITextField *teacher;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *chatType;
@property (weak, nonatomic) IBOutlet UITextField *chatName;

@end
