//
//  cncLocationBrain.m
//  Command and Control iPhone
//
//  Created by Steven Smith on 1/20/14.
//  Copyright (c) 2014 Whirling Penguins. All rights reserved.
//

#import "cncLocationBrain.h"
#import "cncViewController.h"

@implementation cncLocationBrain

float userLat = self.mapView.userLocation.coordinate.latitude;
float userLong = self.mapView.userLocation.coordinate.longitude;

@end
