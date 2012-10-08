//
//  NoteTakerDetailViewController.h
//  nothing
//
//  Created by Nathan Fraenkel on 10/6/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Note;

@interface NoteTakerDetailViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) Note *note;
@property (strong, nonatomic) NSMutableArray *masterDataArray;
@property (weak, nonatomic) IBOutlet UILabel *noteTitle;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *noteBody;

- (void)setOurNote:(Note *)newNote withMasterDataArray:(NSMutableArray *)data andIndex:(int)newIndex;

@end
