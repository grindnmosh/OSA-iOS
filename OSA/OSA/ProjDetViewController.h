//
//  ProjDetViewController.h
//  OSA
//
//  Created by Robert Warren on 4/5/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assigned.h"

@interface ProjDetViewController : UIViewController
{
    Assigned *currAss;
    
    NSString *name;
    NSString *sched;
    NSString *date;
    NSString *detail;
    NSString *url;
    NSString *teacher;
    NSString *mail;
    NSString *chatMe;
    NSString *user;
}
@property (weak, nonatomic) IBOutlet UILabel *ProjName;
@property (weak, nonatomic) IBOutlet UILabel *ClassName;
@property (weak, nonatomic) IBOutlet UILabel *dated;
@property (weak, nonatomic) IBOutlet UITextView *projDetails;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;
@property (weak, nonatomic) IBOutlet UILabel *teacherName;
@property (weak, nonatomic) IBOutlet UILabel *teacherEmail;
@property (weak, nonatomic) IBOutlet UILabel *chatType;
@property (weak, nonatomic) IBOutlet UILabel *chatName;


@property (strong, nonatomic) Assigned *insertObject2;

@end
