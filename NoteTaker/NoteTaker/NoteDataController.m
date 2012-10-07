//
//  NoteDataController.m
//  NoteTaker
//
//  Created by Nathan Fraenkel on 10/7/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import "NoteDataController.h"
#import "Note.h"

@implementation NoteDataController

@synthesize masterNoteList;


- (void)initializeDefaultDataList {
    NSMutableArray *noteList = [[NSMutableArray alloc] init];
    self.masterNoteList = noteList;
    [self addNoteWithTitle:@"New Note!" location:@"Everywhere" body:@"Create new note body"];
}

- (void)setMasterNoteList:(NSMutableArray *)masterNoteList:(NSMutableArray *)newList {
    if (self.masterNoteList != newList) {
        self.masterNoteList = [newList mutableCopy];
    }
}

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
    }
    return self;
}

- (NSUInteger)countOfList {
    return [self.masterNoteList count];
}

- (Note *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterNoteList objectAtIndex:theIndex];
}

- (void)addNoteWithTitle:(NSString *)newTitle location:(NSString *)inputLocation body:(NSString *)body{
    Note *note;
    NSDate *today = [NSDate date];
    
    note = [[Note alloc] initWithName:newTitle location:inputLocation date:today body:body];
    [self.masterNoteList addObject:note];
}



@end
