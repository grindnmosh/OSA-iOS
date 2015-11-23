//
//  timeManager.h
//  OSA
//
//  Created by Robert Warren on 4/8/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface timeManager : NSObject
{
    NSString *assignment;
    NSString *eventTitle;
    NSString *eventTime;
    NSNumber *daily;
    NSNumber *hourly;
}

+(timeManager*)unique;

@property(nonatomic, strong) NSString *assignment;
@property(nonatomic, strong) NSString *eventTitle;
@property(nonatomic, strong) NSString *eventTime;
@property(nonatomic) NSNumber *daily;
@property(nonatomic) NSNumber *hourly;

@end
