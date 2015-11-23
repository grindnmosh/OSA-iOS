//
//  ProjCell.h
//  OSA
//
//  Created by Robert Warren on 4/6/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjCell : UITableViewCell
{
    IBOutlet UILabel *projNameCell;
    IBOutlet UILabel *projDateCell;
    IBOutlet UILabel *projClassCell;
}

-(void)loadCell;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *classes;

@end
