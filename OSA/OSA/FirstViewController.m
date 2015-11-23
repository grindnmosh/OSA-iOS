//
//  FirstViewController.m
//  OSA
//
//  Created by Robert Warren on 4/6/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "FirstViewController.h"
#import "ProjCell.h"
#import "AssViewController.h"



@interface FirstViewController ()

@end

@implementation FirstViewController

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
    assignmentList = [Assigned assDataArray];
    classList = [AllClass classDatArray];
    singlesDay = [singleProj singleOBJ];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (defaults != nil);
    {
        assArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedAss"] mutableCopy];
        clArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedClass"] mutableCopy];
        datArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedDate"] mutableCopy];
        detArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedInfo"] mutableCopy];
        dlArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedUrl"] mutableCopy];
        teaArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedTeacher"] mutableCopy];
        emArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedEmail"] mutableCopy];
        chArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedService"] mutableCopy];
        usArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedUsers"] mutableCopy];
        
        for (int i = 0; i < [assArray count]; i++)
        {
            ass = [assArray objectAtIndex:i];
            cl = [clArray objectAtIndex:i];
            dat = [datArray objectAtIndex:i];
            det = [detArray objectAtIndex:i];
            dl = [dlArray objectAtIndex:i];
            tea = [teaArray objectAtIndex:i];
            em = [emArray objectAtIndex:i];
            ch = [chArray objectAtIndex:i];
            us = [usArray objectAtIndex:i];
            
            if (ass != nil)
            {
                Assigned *load = [[Assigned alloc] initWithAssignment:ass theClass:cl date:dat details:det download:dl teacher:tea email:em chat:ch user:us];
                Assigned *database = [Assigned assDataArray];
                assList = database.assignmentsArray;
                if (assList != nil)
                {
                    [assList addObject:load];
                }
            }
        }
    }
     [_projList reloadData];

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self->_projList.rowHeight = 20.f;
}

