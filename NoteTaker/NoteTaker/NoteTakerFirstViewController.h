//
//  NoteTakerFirstViewController.h
//  NoteTaker
//
//  Created by Nathan Fraenkel on 10/6/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "NoteTakerMasterViewController.h"
#import "NotesModel.h"

@interface NoteTakerFirstViewController : UIViewController

// Reference to MKMapView
@property (weak, nonatomic) IBOutlet MKMapView *map;

@property (strong, nonatomic) NoteTakerMasterViewController *master;

@property (nonatomic, copy) NSMutableArray *notes;

@property (retain) NotesModel *model;


@end
