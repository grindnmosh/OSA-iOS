//
//  AllClass.h
//  OSA
//
//  Created by Robert Warren on 4/9/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Assigned.h"

@interface AllClass : NSObject
{
    NSString *classSched;
    NSMutableArray *assGroup;
}
-(id)initWithClass:(NSString*)classTime;



+(AllClass*) classDatArray;

@property(nonatomic, strong) NSString *classSched;
@property (nonatomic, strong) NSMutableArray *assGroup;

@property (nonatomic, strong) NSMutableArray *classesArray;
@property (nonatomic, strong) NSMutableArray *assGroupArray;

@end
