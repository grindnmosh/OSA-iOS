//
//  Assigned.m
//  OSA
//
//  Created by Robert Warren on 4/7/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "Assigned.h"

@implementation Assigned
@synthesize assignmentsArray, assGroupArray, assigned, classSched, dated, detailed, assUrl, taught, eAddy, service, userName;



-(id)initWithAssignment:(NSString*)assignment theClass:(NSString *)theClass date:(NSString *)date details:(NSString*)details download:(NSString *)download teacher:(NSString *)teacher email:(NSString *)email chat:(NSString *)chat user:(NSString *)user;
{
    if ((self = [super init]))
    {
        
        assigned = assignment;
        classSched = theClass;
        dated = date;
        detailed = details;
        assUrl = download;
        taught = teacher;
        eAddy = email;
        service = chat;
        userName = user;
    }
    return self;
}

//database builder
static Assigned * _assDataArray = nil;
+(Assigned*) assDataArray
{
    if (!_assDataArray)
    {
        _assDataArray = [[self alloc] init];
    }
    return _assDataArray;
}

//database
-(id)init
{
    if ((self = [super init]))
    {
        assignmentsArray = [[NSMutableArray alloc] init];
        assGroupArray = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
