//
//  NoteTakerDetailViewController.h
//  nothing
//
//  Created by Nathan Fraenkel on 10/6/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NoteTakerDetailViewControllerDelegate;

@class Note;

@interface NoteTakerDetailViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) id <NoteTakerDetailViewControllerDelegate> delegate;

@property (strong, nonatomic) id detailItem;

//@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) Note *note;
@property (weak, nonatomic) IBOutlet UILabel *noteTitle;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *noteBody;
- (IBAction)saveButtonPressed:(id)sender;

@end


@protocol NoteTakerDetailViewControllerDelegate <NSObject>
//- (void)NoteTakerDetailViewControllerDidCancel:(NoteTakerDetailViewController *)controller;
- (void)NoteTakerDetailViewControllerDidFinish:(NoteTakerDetailViewController *)controller name:(NSString *)name body:(NSString *)body;
@end
