//
//  SecondViewController.m
//  OSA
//
//  Created by Robert Warren on 4/5/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "SecondViewController.h"
#import "TimeMan.h"
#import "TimeManCell.h"
#import "TimesViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    expected = [TimeMan manDataArray];
    singesTime = [timeManager unique];
    //custom nib for my reusable cells
    
     NSUserDefaults *timeDefaults = [NSUserDefaults standardUserDefaults];
    
    if (timeDefaults != nil);
    {
        namedProj = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedName"] mutableCopy];
        daysNDays = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedDays"] mutableCopy];
        hoursNHours = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedHours"] mutableCopy];
        
        
        for (int i = 0; i < [namedProj count]; i++)
        {
            proj = [namedProj objectAtIndex:i];
            NSNumber *count1 = [daysNDays objectAtIndex:i];
            NSNumber *count2 = [hoursNHours objectAtIndex:i];
            dayCount = [count1 intValue];
            hourValue = [count2 intValue];
                
            if (proj != nil)
            {
                TimeMan *load = [[TimeMan alloc] initWithTime:proj day:dayCount hours:hourValue];
                TimeMan *database = [TimeMan manDataArray];
                timer = database.timeArray;
                if (timer != nil)
                {
                    [timer addObject:load];
                }
                expected = [TimeMan manDataArray];
                
            }
        }
        [_mainList reloadData];
    }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self->_mainList.rowHeight = 30.f;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    proj = singesTime.assignment;
    dayCount = [singesTime.daily intValue];
    hourValue = [singesTime.hourly intValue];
    
    if (proj != nil)
    {
        TimeMan *loader = [[TimeMan alloc] initWithTime:proj day:dayCount hours:hourValue];
        TimeMan *database = [TimeMan manDataArray];
        if (database != nil)
        {
            //create profile info Loader
            timer = database.timeArray;
            if (timer != nil)
            {
                [timer addObject:loader];
            }
        }
        [_mainList reloadData];
    }
    
    singesTime.assignment = nil;
    singesTime.daily = 0;
    singesTime.hourly = 0;
    
    if (expected.timeArray != nil) {
        NSUserDefaults *timeDefaults = [NSUserDefaults standardUserDefaults];
        if (timeDefaults != nil)
        {
            int im = 0;
            continuous1 =[[NSMutableArray alloc] initWithObjects: nil];
            continuous2 =[[NSMutableArray alloc] init];
            continuous3 =[[NSMutableArray alloc] initWithObjects: nil];
           
            for (int i =0; i < [expected.timeArray count]; i++)
            {
                NSString *load1 = [[expected.timeArray objectAtIndex:i] assigned];
                int dayNum = [[expected.timeArray objectAtIndex:i] dayCount];
                int hourNum = [[expected.timeArray objectAtIndex:i] hourCount];
                NSNumber *load2 = @(dayNum);
                NSNumber *load3 = @(hourNum);
                im++;
                if (expected.timeArray != nil)
                {
                    [continuous1 addObject:load1];
                    [continuous2 addObject:load2];
                    [continuous3 addObject:load3];
                }
            }
            
            [[NSUserDefaults standardUserDefaults]setObject:continuous1 forKey:@"filedName"];
            [[NSUserDefaults standardUserDefaults]setObject:continuous2 forKey:@"filedDays"];
            [[NSUserDefaults standardUserDefaults]setObject:continuous3 forKey:@"filedHours"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [expected.timeArray count];
}

-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [expected.timeArray removeObjectAtIndex:indexPath.row];
        [_mainList deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

//create tags and insert data
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Test";
    UITableViewCell *classCell = [_mainList dequeueReusableCellWithIdentifier: cellId];
    if (classCell == nil)
    {
        classCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        classCell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    //add image to label
    
    classCell.textLabel.text = [[expected.timeArray objectAtIndex:indexPath.row] assigned];
    //return label
    return classCell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"time"])
    {
        TimesViewController *destination = segue.destinationViewController;
        destination.insertObject = currTime;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    currTime = [expected.timeArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier: @"time" sender: self];
}

-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 1)
    {
        //closindexpath.row
        if (!_mainList.editing)
        {
            [_mainList setEditing:true animated:true];
            [button setTitle:@"Done Editing" forState:UIControlStateNormal];
        }
        else
        {
            [_mainList setEditing:false animated:true];
            [button setTitle:@"Remove Timers" forState:UIControlStateNormal];
        }
    }
    else if (button.tag == 2)
    {
        expected.timeArray = nil;
        [_mainList reloadData];
    }
        
}

@end
