//
//  ViewController.m
//  locationDemo
//
//  Created by AlienJun on 14-9-21.
//  Copyright (c) 2014年 AlienJun. All rights reserved.
//

#import "ViewController.h"
#import "AJLocationManager.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[AJLocationManager shareLocation] getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
        NSLog(@"success:%f,%f",locationCorrrdinate.longitude,locationCorrrdinate.latitude);
    }];
    
    
    //
    [[AJLocationManager shareLocation] getAddress:^(NSString *addressString) {
        NSLog(@"%@",addressString);
        [_addressLabel setText:addressString];
    } error:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
