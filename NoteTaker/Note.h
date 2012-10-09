//
//  Note.h
//  NoteTaker
//
//  Created by Nathan Fraenkel on 10/8/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Note : NSObject

@property (nonatomic, copy) NSString* title;
@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, copy) NSString* body;
@property (nonatomic, strong) NSDate* date;

-(id)initWithName:(NSString *)newTitle location:(CLLocation *)newLocation date:(NSDate *)newDate body:(NSString *)newBody;
@end
