//
//  ThirdViewController.m
//  OSA
//
//  Created by Robert Warren on 4/5/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

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
    currentProfile = [profileManager aboutMe];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (defaults != nil);
    {
        storeImage = [[NSUserDefaults standardUserDefaults] objectForKey:@"filedImage"];
        storeStud = [[NSUserDefaults standardUserDefaults] objectForKey:@"filedStud"];
        storeId = [[NSUserDefaults standardUserDefaults] objectForKey:@"filedId"];
        storeSchool = [[NSUserDefaults standardUserDefaults] objectForKey:@"filedSchool"];
        storeCon1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"con1"];
        storeCon2 = [[NSUserDefaults standardUserDefaults] objectForKey:@"con2"];
        storeCon3 = [[NSUserDefaults standardUserDefaults] objectForKey:@"con3"];
        storeCon4 = [[NSUserDefaults standardUserDefaults] objectForKey:@"con4"];
        storeCon5 = [[NSUserDefaults standardUserDefaults] objectForKey:@"con5"];
        storePh1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"ph1"];
        storePh2 = [[NSUserDefaults standardUserDefaults] objectForKey:@"ph2"];
        storePh3 = [[NSUserDefaults standardUserDefaults] objectForKey:@"ph3"];
        storePh4 = [[NSUserDefaults standardUserDefaults] objectForKey:@"ph4"];
        storePh5 = [[NSUserDefaults standardUserDefaults] objectForKey:@"ph5"];
        
        _proImg.image = [UIImage imageWithContentsOfFile:storeImage];
        _nameField.text = storeStud;
        _studIdField.text = storeId;
        _schoolNameField.text = storeSchool;
        _con1.text = storeCon1;
        _con2.text = storeCon2;
        _con3.text = storeCon3;
        _con4.text = storeCon4;
        _con5.text = storeCon5;
        _ph1.text = storePh1;
        _ph2.text = storePh2;
        _ph3.text = storePh3;
        _ph4.text = storePh4;
        _ph5.text = storePh5;
        
    }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    if (currentProfile.studName != nil)
    {
        _proImg.image = currentProfile.itemImage;
        _nameField.text = currentProfile.studName;
        _studIdField.text = currentProfile.studId;
        _schoolNameField.text = currentProfile.schoolName;
        _con1.text = currentProfile.con1;
        _con2.text = currentProfile.con2;
        _con3.text = currentProfile.con3;
        _con4.text = currentProfile.con4;
        _con5.text = currentProfile.con5;
        _ph1.text = currentProfile.ph1;
        _ph2.text = currentProfile.ph2;
        _ph3.text = currentProfile.ph3;
        _ph4.text = currentProfile.ph4;
        _ph5.text = currentProfile.ph5;
    }
    
    if (currentProfile.studName != nil)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if (defaults != nil)
        {
            UIImage *image = currentProfile.itemImage;
            NSData *imageData = UIImagePNGRepresentation(image);
            NSString *imageName = [NSString stringWithFormat:@"/proImage.png"];
            NSString *load1 = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:imageName];
                [imageData writeToFile:load1 atomically:YES];
            NSString *load2 = currentProfile.studName;
            NSString *load3 = currentProfile.studId;
            NSString *load4 = currentProfile.schoolName;
            NSString *load5 = currentProfile.con1;
            NSString *load6 = currentProfile.con2;
            NSString *load7 = currentProfile.con3;
            NSString *load8 = currentProfile.con4;
            NSString *load9 = currentProfile.con5;
            NSString *load12 = currentProfile.ph1;
            NSString *load13 = currentProfile.ph2;
            NSString *load14 = currentProfile.ph3;
            NSString *load15 = currentProfile.ph4;
            NSString *load16 = currentProfile.ph5;
            
            
            
            [[NSUserDefaults standardUserDefaults]setObject:load1 forKey:@"filedImage"];
            [[NSUserDefaults standardUserDefaults]setObject:load2 forKey:@"filedStud"];
            [[NSUserDefaults standardUserDefaults]setObject:load3 forKey:@"filedId"];
            [[NSUserDefaults standardUserDefaults]setObject:load4 forKey:@"filedSchool"];
            [[NSUserDefaults standardUserDefaults]setObject:load5 forKey:@"con1"];
            [[NSUserDefaults standardUserDefaults]setObject:load6 forKey:@"con2"];
            [[NSUserDefaults standardUserDefaults]setObject:load7 forKey:@"con3"];
            [[NSUserDefaults standardUserDefaults]setObject:load8 forKey:@"con4"];
            [[NSUserDefaults standardUserDefaults]setObject:load9 forKey:@"con5"];
            [[NSUserDefaults standardUserDefaults]setObject:load12 forKey:@"ph1"];
            [[NSUserDefaults standardUserDefaults]setObject:load13 forKey:@"ph2"];
            [[NSUserDefaults standardUserDefaults]setObject:load14 forKey:@"ph3"];
            [[NSUserDefaults standardUserDefaults]setObject:load15 forKey:@"ph4"];
            [[NSUserDefaults standardUserDefaults]setObject:load16 forKey:@"ph5"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        currentProfile.itemImage = _proImg.image;
        currentProfile.studName = _nameField.text;
        currentProfile.studId = _studIdField.text;
        currentProfile.schoolName = _schoolNameField.text;
        currentProfile.con1 = _con1.text;
        currentProfile.con2 = _con2.text;
        currentProfile.con3 = _con3.text;
        currentProfile.con4 = _con4.text;
        currentProfile.con5 = _con5.text;
        currentProfile.ph1 = _ph1.text;
        currentProfile.ph2 = _ph2.text;
        currentProfile.ph3 = _ph3.text;
        currentProfile.ph4 = _ph4.text;
        currentProfile.ph5 = _ph5.text;
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
