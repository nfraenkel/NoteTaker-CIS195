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
BOOL editingNoteBody = NO;

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
    }
    if (self.noteTitle){
        self.noteTitle.text = [self.note title];
    }
    if (self.noteBody){
        self.noteBody.text = self.note.body;
    }
    if (self.locationLabel ){
        self.locationLabel.text = self.note.location;
    }
    
    // setup tap gesture recognizer for title label
    UITapGestureRecognizer *titleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTitleTap:)];
    [titleTap setNumberOfTapsRequired:1];
    [noteTitle setUserInteractionEnabled:YES];
    [noteTitle addGestureRecognizer:titleTap];
    
    [noteBody setDelegate:self];
    
        
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (touch.view != noteBody && editingNoteBody) {
        NSLog(@"YES!!!!!");
        [noteBody resignFirstResponder];
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"YES");
    editingNoteBody = YES;
}

-(void)textViewDidEndEditing:(UITextView *)textView {
    editingNoteBody = NO;
    NSLog(@"NO");
    // update current note with new body
    self.note.body = textView.text;
    // update master data array!
    [masterDataArray replaceObjectAtIndex:masterDataIndex withObject:self.note];
}


- (void)handleTitleTap:(UIGestureRecognizer *)gestureRecognizer{
    
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
        // update current note with new title
        self.note.title = noteTitle.text;
        // update master data array!
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
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
