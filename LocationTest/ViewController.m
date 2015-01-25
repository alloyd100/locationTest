//
//  ViewController.m
//  LocationTest
//
//  Created by Andrew Lloyd on 23/01/2015.
//  Copyright (c) 2015 Andrew Lloyd. All rights reserved.
//

#import "ViewController.h"
#import "LocationManager.h"
#import <Social/Social.h>
#import "FlagImageManager.h"

@interface ViewController ()

@property (strong, nonatomic) LocationManager *locationManager;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.loadingIndicator setHidden:YES];
    self.locationManager = [[LocationManager alloc] init];
    
    self.TwitterButton.enabled = NO;
}


- (IBAction)findMeTouchUpInside:(id)sender
{
    [self.loadingIndicator setHidden:NO];
    [self.loadingIndicator startAnimating];
    
    [self.locationManager currentUserLocation:^(BOOL success) {
        if (success)
        {
            [self updateView];
        }
        else
        {
            //failed - stop spinner
            [self.loadingIndicator stopAnimating];
            [self.loadingIndicator setHidden:YES];
        }
    }];
}

-(void)updateView
{
    [self.loadingIndicator stopAnimating];
    [self.loadingIndicator setHidden:YES];
    
    self.countryLabel.text = [self.locationManager stringForLocationCountry];
    self.flagImageView.image = [FlagImageManager flagImageForCountryISOCode:[self.locationManager stringForISOCode]];
    self.TwitterButton.enabled = YES;
}

#pragma mark - social sharing

- (IBAction)tweetThis:(id)sender
{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        if(![self.countryLabel.text isEqualToString:@"Country Finder"])
        {
            [tweetSheet addImage:[FlagImageManager flagImageForCountryISOCode:[self.locationManager stringForISOCode]]];
            [tweetSheet setInitialText:[NSString stringWithFormat:@"I am currently in %@", [self.locationManager stringForLocationCountry]]];
        }
        
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Whoops!" message:@"Please check your internet connection and that you have a twitter account set up" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alertView show];
    }
}




@end
