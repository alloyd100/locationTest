//
//  ViewController.m
//  LocationTest
//
//  Created by Andrew Lloyd on 23/01/2015.
//  Copyright (c) 2015 Andrew Lloyd. All rights reserved.
//

#import "ViewController.h"
#import "LocationManager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;

@property (weak, nonatomic) LocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)findMeTouchUpInside:(id)sender
{
    [self.locationManager startUpdatingLocation];
    [
}

@end
