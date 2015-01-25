//
//  ViewController.h
//  LocationTest
//
//  Created by Andrew Lloyd on 23/01/2015.
//  Copyright (c) 2015 Andrew Lloyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationManager.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UIButton *TwitterButton;
@property (strong, nonatomic) LocationManager *locationManager;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;

- (IBAction)findMeTouchUpInside:(id)sender;
- (IBAction)tweetThis:(id)sender;

-(void)updateView;

@end

