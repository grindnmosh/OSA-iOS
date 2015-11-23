//
//  AllClass.m
//  OSA
//
//  Created by Robert Warren on 4/9/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "AllClass.h"

@implementation AllClass
@synthesize classesArray , assGroupArray, classSched, assGroup;


-(id)initWithClass:(NSMutableArray*)classTime
{
    if ((self = [super init]))
    {
        assGroup = classTime;
    }
    return self;
}

//database builder
static AllClass * _classDatArray = nil;
+(AllClass*) classDatArray
{
    if (!_classDatArray)
    {
        _classDatArray = [[self alloc] init];
    }
    return _classDatArray;
}

//database
-(id)init
{
    if ((self = [super init]))
    {
        classesArray = [[NSMutableArray alloc] init];
        assGroupArray = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
