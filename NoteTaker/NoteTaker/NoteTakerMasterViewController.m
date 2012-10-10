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

}
@end

@implementation NoteTakerMasterViewController

@synthesize locationManager, notes, model;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    model = [NotesModel sharedDataModel];
    
    
}


-(void)viewWillAppear:(BOOL)animated {
    [self beginCollectionLocations];
    
    self.model.notes = self.notes;
    
    [self.tableView reloadData];
    
}

-(void)viewWillDisappear:(BOOL)animated{
//    NSLog(@"viewwilldisappear");
}

-(void)viewDidDisappear:(BOOL)animated {
    
//    NSLog(@"viewdiddisappear");
    self.model.notes = self.notes;
    
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

}

// Delegate method from the CLLocationManagerDelegate protocol.
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    CLLocation* location = [locations lastObject];
    NSLog(@"latitude %+.6f, longitude %+.6f\n", location.coordinate.latitude, location.coordinate.longitude);
}

- (void)insertNewObject:(id)sender
{
    [self.locationManager startUpdatingLocation];
    
    
    if (!notes){
        notes = [[NSMutableArray alloc] init];
    }
    CLLocation *location = self.locationManager.location;
    Note *newNote = [[Note alloc] initWithName:[NSString stringWithFormat:@"New Note %d", notes.count + 1] location:location date:[NSDate date] body:@"No Body Yet!!!"];
    [notes insertObject:newNote atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.locationManager stopUpdatingLocation];

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
    NSLog(@"cell %@", indexPath);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *title = [notes[indexPath.row] title];
    NSString *date = [[notes[indexPath.row] date] description];
    cell.textLabel.text = title;
    cell.detailTextLabel.text = date;
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

-(void)NoteTakerDetailViewControllerDidFinish:(NoteTakerDetailViewController *)controller name:(NSString *)name body:(NSString *)body{
//
    NSLog(@"heereeee");
    
    for (int i = 0; i < _objects.count; i++){
        NSLog(@"object %d date: %@", i, _objects.description);
    }
    
//    if ([name length] || [body length]) {
//        [self.tabBarController add:name body:body];
//        [[self tableView] reloadData];
//    }
////    [self dismissModalViewControllerAnimated:YES];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Note *newNote = notes[indexPath.row];
                        
        [[segue destinationViewController] setOurNote:newNote withMasterDataArray:notes andIndex:indexPath.row];
    }
}

@end
