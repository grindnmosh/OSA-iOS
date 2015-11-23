//
//  TimeMan.h
//  OSA
//
//  Created by Robert Warren on 4/7/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeMan : NSObject
{
    NSString *assigned;
    NSString *custEvent;
    NSString *eventDate;
    
    int dayCount;
    int hourCount;
}

-(id)initWithTime:(NSString*)assigment day:(int)day hours:(int)hours;

-(id)initWithCust:(NSString*)event date:(NSString *)date;

+(TimeMan*) manDataArray;


@property(nonatomic, strong) NSString *assigned;
@property(nonatomic, strong) NSString *custEvent;
@property(nonatomic, strong) NSString *eventDate;
@property(nonatomic) int dayCount;
@property(nonatomic) int hourCount;

@property (nonatomic, strong) NSMutableArray *timeArray;
@property (nonatomic, strong) NSMutableArray *custTimerArray;

@end
