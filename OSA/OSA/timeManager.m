//
//  timeManager.m
//  OSA
//
//  Created by Robert Warren on 4/8/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "timeManager.h"

@implementation timeManager
{
    timeManager *managment;
}

@synthesize assignment, daily, hourly, eventTitle, eventTime;

+(timeManager*)unique;
{
    static timeManager *singleton = nil;
    @synchronized(self)
    {
        if (!singleton)
        {
            singleton = [[timeManager alloc] init];
        }
        return singleton;
    }
    
}

@end
