//
//  cncViewController.m
//  Command and Control iPad
//
//  Created by Steven Smith on 1/14/14.
//  Copyright (c) 2014 Whirling Penguins. All rights reserved.
//

#import "mapViewController.h"
#import "userCommuncation.h"
#import "otherCommunication.h"

@interface mapViewController ()

@end

@implementation mapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.showsUserLocation = YES;
    
    /*********************************************************************
     * What we are doing is letting the delegate property of mapView know *
     * that this class also is receiving updates. The reason we have      *
     * self.mapView. is because mapView is also a property of self.       *
     *********************************************************************/
    self.mapView.delegate = self;
    _zoomControlButton.title = @"Zoom Enabled";
    
    
}

-(void)communicationThread{
    
    userCommuncation *userOutbound = [[userCommuncation alloc]init];
    
    [userOutbound sendMyLatitudeToServer:self.mapView.userLocation.location.coordinate.latitude andMyLongitudeToServer:self.mapView.userLocation.location.coordinate.longitude andMyUsernameToServer:@" "];
    
}
/************************************************************************
 * This particular statement checks the sender (which is a               *
 * UISegmentedControl) and accesses the selectedSegmentIndex which is    *
 * an integer value. If it matches zero, we set the mapView.mapType to   *
 * standard. Likewise for 1 and 2 we set it to either satellite or       *
 * hybrid.                                                               *
 ************************************************************************/
- (IBAction)setMapType:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
        default:
            break;
    }
}

// http://www.devfright.com/mkmapview-and-mkmapview-delegate-tutorial/
- (IBAction)currentUserLocation:(UIBarButtonItem *)sender {
    
    NSLog(@"%@", self.mapView.userLocation.title); // "userLocation" does not show the dot, it only reports the current location.
    NSLog(@"%f", self.mapView.userLocation.location.coordinate.latitude);
    NSLog(@"%f", self.mapView.userLocation.location.coordinate.longitude);
    
    
    /*************************************************************************
     *The way we calculate span is that 1 degree is equal to 69 mile. If we   *
     * have a span of half a mile we can use this equation: (1/69)*0.5 which  *
     * equals 0.00725.                                                        *
     *************************************************************************/
    
    float spanX = 0.00725;
    float spanY = 0.00725;
    MKCoordinateRegion region; // defines the portion of the map to display
    region.center.latitude = self.mapView.userLocation.coordinate.latitude;
    region.center.longitude = self.mapView.userLocation.coordinate.longitude;
    
    // zooms in on the middle of the ocean how to change.
    
    //      the uncommented code below solves both those two lines in one line
    //region.span.latitudeDelta = spanX;
    //region.span.longitudeDelta = spanY;
    region.span = MKCoordinateSpanMake(spanX, spanY);
    
    
    [self.mapView setRegion:region animated:YES];
    // setCenterCoordinate:animated
    // setVisibleMapRect:animated
    
}


/******************************************
 *   To enable or disable zooming in map   *
 ******************************************/
- (IBAction)zoomControlButton:(UIBarButtonItem *)sender {

    if (self.mapView.zoomEnabled == NO)
    {
        self.mapView.zoomEnabled = YES;
        _zoomControlButton.title = @"Zoom Enabled";
    }
    else {
        self.mapView.zoomEnabled = NO;
        _zoomControlButton.title = @"Zoom Disabled";
    }
    
    // how to change its name to be disabled and to color red
}


/************************************************************************
 * What this is doing is revealing the search button each time the map   *
 * moves away from the current location. To get it working more smoothly *
 * you will need to add a bit more logic in to the method, but in a      *
 * clumsy way it shows one way of how the delegate method can be used.   *
 ************************************************************************/
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    
}


/***********************************************************************
 * We add the delegate method to the code and each time the user moves, *
 * the method is called. For this example, we will move to the new      *
 * location but without requiring the zoom… ie, we will use the         *
 * setCenterCoordinate:animated: method from the MKMapView.             *
 ***********************************************************************/
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    [self.mapView setCenterCoordinate:userLocation.coordinate animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
