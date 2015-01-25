## Location Test

An iOS application to determine which country you are currently situated in.


This application will help you find out which country you are situated in if you ever feel lost. 
It also allows you to tweet where you are at so your friends can know!


It makes use of a number of iOS frameworks including:

 * [UIKit](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIKit_Framework/)
 * [Social](https://developer.apple.com/library/prerelease/ios/documentation/Social/Reference/Social_Framework/index.html#//apple_ref/doc/uid/TP40012233) 
 * [MapKit](https://developer.apple.com/library/ios/documentation/MapKit/Reference/MapKit_Framework_Reference/)

The application is made up of a single view controller;

 * ViewController
 
And a couple of helper classes;

 * LocationManager
  * This class contains the LocationManager delegate methods and methods to generate the location using [CLGeocoder](https://developer.apple.com/library/prerelease/ios/documentation/CoreLocation/Reference/CLGeocoder_class/index.html).
 * FlagImageManager
  * This class helps me fetch the correct image using ISO-Country codes.
  
###Preset Twitter Message

Although editable by the user, the preset message can be changed here. 
 * line 73, ViewController.m

```java 
        if(![self.countryLabel.text isEqualToString:@"Country Finder"])
        {
            [tweetSheet addImage:[FlagImageManager flagImageForCountryISOCode:[self.locationManager stringForISOCode]]];
            [tweetSheet setInitialText:[NSString stringWithFormat:@"I am currently in %@", [self.locationManager stringForLocationCountry]]];
        }
```

###Help
* If sharing via Twitter is unavailble, check your internet connection and check in your iPhone settings that your twitter account is added succesfully.

* This application requires Location Services. If you have previously refused access to Location Services for this application, you will need to;
 * Go to the settings application on your iPhone
 * Scroll down to 'Location Test'
 * Select 'While Using The App' in the location Access settings



####Flag Images
All the flag icons for this applications were attained [here](http://www.famfamfam.com/lab/icons/flags/)



