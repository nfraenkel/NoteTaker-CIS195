//
//  Note.m
//  NoteTaker
//
//  Created by Nathan Fraenkel on 10/8/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import "Note.h"

@implementation Note

@synthesize title, location, date, body;

-(id)initWithName:(NSString *)newTitle location:(NSString *)newLocation date:(NSDate *)newDate body:(NSString *)newBody {
    
    self = [super init];
    if (self){
        self.title = newTitle;
        self.location = newLocation;
        self.date = newDate;
        self.body = newBody;
        return self;
    }
    return nil;
}

@end
