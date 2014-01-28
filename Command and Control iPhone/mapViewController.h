//
//  cncViewController.h
//  Command and Control iPad
//
//  Created by Steven Smith on 1/14/14.
//  Copyright (c) 2014 Whirling Penguins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface mapViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *zoomControlButton;

//http://www.techotopia.com/index.php/Basic_iOS_7_Animation_using_Core_Animation
@end
