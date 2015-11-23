//
//  AssViewController.h
//  OSA
//
//  Created by Robert Warren on 4/8/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assigned.h"


@interface AssViewController : UIViewController
{
    Assigned *currAss;
    
    NSMutableArray *breakdown;
}
@property (weak, nonatomic) IBOutlet UITableView *assList;

@property (strong, nonatomic) NSMutableArray *insertObject;

@end
