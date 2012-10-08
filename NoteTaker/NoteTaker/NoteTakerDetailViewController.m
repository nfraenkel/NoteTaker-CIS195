//
//  NoteTakerDetailViewController.m
//  nothing
//
//  Created by Nathan Fraenkel on 10/6/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import "NoteTakerDetailViewController.h"
#import "Note.h"

@interface NoteTakerDetailViewController ()
- (void)configureView;
@end

@implementation NoteTakerDetailViewController

@synthesize note, masterDataArray;
@synthesize noteTitle, dateLabel, locationLabel, noteBody;

int masterDataIndex = 0;

- (void)setOurNote:(Note *)newNote withMasterDataArray:(NSMutableArray *)data andIndex:(int)newIndex{
    
    self.masterDataArray = data;
    masterDataIndex = newIndex;
    
    if (self.note != newNote){
        self.note = newNote;
 
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    

    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterFullStyle];
    }
    if (self.dateLabel) {
        self.dateLabel.text = [formatter stringFromDate:note.date];
//        self.dateLabel.text = [formatter stringFromDate:_detailItem];
    }
    if (self.noteTitle){
//        self.noteTitle.text = @"No title";
        self.noteTitle.text = [self.note title];
    }
    if (self.noteBody){
        self.noteBody.text = self.note.body;
    }
    if (self.locationLabel ){
        self.locationLabel.text = self.note.location;
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
        self.note.title = noteTitle.text;
        [masterDataArray replaceObjectAtIndex:masterDataIndex withObject:self.note];
        [textField removeFromSuperview];
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
