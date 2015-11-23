//
//  singleProj.h
//  OSA
//
//  Created by Robert Warren on 4/8/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface singleProj : NSObject
{
    NSString *assignIt;
    NSString *schooled;
    NSString *dateMe;
    NSString *detailing;
    NSString *webbie;
    NSString *instruct;
    NSString *mailer;
    NSString *chatting;
    NSString *chatter;
}

+(singleProj *) singleOBJ;

@property(nonatomic, strong) NSString *assignIt;
@property(nonatomic, strong) NSString *schooled;
@property(nonatomic, strong) NSString *dateMe;
@property(nonatomic, strong) NSString *detailing;
@property(nonatomic, strong) NSString *webbie;
@property(nonatomic, strong) NSString *instruct;
@property(nonatomic, strong) NSString *mailer;
@property(nonatomic, strong) NSString *chatting;
@property(nonatomic, strong) NSString *chatter;

@end
