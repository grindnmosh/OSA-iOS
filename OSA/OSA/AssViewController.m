//
//  AssViewController.m
//  OSA
//
//  Created by Robert Warren on 4/8/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "AssViewController.h"
#import "ProjCell.h"
#import "ProjDetViewController.h"
#import "assigned.h"

@interface AssViewController ()

@end

@implementation AssViewController

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
    UINib *ProjCellNib = [UINib nibWithNibName:@"ProjCell" bundle:nil];
    if (ProjCellNib != nil)
    {
        [_assList registerNib:ProjCellNib forCellReuseIdentifier:@"projects"];
    }
    
    
    
    [super viewDidLoad];
    self->_assList.rowHeight = 80.f;
    // Do any additional setup after loading the view.
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
    NSLog(@"%lu", (unsigned long)[_insertObject count]);
    return [_insertObject count];
}

//create tags and insert data
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProjCell *cell = [_assList dequeueReusableCellWithIdentifier:@"projects"];
    if (cell != nil)
    {
        cell.name = [[_insertObject objectAtIndex:indexPath.row] assigned];
        cell.date = [[_insertObject objectAtIndex:indexPath.row] dated];
        cell.classes = [[_insertObject objectAtIndex:indexPath.row] classSched];
        [cell loadCell];
        
        return cell;
    }
    return nil;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detail"])
    {
        ProjDetViewController *destination = segue.destinationViewController;
        destination.insertObject2 = currAss;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    currAss = [_insertObject objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier: @"detail" sender: self];
}

-(IBAction)onClick:(UIButton*)button
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
