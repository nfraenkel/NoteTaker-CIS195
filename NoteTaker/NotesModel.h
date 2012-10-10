//
//  NotesModel.h
//  NoteTaker
//
//  Created by Nathan Fraenkel on 10/9/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotesModel : NSObject {
    NSMutableArray *notes;
}
@property (nonatomic, copy) NSMutableArray *notes;

+ (NotesModel *) sharedDataModel;

@end
