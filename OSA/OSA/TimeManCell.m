//
//  TimeManCell.m
//  OSA
//
//  Created by Robert Warren on 4/6/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "TimeManCell.h"

@implementation TimeManCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)loadCell
{
    //assign outlets with info
    assignment.text = _name;
    timespent.text = _managed;
}

@end
