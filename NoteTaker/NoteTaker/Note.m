//
//  Note.m
//  NoteTaker
//
//  Created by Nathan Fraenkel on 10/7/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import "Note.h"

@implementation Note

@synthesize noteName, noteLocation, noteDate, noteBody;

-(id)initWithName:(NSString *)name location:(NSString *)location date:(NSDate *)date body:(NSString *)body{
    self = [super init];
    if (self){
        noteName = name;
        noteLocation = location;
        noteDate = date;
        noteBody = body;
        return self;
    }
    return nil;
}

@end
