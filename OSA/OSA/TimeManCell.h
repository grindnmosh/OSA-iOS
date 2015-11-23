//
//  TimeManCell.h
//  OSA
//
//  Created by Robert Warren on 4/6/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeManCell : UITableViewCell
{
    IBOutlet UILabel *assignment;
    IBOutlet UILabel *timespent;
}
-(void)loadCell;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *managed;




@end
