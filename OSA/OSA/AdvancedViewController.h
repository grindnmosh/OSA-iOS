//
//  AdvancedViewController.h
//  OSA
//
//  Created by Robert Warren on 4/15/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "timeManager.h"
#import "TimeMan.h"

@interface AdvancedViewController : UIViewController
{
    timeManager *timersCollection;
    TimeMan *expected;
    
    NSDate *targetDate;
    NSDate *customDate;
    NSTimer *timer;
    
    NSString *custEvents;
    NSString *custDate;
    
    NSMutableArray *ct;
    
    NSMutableArray *continuous1;
    NSMutableArray *continuous2;
    
    NSMutableArray *events;
    NSMutableArray *dates;
}
-(void)updateCountdown;

//default timezone
+(void)setDefaultTimeZone:(NSTimeZone *)aTimeZone;

//minimum date property
@property (nonatomic, retain) NSDate *minimumDate;


@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *gradTime;
@property (weak, nonatomic) IBOutlet UIImageView *gradBg;
@property (weak, nonatomic) IBOutlet UILabel *timeInstruct;
@property (weak, nonatomic) IBOutlet UIButton *timeEdit;
@property (weak, nonatomic) IBOutlet UIButton *saveButt;
@property (weak, nonatomic) IBOutlet UIButton *canButt;
@property (weak, nonatomic) IBOutlet UIButton *remTimer;
@property (weak, nonatomic) IBOutlet UIButton *addTimer;
@property (weak, nonatomic) IBOutlet UIButton *custTimer;
@property (weak, nonatomic) IBOutlet UITableView *custTable;
@end
