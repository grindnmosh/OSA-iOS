//
//  TimeMan.m
//  OSA
//
//  Created by Robert Warren on 4/7/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "TimeMan.h"

@implementation TimeMan
@synthesize timeArray, assigned, dayCount, hourCount, custEvent, eventDate;

-(id)initWithTime:(NSString*)assigment day:(int)day hours:(int)hours
{
    if ((self = [super init]))
    {
        assigned = assigment;
        dayCount = day;
        hourCount = hours;
    }
    return self;
}

-(id)initWithCust:(NSString*)event date:(NSString *)date
{
    if ((self = [super init]))
    {
        custEvent = event;
        eventDate = date;
        
    }
    return self;
}

//database builder
static TimeMan *_manDataArray = nil;
+(TimeMan*) manDataArray
{
    if (!_manDataArray)
    {
        _manDataArray = [[self alloc] init];
    }
    return _manDataArray;
}

//database
-(id)init
{
    if ((self = [super init]))
    {
        timeArray = [[NSMutableArray alloc] init];
        _custTimerArray = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
