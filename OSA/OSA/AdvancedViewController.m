//
//  AdvancedViewController.m
//  OSA
//
//  Created by Robert Warren on 4/15/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "AdvancedViewController.h"
#import "TimeManCell.h"

@interface AdvancedViewController ()

@end

@implementation AdvancedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    timersCollection = [timeManager unique];
    expected = [TimeMan manDataArray];
    
    UINib *TimerCellNib = [UINib nibWithNibName:@"TimeManCell" bundle:nil];
    if (TimerCellNib != nil)
    {
        [_custTable registerNib:TimerCellNib forCellReuseIdentifier:@"times"];
    }
    
    //load saved date if available
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults != nil)
    {
        NSString *date = [[[NSUserDefaults standardUserDefaults] objectForKey:@"savedDate"] copy];
        events = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedEvent"] mutableCopy];
        dates = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedTimes"] mutableCopy];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterLongStyle];
        targetDate = [[NSDate alloc] init];
        targetDate = [dateFormatter dateFromString:date];
        
        for (int i = 0; i < [events count]; i++)
        {
            custEvents = [events objectAtIndex:i];
            custDate = [dates objectAtIndex:i];
            
            if (custEvents != nil)
            {
                TimeMan *load = [[TimeMan alloc] initWithCust:custEvents date:custDate];
                TimeMan *database = [TimeMan manDataArray];
                NSMutableArray *timeList = database.custTimerArray;
                if (timeList != nil)
                {
                    [timeList addObject:load];
                }
            }
        }
    
        if (targetDate != nil) {
            [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(updateCountdown) userInfo:nil repeats:NO];
            _datePicker.hidden = YES;
            _timeInstruct.hidden = YES;
            _saveButt.hidden = YES;
            _canButt.hidden =YES;
        }
        else
        {
            _gradBg.hidden = YES;
            _gradTime.hidden = YES;
            _timeEdit.hidden = YES;
            _canButt.hidden =YES;
        }
        
        if (custEvents != nil)
        {
            _custTable.hidden = NO;
            _remTimer.hidden = NO;
            _addTimer.hidden = NO;
            _custTimer.hidden=YES;
        }
        else
        {
            _custTable.hidden = YES;
            _remTimer.hidden = YES;
            _addTimer.hidden = YES;
            _custTimer.hidden=NO;
        }
    }
   
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self->_custTable.rowHeight = 80.f;
}

