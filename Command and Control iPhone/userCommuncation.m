//
//  cncLocactionModel.m
//  Command and Control iPhone
//
//  Created by Steven Smith on 1/20/14.
//  Copyright (c) 2014 Whirling Penguins. All rights reserved.
//

#import "userCommuncation.h"
#import "mapViewController.h"

@implementation userCommuncation

- (void)sendMyLatitudeToServer:(float)latitude andMyLongitudeToServer:(float)longitude andMyUsernameToServer:(NSString *)username{
    _userLatitude = latitude;
    _userLongitude = longitude;
    _username = username;
}

@end
