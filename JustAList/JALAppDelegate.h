//
//  JustAListAppDelegate.h
//  JustAList
//
//  Created by Richard Mayer on 10/05/2011.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RJMDataFacade.h"

#define APP_DELEGATE (JALAppDelegate*)[[UIApplication sharedApplication] delegate]

@interface JALAppDelegate : NSObject <UIApplicationDelegate> {    
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet UINavigationController *navigationController;

@property (nonatomic, strong) NSDictionary* classMap;
@property (nonatomic, strong) RJMDataFacade* dataFacade;

@end
