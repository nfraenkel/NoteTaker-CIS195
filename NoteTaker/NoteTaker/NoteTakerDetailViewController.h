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

@property (strong, nonatomic) id detailItem;

//@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) Note *note;
@property (weak, nonatomic) IBOutlet UILabel *noteTitle;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *noteBody;

@end