-(void)viewDidAppear:(BOOL)animated
{
    
    ass = singlesDay.assignIt;
    cl = singlesDay.schooled;
    dat = singlesDay.dateMe;
    det = singlesDay.detailing;
    dl = singlesDay.webbie;
    tea = singlesDay.instruct;
    em = singlesDay.mailer;
    ch = singlesDay.chatting;
    us = singlesDay.chatter;
    
    classList.assGroupArray = nil;
    loaded = [[NSMutableArray alloc] initWithObjects: nil];
    educate = [[NSMutableArray alloc] initWithObjects: nil];
    
    if (ass != nil)
    {
        assignmentList.assGroupArray = [[NSMutableArray alloc] initWithObjects: nil];
        Assigned *loader = [[Assigned alloc] initWithAssignment:ass theClass:cl date:dat details:det download:dl teacher:tea email:em chat:ch user:us];
        
        
        Assigned *database = [Assigned assDataArray];
        if (database != nil)
        {
            //create profile info Loader
            assList = database.assignmentsArray;
            if (assList != nil)
            {
                
                [assList addObject:loader];
            }
        }
        
    }
    
    
    
    
    if (assignmentList.assignmentsArray != nil)
    {
        for (int i =0; i < [assignmentList.assignmentsArray count]; i++)
        {
            NSString *classy = [[assignmentList.assignmentsArray objectAtIndex:i] classSched];
            AllClass *database = [AllClass classDatArray];
            if (database != nil)
            {
                //create profile info Loader
                trueClass = database.classesArray;
                if (trueClass != nil)
                {
                    if ([trueClass containsObject:classy])
                    {}
                    else
                    {
                        [trueClass addObject:classy];
                        
                    }
                }
            }
        }
    }
                            
    
    classless = [[NSMutableArray alloc] initWithObjects: nil];
    
 
    for (int i =0; i < [classList.classesArray count]; i++)
    {
            if (![educate containsObject:classless])
            {
                
                for (int a = 0; a < [assignmentList.assignmentsArray count]; a++)
                {
                    
                    Assigned *assignments = [assignmentList.assignmentsArray objectAtIndex:a];
                    NSString *currClass = [assignments classSched];
                    NSString *classic = [NSString stringWithFormat:@"%@", [classList.classesArray objectAtIndex:i]];
                    if ([currClass isEqualToString:classic])
                    {
                        [classless  addObject: assignments];
                    }
                }
                [educate addObject:classless];
                classless = [[NSMutableArray alloc] initWithObjects: nil];
            }
        
        
        
    }
    Assigned *database = [Assigned assDataArray];
    educated = database.assGroupArray;
    [educated addObject:educate];
    
    [_projList reloadData];
    
    singlesDay.assignIt = nil;
    singlesDay.schooled = nil;
    singlesDay.dateMe = nil;
    singlesDay.detailing = nil;
    singlesDay.webbie = nil;
    singlesDay.instruct = nil;
    singlesDay.mailer = nil;
    singlesDay.chatting = nil;
    singlesDay.chatter = nil;
    

    if (classList.classesArray != nil) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if (defaults != nil)
        {
            int im = 0;
            continuous1 =[[NSMutableArray alloc] init];
            continuous2 =[[NSMutableArray alloc] init];
            continuous3 =[[NSMutableArray alloc] init];
            continuous4 =[[NSMutableArray alloc] init];
            continuous5 =[[NSMutableArray alloc] init];
            continuous6 =[[NSMutableArray alloc] init];
            continuous7 =[[NSMutableArray alloc] init];
            continuous8 =[[NSMutableArray alloc] init];
            continuous9 =[[NSMutableArray alloc] init];
            
            
            for (int i =0; i < [assignmentList.assignmentsArray count]; i++)
            {
               
                    NSString *load1 = [[assignmentList.assignmentsArray objectAtIndex:i] assigned];
                    NSString *load2 = [[assignmentList.assignmentsArray objectAtIndex:i] classSched];
                    NSString *load3 = [[assignmentList.assignmentsArray objectAtIndex:i] dated];
                    NSString *load4 = [[assignmentList.assignmentsArray objectAtIndex:i] detailed];
                    NSString *load5 = [[assignmentList.assignmentsArray objectAtIndex:i] assUrl];
                    NSString *load6 = [[assignmentList.assignmentsArray objectAtIndex:i] taught];
                    NSString *load7 = [[assignmentList.assignmentsArray objectAtIndex:i]eAddy];
                    NSString *load8 = [[assignmentList.assignmentsArray objectAtIndex:i]service];
                    NSString *load9 = [[assignmentList.assignmentsArray objectAtIndex:i] userName];
                    im++;
                    if (assignmentList.assignmentsArray != nil)
                    {
                        [continuous1 addObject:load1];
                        [continuous2 addObject:load2];
                        [continuous3 addObject:load3];
                        [continuous4 addObject:load4];
                        [continuous5 addObject:load5];
                        [continuous6 addObject:load6];
                        [continuous7 addObject:load7];
                        [continuous8 addObject:load8];
                        [continuous9 addObject:load9];
                    }
                }
                
                [[NSUserDefaults standardUserDefaults]setObject:continuous1 forKey:@"filedAss"];
                [[NSUserDefaults standardUserDefaults]setObject:continuous2 forKey:@"filedClass"];
                [[NSUserDefaults standardUserDefaults]setObject:continuous3 forKey:@"filedDate"];
                [[NSUserDefaults standardUserDefaults]setObject:continuous4 forKey:@"filedInfo"];
                [[NSUserDefaults standardUserDefaults]setObject:continuous5 forKey:@"filedUrl"];
                [[NSUserDefaults standardUserDefaults]setObject:continuous6 forKey:@"filedTeacher"];
                [[NSUserDefaults standardUserDefaults]setObject:continuous7 forKey:@"filedEmail"];
                [[NSUserDefaults standardUserDefaults]setObject:continuous8 forKey:@"filedService"];
                [[NSUserDefaults standardUserDefaults]setObject:continuous9 forKey:@"filedUsers"];
                [[NSUserDefaults standardUserDefaults] synchronize];

                }
        
        
    }
    [_projList reloadData];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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




- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [classList.classesArray count];
}

-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [classList.classesArray removeObjectAtIndex:indexPath.section];
        [assignmentList.assignmentsArray removeObjectAtIndex:indexPath.section];
        [_projList deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        if ([assignmentList.assignmentsArray count] == 0)
        {
            assignmentList.assignmentsArray = nil;
        }
        [self.view setNeedsDisplay];
    }
}

//create tags and insert data
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Test";
    UITableViewCell *classCell = [_projList dequeueReusableCellWithIdentifier: cellId];
    if (classCell == nil)
    {
        classCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        classCell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    classCell.textLabel.text = [classList.classesArray objectAtIndex:indexPath.row];
    //return label
    return classCell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ass"])
    {
        AssViewController *destination = segue.destinationViewController;
        destination.insertObject = currAss;
         NSLog(@"%@", [destination.insertObject description]);
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [assignmentList assGroupArray];
    NSMutableArray *passed = [assignmentList.assGroupArray objectAtIndex:0];
    currAss = [passed objectAtIndex:indexPath.row];
    NSLog(@"%@", [currAss description]);
    [self performSegueWithIdentifier: @"ass" sender: self];
}

-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 1)
    {
        if (!_projList.editing)
        {
            [_projList setEditing:true animated:true];
            [button setTitle:@"Done Editing" forState:UIControlStateNormal];
        }
        else
        {
            [_projList setEditing:false animated:true];
            [button setTitle:@"Remove Items" forState:UIControlStateNormal];
        }
    }

}

@end