-(void)viewDidAppear:(BOOL)animated
{
    custEvents = timersCollection.eventTitle;
    custDate = timersCollection.eventTime;
    
    if (custEvents != nil)
    {
        TimeMan *loader = [[TimeMan alloc] initWithCust:custEvents date:custDate];
        TimeMan *database = [TimeMan manDataArray];
        if (database != nil)
        {
            //create profile info Loader
            ct = database.custTimerArray;
            if (ct != nil)
            {
                [ct addObject:loader];
            }
        }
        [_custTable reloadData];
        _custTable.hidden = NO;
        _remTimer.hidden = NO;
        _addTimer.hidden = NO;
        _custTimer.hidden=YES;
    }
    [_custTable reloadData];
    
    timersCollection.eventTitle = nil;
    timersCollection.eventTime = nil;
    
    if (expected.timeArray != nil) {
        NSUserDefaults *timeDefaults = [NSUserDefaults standardUserDefaults];
        if (timeDefaults != nil)
        {
            continuous1 =[[NSMutableArray alloc] initWithObjects: nil];
            continuous2 =[[NSMutableArray alloc] initWithObjects: nil];
            
            for (int i =0; i < [expected.custTimerArray count]; i++)
            {
                NSString *load1 = [[expected.custTimerArray objectAtIndex:i] custEvent];
                NSString *load2 = [[expected.custTimerArray objectAtIndex:i] eventDate];
                if (expected.custTimerArray != nil)
                {
                    [continuous1 addObject:load1];
                    [continuous2 addObject:load2];
                }
            }
            
            [[NSUserDefaults standardUserDefaults]setObject:continuous1 forKey:@"filedEvent"];
            [[NSUserDefaults standardUserDefaults]setObject:continuous2 forKey:@"filedTimes"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
    }
}

-(void)clearDeleted
{
    if (expected.timeArray != nil) {
        NSUserDefaults *timeDefaults = [NSUserDefaults standardUserDefaults];
        if (timeDefaults != nil)
        {
            continuous1 =[[NSMutableArray alloc] initWithObjects: nil];
            continuous2 =[[NSMutableArray alloc] initWithObjects: nil];
            
            for (int i =0; i < [expected.custTimerArray count]; i++)
            {
                NSString *load1 = [[expected.custTimerArray objectAtIndex:i] custEvent];
                NSString *load2 = [[expected.custTimerArray objectAtIndex:i] eventDate];
                if (expected.custTimerArray != nil)
                {
                    [continuous1 addObject:load1];
                    [continuous2 addObject:load2];
                }
            }
            
            [[NSUserDefaults standardUserDefaults]setObject:continuous1 forKey:@"filedEvent"];
            [[NSUserDefaults standardUserDefaults]setObject:continuous2 forKey:@"filedTimes"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateCountdown {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:now toDate:targetDate options:0];
    NSInteger days     = [dateComponents day];
    NSInteger months   = [dateComponents month];
    NSInteger years    = [dateComponents year];
   
    _gradTime.text = [NSString stringWithFormat:@"%ld Years, %ld Months and %ld Days left till...", (long)years, (long)months, (long)days];
    
    [self performSelector:@selector(updateCountdown) withObject:nil afterDelay:3649320];
}

-(void)refreshCell
{
    [_custTable reloadData];
}

+ (void)setDefaultTimeZone:(NSTimeZone *)aTimeZone
{
    [NSTimeZone localTimeZone];
}

-(IBAction)onChange:(id)sender
{
    //minimum date
    _datePicker.minimumDate = [[ NSDate alloc ] initWithTimeIntervalSinceNow: (NSTimeInterval) 0 ];
    
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [expected.custTimerArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TimeManCell *timerCell = [_custTable dequeueReusableCellWithIdentifier: @"times"];
    if (timerCell != nil)
    {
        custEvents = [[expected.custTimerArray objectAtIndex:indexPath.row] custEvent];
        custDate = [[expected.custTimerArray objectAtIndex:indexPath.row] eventDate];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterLongStyle];
        customDate = [[NSDate alloc] init];
        customDate = [dateFormatter dateFromString:custDate];
        
        NSDate *now = [NSDate date];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSUInteger unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
        NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:now toDate:customDate options:0];
        NSInteger secs     = [dateComponents second];
        NSInteger minutes   = [dateComponents minute];
        NSInteger hours   = [dateComponents hour];
        NSInteger days     = [dateComponents day];
        NSInteger months   = [dateComponents month];
        
        timerCell.name = custEvents;
        timerCell.managed = [NSString stringWithFormat:@"%02ld months, %02ld Days and %02ld:%02ld:%02ld", (long)months, (long)hours, (long)days, (long)minutes, (long)secs];
        [self performSelector:@selector(refreshCell) withObject:nil afterDelay:1];
        
        [timerCell loadCell];
        
        return timerCell;
    }
    
    return nil;
}



-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        
        [expected.custTimerArray removeObjectAtIndex:indexPath.section];
        [_custTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        if ([expected.custTimerArray count] == 0)
        {
            expected.custTimerArray = nil;
            _custTable.hidden = YES;
            _remTimer.hidden = YES;
            _addTimer.hidden = YES;
            _custTimer.hidden=NO;
        }
       
    }
}

-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        _gradBg.hidden = YES;
        _gradTime.hidden = YES;
        _timeEdit.hidden = YES;
        _datePicker.hidden = NO;
        _timeInstruct.hidden = NO;
        _saveButt.hidden = NO;
        _canButt.hidden =NO;
    }
    else if (button.tag == 1)
    {
        
        targetDate = _datePicker.date;
        [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(updateCountdown) userInfo:nil repeats:NO];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterLongStyle];
        _datePicker.hidden = YES;
        _timeInstruct.hidden = YES;
        _saveButt.hidden = YES;
        _canButt.hidden =YES;
        _gradBg.hidden = NO;
        _gradTime.hidden = NO;
        _timeEdit.hidden = NO;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if (defaults != nil)
        {
           NSString *string=[dateFormatter stringFromDate:targetDate];
            [[NSUserDefaults standardUserDefaults]setObject:string forKey:@"savedDate"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
    }
    else if (button.tag == 2)
    {
        _datePicker.hidden = YES;
        _timeInstruct.hidden = YES;
        _saveButt.hidden = YES;
        _canButt.hidden =YES;
        _gradBg.hidden = NO;
        _gradTime.hidden = NO;
        _timeEdit.hidden = NO;
    }
    else if (button.tag == 3)
    {
        
    }
    else if (button.tag == 4)
    {
        
        if (!_custTable.editing)
        {
            [_custTable setEditing:true animated:true];
            [button setTitle:@"Done Editing" forState:UIControlStateNormal];
            [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(refreshCell) object:NULL];
        }
        else
        {
            [_custTable setEditing:false animated:true];
            [button setTitle:@"Remove Timers" forState:UIControlStateNormal];
            [self performSelector:@selector(clearDeleted) withObject:nil afterDelay:1];
            [self performSelector:@selector(refreshCell) withObject:nil afterDelay:1];
        }
    }
}



@end
