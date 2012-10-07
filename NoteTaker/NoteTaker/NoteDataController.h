//
//  NoteDataController.h
//  NoteTaker
//
//  Created by Nathan Fraenkel on 10/7/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Note;

@interface NoteDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterNoteList;

- (NSUInteger)countOfList;
- (Note *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addNoteWithTitle:(NSString *)newTitle location:(NSString *)inputLocation body:(NSString *)body;

@end
