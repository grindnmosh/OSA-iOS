//
//  singleProj.m
//  OSA
//
//  Created by Robert Warren on 4/8/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "singleProj.h"

@implementation singleProj
{
    singleProj *goingStag;
}

@synthesize assignIt, schooled, dateMe, detailing, webbie, instruct, mailer, chatting, chatter;

//singleton static method
+(singleProj*)singleOBJ
{
    static singleProj *singleton = nil;
    @synchronized(self)
    {
        if (!singleton)
        {
            singleton = [[singleProj alloc] init];
        }
        return singleton;
    }
    
}
@end
