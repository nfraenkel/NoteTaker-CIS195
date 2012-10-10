//
//  NoteTakerFirstViewController.m
//  NoteTaker
//
//  Created by Nathan Fraenkel on 10/6/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import "NoteTakerFirstViewController.h"

@interface NoteTakerFirstViewController ()

@end

@implementation NoteTakerFirstViewController

@synthesize map, model;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Map";
    self.tabBarItem.image = [UIImage imageNamed:@"07-map-marker"];
    
    model = [NotesModel sharedDataModel];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated {
    [self populateMap];
    
    for (Note *n in model.notes){
        NSLog(@"<%f, %f>", n.location.coordinate.latitude, n.location.coordinate.longitude);
    }
}

-(void)populateMap {
    // Adding annotations
    for (int i = 0; i < model.notes.count; i++){
        Note *n = [model.notes objectAtIndex:i];
        [self.map setCenterCoordinate:n.location.coordinate];
        MKPointAnnotation* annot = [[MKPointAnnotation alloc] init];
        [annot setCoordinate:n.location.coordinate];
        [annot setTitle:n.title];
        [self.map addAnnotation:annot];
    }
    
}

-(void)viewDidDisappear:(BOOL)animated {
    [self clearMap];
}

-(void)clearMap {
    for (MKPointAnnotation *a in self.map.annotations){
        [self.map removeAnnotation:a];
    }
}

@end
