//
//  profileManager.m
//  OSA
//
//  Created by Robert Warren on 4/8/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "profileManager.h"

@implementation profileManager
{
    profileManager *managment;
}

@synthesize itemImage, studName, studId, schoolName, con1, con2, con3, con4, con5, con6, con7, ph1,ph2, ph3, ph4, ph5, ph6, ph7;

+(profileManager*)aboutMe;
{
    static profileManager *singleton = nil;
    @synchronized(self)
    {
        if (!singleton)
        {
            singleton = [[profileManager alloc] init];
        }
        return singleton;
    }
    
}

@end
