//
//  TimesViewController.m
//  OSA
//
//  Created by Robert Warren on 4/9/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "TimesViewController.h"
#import "TimeMan.h"
#import "TimeManCell.h"

@interface TimesViewController ()

@end

@implementation TimesViewController

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
    dayNumber = 1;
    //custom nib for my reusable cells
    UINib *ProjCellNib = [UINib nibWithNibName:@"TimeManCell" bundle:nil];
    if (ProjCellNib != nil)
    {
        [_timeList registerNib:ProjCellNib forCellReuseIdentifier:@"times"];
    }
    
    breakdown = [[NSMutableArray alloc] initWithObjects:
               nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self->_timeList.rowHeight = 40.f;
    self->_entitlment.text = [_insertObject assigned];
    
    cells = [_insertObject dayCount];
    for (int i =0; i < cells; i++)
    {
        //TimeMan *loader = _insertObject;
        
        [breakdown addObject:_insertObject];
        
        
    }
    
    

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self->_timeList.rowHeight = 80.f;
}

-(void)viewDidAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [breakdown count] ;
}

//create tags and insert data
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int days = [[breakdown objectAtIndex:0] dayCount];
    int hours = [[breakdown objectAtIndex:0] hourCount];
    TimeManCell *cell = [_timeList dequeueReusableCellWithIdentifier:@"times"];
    if (cell != nil)
    {
        
        cell.name = [NSString stringWithFormat:@"Day %d", dayNumber];
        cell.managed = [NSString stringWithFormat:@"%.02f", (float)hours/(float)days];
        [cell loadCell];
        dayNumber++;
        return cell;
        
    }
    return nil;
    
}

-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
