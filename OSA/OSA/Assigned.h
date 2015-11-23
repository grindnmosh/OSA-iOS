//
//  Assigned.h
//  OSA
//
//  Created by Robert Warren on 4/7/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Assigned : NSObject
{
    NSString *assigned;
    NSString *classSched;
    NSString *dated;
    NSString *detailed;
    NSString *assUrl;
    NSString *taught;
    NSString *eAddy;
    NSString *service;
    NSString *userName;
}

-(id)initWithAssignment:(NSString*)assignment theClass:(NSString *)theClass date:(NSString *)date details:(NSString*)details download:(NSString *)download teacher:(NSString *)teacher email:(NSString *)email chat:(NSString *)chat user:(NSString *)user;

+(Assigned*) assDataArray;

@property(nonatomic, strong) NSString *assigned;
@property(nonatomic, strong) NSString *classSched;
@property(nonatomic, strong) NSString *dated;
@property(nonatomic, strong) NSString *detailed;
@property(nonatomic, strong) NSString *assUrl;
@property(nonatomic, strong) NSString *taught;
@property(nonatomic, strong) NSString *eAddy;
@property(nonatomic, strong) NSString *service;
@property(nonatomic, strong) NSString *userName;

@property (nonatomic, strong) NSMutableArray *assignmentsArray;
@property (nonatomic, strong) NSMutableArray *assGroupArray;

@end
