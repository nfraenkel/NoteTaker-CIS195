//
//  Note.h
//  NoteTaker
//
//  Created by Nathan Fraenkel on 10/7/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

@property (nonatomic, copy) NSString *noteName;
@property (nonatomic, copy) NSString *noteLocation;
@property (nonatomic, strong) NSDate *noteDate;
@property (nonatomic, copy) NSString *noteBody;

-(id)initWithName:(NSString *)name location:(NSString *)location date:(NSDate *)date body:(NSString *)body;

@end
