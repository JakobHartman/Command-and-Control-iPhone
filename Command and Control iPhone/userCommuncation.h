//
//  cncLocactionModel.h
//  Command and Control iPhone
//
//  Created by Steven Smith on 1/20/14.
//  Copyright (c) 2014 Whirling Penguins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userCommuncation : NSObject
@property (readwrite) float userLatitude;
@property (readwrite) float userLongitude;
@property (readwrite) NSString *userJSON;
@property (readwrite) NSString *username;

- (void)sendMyLatitudeToServer:(float)latitude andMyLongitudeToServer:(float)longitude andMyUsernameToServer:(NSString *)username;

@end
