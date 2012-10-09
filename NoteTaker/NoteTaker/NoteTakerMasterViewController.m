//
//  NoteTakerMasterViewController.m
//  nothing
//
//  Created by Nathan Fraenkel on 10/6/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import "NoteTakerMasterViewController.h"
#import "NoteTakerDetailViewController.h"
#import "Note.h"

@interface NoteTakerMasterViewController () {
//    NSMutableArray *_objects;
    NSMutableArray *notes;
}
@end

@implementation NoteTakerMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    NSLog(@"MASTER VIEWDIDLOAD");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    [self beginCollectionLocations];
}


-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)beginCollectionLocations {
    if (!self.locationManager) {
        self.locationManager = [[CLLocationManager alloc] init];
    }
    
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 500;
    
    [self.locationManager startUpdatingLocation];
}

// Delegate method from the CLLocationManagerDelegate protocol.
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    CLLocation* location = [locations lastObject];
    NSLog(@"latitude %+.6f, longitude %+.6f\n", location.coordinate.latitude, location.coordinate.longitude);
}

- (void)insertNewObject:(id)sender
{
    if (!notes){
        notes = [[NSMutableArray alloc] init];
    }
    CLLocation *location = self.locationManager.location;
    NSString *locationString = [NSString stringWithFormat:@"<%+.6f, %+.6f>", location.coordinate.latitude, location.coordinate.longitude]; 
    Note *newNote = [[Note alloc] initWithName:[NSString stringWithFormat:@"New Note %d", notes.count + 1] location:locationString date:[NSDate date] body:@"No Body Yet!!!"];
    [notes insertObject:newNote atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return notes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *title = [notes[indexPath.row] title];
    NSString *loc = [[notes[indexPath.row] date] description];
    cell.textLabel.text = title;
    cell.detailTextLabel.text = loc;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [notes removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Note *newNote = notes[indexPath.row];
                        
        [[segue destinationViewController] setOurNote:newNote withMasterDataArray:notes andIndex:indexPath.row];
    }
}

@end
