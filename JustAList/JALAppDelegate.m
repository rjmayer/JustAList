//
//  JustAListAppDelegate.m
//  JustAList
//
//  Created by Richard Mayer on 10/05/2011.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

#import "JALAppDelegate.h"

@interface JALAppDelegate ()
- (void) setTheClassMap;
@end


@implementation JALAppDelegate


@synthesize window=_window;
@synthesize navigationController=_navigationController;
@synthesize classMap;
@synthesize dataFacade;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Configure on-the-fly class mapping
    [self setTheClassMap];
    NSLog(@"Using classes: %@", [self.classMap description]);
    
    // Init the data interface
    // TODO: there's no need for it to be a singleton if we're storing here as a prop
    // - Appwide access with [APP_DELEGATE dataFacade]
    
    self.dataFacade = [RJMDataFacade sharedInstance];

    // Add the navigation controller's view to the window and display.
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [classMap release];
    [super dealloc];
}


#pragma mark Private

- (void) setTheClassMap
{
    if (kRJM_ClassMapFilepath) {
        self.classMap = [[NSDictionary alloc] initWithContentsOfFile:kRJM_ClassMapFilepath];
    }
}

@end