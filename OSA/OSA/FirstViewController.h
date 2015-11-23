//
//  FirstViewController.h
//  OSA
//
//  Created by Robert Warren on 4/6/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjCell.h"
#import "Assigned.h"
#import "AllClass.h"
#import "singleProj.h"

@interface FirstViewController : UIViewController
{
    Assigned *assignmentList;
    AllClass *classList;
    singleProj *singlesDay;
    
    NSMutableArray *currAss;
    NSMutableArray *projObj;
    NSMutableArray *assList;
    NSMutableArray *classTime;
    NSMutableArray *assedOut;
    NSMutableArray *trueClass;
    NSMutableArray *loaded;
    NSMutableArray *educate;
    NSMutableArray *educated;
    NSMutableArray *continuous1;
    NSMutableArray *continuous2;
    NSMutableArray *continuous3;
    NSMutableArray *continuous4;
    NSMutableArray *continuous5;
    NSMutableArray *continuous6;
    NSMutableArray *continuous7;
    NSMutableArray *continuous8;
    NSMutableArray *continuous9;
    NSMutableArray *assArray;
    NSMutableArray *clArray;
    NSMutableArray *datArray;
    NSMutableArray *detArray;
    NSMutableArray *dlArray;
    NSMutableArray *teaArray;
    NSMutableArray *emArray;
    NSMutableArray *chArray;
    NSMutableArray *usArray;
    NSMutableArray *classless;
    
    NSString *ass;
    NSString *cl;
    NSString *dat;
    NSString *det;
    NSString *dl;
    NSString *tea;
    NSString *em;
    NSString *ch;
    NSString *us;
    
}
@property (weak, nonatomic) IBOutlet UITableView *projList;
@end
