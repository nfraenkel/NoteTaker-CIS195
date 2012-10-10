//
//  NotesModel.m
//  NoteTaker
//
//  Created by Nathan Fraenkel on 10/9/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import "NotesModel.h"

@implementation NotesModel

@synthesize notes;

static NotesModel *sharedDataModel = nil;

+ (NotesModel *) sharedDataModel {
    @synchronized(self){
        if (sharedDataModel == nil){
            sharedDataModel = [[NotesModel alloc] init];
        }
    }
    return sharedDataModel;
}

@end
