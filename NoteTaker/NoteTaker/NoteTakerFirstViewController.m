//
//  NoteTakerFirstViewController.m
//  NoteTaker
//
//  Created by Nathan Fraenkel on 10/6/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//


/**
 
 Requirements:
 2 tabs: One for adding/viewing notes (use master-detail pattern) and one for viewing a map with pins for where you've left your notes. See git.to/masterdetail for a walkthrough on how to make a bird-sighting app, which is a great starting point for learning about how to implement a master-detail app.
 Notes should have a name and/or description and a timestamp.
 You should be able to remove notes from the master view.
 Use relevant icons for the tabs. iOS has a bunch of them out of the box, but see http://www.glyphish.com/ if you want to pick from a wider collection.
 Pins should be annotated to distinguish between notes.
 Use CoreLocation framework for locating the user. (See git.to/locateme and git.to/corelocation)
 Use MapKit framework for displaying the map and pins.
 Be conscious of how and when you are fetching for location. You don't want to drain the user's battery unnecessarily. Briefly talk about your design decision in your README and why.
 Handle the edge-case of when the user has locations disabled gracefully. Do you allow them to leave a note? Make sure to briefly mention your design decision in your README and why.
 Be conscious of design decisions in general! Your app should be "intuitive" to use. (Testing your app out on a friend might help maybe.)
 Extra credit:
 (2 pts) Add a homescreen icon for your notes app. We won't mind if it's MS Paint level.
 (10 pts) Allow user to view the detailed view of the note by selecting it from the map.
 (10 pts) Allow user to leave voice memos as well. These should have a title and also be marked with a timestamp and displayed on the map. See the CoreAudio framework.
 (? pts) Come up with your own awesome feature!
 Testing tip: You can simulate locations on iOS Simulator by going to Debug > Location.
 **/

#import "NoteTakerFirstViewController.h"

@interface NoteTakerFirstViewController ()

@end

@implementation NoteTakerFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
