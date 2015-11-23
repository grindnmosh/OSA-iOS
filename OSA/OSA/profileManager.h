//
//  profileManager.h
//  OSA
//
//  Created by Robert Warren on 4/8/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface profileManager : NSObject
{
    UIImage *itemImage;
    NSString *studName;
    NSString *studId;
    NSString *schoolName;
    NSString *con1;
    NSString *con2;
    NSString *con3;
    NSString *con4;
    NSString *con5;
    NSString *con6;
    NSString *con7;
    NSString *ph1;
    NSString *ph2;
    NSString *ph3;
    NSString *ph4;
    NSString *ph5;
    NSString *ph6;
    NSString *ph7;
}

+(profileManager*)aboutMe;


@property(nonatomic)UIImage *itemImage;
@property (strong, nonatomic) NSString *studName;
@property (strong, nonatomic) NSString *studId;
@property (strong, nonatomic) NSString *schoolName;
@property (strong, nonatomic) NSString *con1;
@property (strong, nonatomic) NSString *con2;
@property (strong, nonatomic) NSString *con3;
@property (strong, nonatomic) NSString *con4;
@property (strong, nonatomic) NSString *con5;
@property (strong, nonatomic) NSString *con6;
@property (strong, nonatomic) NSString *con7;
@property (strong, nonatomic) NSString *ph1;
@property (strong, nonatomic) NSString *ph2;
@property (strong, nonatomic) NSString *ph3;
@property (strong, nonatomic) NSString *ph4;
@property (strong, nonatomic) NSString *ph5;
@property (strong, nonatomic) NSString *ph6;
@property (strong, nonatomic) NSString *ph7;

@end
