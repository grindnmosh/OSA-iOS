//
//  SecondViewController.h
//  OSA
//
//  Created by Robert Warren on 4/5/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeManCell.h"
#import "TimeMan.h"
#import "timeManager.h"

@interface SecondViewController : UIViewController
{
    TimeMan *expected;
    TimeMan *currTime;
    timeManager *singesTime;
    
    NSMutableArray *timeObj;
    NSMutableArray *timer;
    NSMutableArray *continuous1;
    NSMutableArray *continuous2;
    NSMutableArray *continuous3;
    NSMutableArray *namedProj;
    NSMutableArray *daysNDays;
    NSMutableArray *hoursNHours;

   
    
    NSString *proj;
    
    int dayCount;
    int hourValue;
    int dayNumber;
    int cells;
}
@property (weak, nonatomic) IBOutlet UITableView *mainList;
@property (weak, nonatomic) IBOutlet UILabel *entitlment;


@end
