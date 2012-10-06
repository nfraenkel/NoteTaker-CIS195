//
//  NoteTakerDetailViewController.m
//  nothing
//
//  Created by Nathan Fraenkel on 10/6/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import "NoteTakerDetailViewController.h"

@interface NoteTakerDetailViewController ()
- (void)configureView;
@end

@implementation NoteTakerDetailViewController

@synthesize noteTitle, dateLabel, locationLabel, noteBody;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.dateLabel) {
        self.dateLabel.text = [self.detailItem description];
    }
    if (self.noteTitle){
        self.noteTitle.text = [self.detailItem description];
    }
    
    UITapGestureRecognizer *titleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [titleTap setNumberOfTapsRequired:1];
    [noteTitle setUserInteractionEnabled:YES];
    [noteTitle addGestureRecognizer:titleTap];
    
}

- (void)handleTap:(UIGestureRecognizer *)gestureRecognizer{
    
    // hide label
    [noteTitle setHidden:YES];
    
    // create editable text field
    UITextField *titleTextField = [[UITextField alloc] initWithFrame:noteTitle.frame];
    [self.view addSubview:titleTextField];
    [titleTextField setTextAlignment:UITextAlignmentCenter];
    [titleTextField setFont:noteTitle.font];
    [titleTextField setText:noteTitle.text];
    [titleTextField setDelegate:self];
    [titleTextField becomeFirstResponder];
    [titleTextField setReturnKeyType:UIReturnKeyDone];
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string isEqualToString:@"\n"]){
        [noteTitle setHidden:NO];
        [noteTitle setText:textField.text];
        [textField removeFromSuperview];
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
