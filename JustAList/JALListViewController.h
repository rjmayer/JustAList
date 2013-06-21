//
//  RootViewController.h
//  JustAList
//
//  Created by Richard Mayer on 10/05/2011.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JALListViewController : UITableViewController {

}

// outlet to the data source object ensures that it persists for the liftime of the view controller
// TODO: LOW: is this correct?
// - what happens when the view unloads (prop is set to nil); will it get reinitialised from nib when the view loads again?
// - and if so, will it be the same instance as the table view has?
// - it bothers me that the object in the nib is assigned to 2 outlets
@property (nonatomic, retain) IBOutlet NSObject <UITableViewDataSource>* tableViewDataSource;

@end
