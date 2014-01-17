//
//  ViewController.m
//  GPSManager
//
//  Created by SDT-1 on 2014. 1. 17..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "TMapView.h"
#define APP_KEY @"436686fb-a4ea-3149-b8b1-7b1af6226827"
#define TOOLBAR_HIGHT 64

@interface ViewController () <TMapGpsManagerDelegate>
@property (strong, nonatomic) TMapGpsManager *gpsManager;
@property (strong, nonatomic) TMapView *mapView;
@end

@implementation ViewController
#pragma mark GPS Manager's Delegate
-(void)locationChanged:(TMapPoint *)newTmp{
    NSLog(@"Location Changed : %@", newTmp);
    [self.mapView setCenterPoint:newTmp];
}
-(void)headingChanged:(double)heading{
    
}
- (IBAction)switchGPS:(id)sender {
    UISwitch *_switch = (UISwitch *)sender;
    
    if(_switch.on == YES)
        [self.gpsManager openGps];
    else
        [self.gpsManager closeGps];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGRect rect= CGRectMake(0, TOOLBAR_HIGHT, self.view.frame.size.width, self.view.frame.size.height - TOOLBAR_HIGHT);
    
    self.mapView = [[TMapView alloc]initWithFrame:rect];
    [self.mapView setSKPMapApiKey:APP_KEY];
    [self.view addSubview:self.mapView];
    
    self.gpsManager = [[TMapGpsManager alloc]init];
    [self.gpsManager setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
