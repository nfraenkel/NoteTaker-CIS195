//
//  NoteTakerAppDelegate.h
//  NoteTaker
//
//  Created by Nathan Fraenkel on 10/6/12.
//  Copyright (c) 2012 Nathan Fraenkel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteTakerFirstViewController.h"
#import "NoteTakerMasterViewController.h"

@interface NoteTakerAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;

//@property (retain) IBOutlet NoteTakerFirstViewController *tab1;
//@property (retain) IBOutlet NoteTakerMasterViewController *tab2;

@end
