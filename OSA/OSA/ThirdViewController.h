//
//  ThirdViewController.h
//  OSA
//
//  Created by Robert Warren on 4/5/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "profileManager.h"

@interface ThirdViewController : UIViewController
{
    profileManager *currentProfile;
    
    
    UIImage *img;
    
    NSString *storeImage;
    NSString *storeStud;
    NSString *storeId;
    NSString *storeSchool;
    NSString *storeCon1;
    NSString *storeCon2;
    NSString *storeCon3;
    NSString *storeCon4;
    NSString *storeCon5;
    NSString *storePh1;
    NSString *storePh2;
    NSString *storePh3;
    NSString *storePh4;
    NSString *storePh5;
}

@property (weak, nonatomic) IBOutlet UIImageView *proImg;
@property (weak, nonatomic) IBOutlet UILabel *nameField;
@property (weak, nonatomic) IBOutlet UILabel *studIdField;
@property (weak, nonatomic) IBOutlet UILabel *schoolNameField;
@property (weak, nonatomic) IBOutlet UILabel *con1;
@property (weak, nonatomic) IBOutlet UILabel *con2;
@property (weak, nonatomic) IBOutlet UILabel *con3;
@property (weak, nonatomic) IBOutlet UILabel *con4;
@property (weak, nonatomic) IBOutlet UILabel *con5;
@property (weak, nonatomic) IBOutlet UILabel *ph1;
@property (weak, nonatomic) IBOutlet UILabel *ph2;
@property (weak, nonatomic) IBOutlet UILabel *ph3;
@property (weak, nonatomic) IBOutlet UILabel *ph4;
@property (weak, nonatomic) IBOutlet UILabel *ph5;

@end
