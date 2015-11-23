//
//  TimesViewController.h
//  OSA
//
//  Created by Robert Warren on 4/9/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeMan.h"

@interface TimesViewController : UIViewController
{
    TimeMan *expected;
    
    NSMutableArray *timer;
    NSMutableArray *breakdown;
    
    int dayNumber;
    int cells;
}
@property (weak, nonatomic) IBOutlet UITableView *timeList;
@property (weak, nonatomic) IBOutlet UILabel *entitlment;


@property (strong, nonatomic) TimeMan *insertObject;
@end
