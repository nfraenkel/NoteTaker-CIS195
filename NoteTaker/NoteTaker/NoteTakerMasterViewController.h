//
//  NoteTakerMasterViewController.h
//  nothing
//
//  Created by Nathan Fraenkel on 10/6/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import <CoreLocation/CoreLocation.h>
#import "NotesModel.h"


@interface NoteTakerMasterViewController : UITableViewController <CLLocationManagerDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) CLLocationManager* locationManager;
@property (nonatomic, copy) NSMutableArray *notes;

@property (retain) NotesModel *model;


@end
