//
//  JALListViewDataSource.h
//  JustAList
//
//  Created by Richard Mayer on 10/05/2011.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>

@protocol JALListViewDataSource <UITableViewDataSource>

- (void)dummyDeclarationMakesUnfinishedProtocolFailTests;

// (id<JALDataStoreSingleton>)dataStoreSingletonInstance;
//
// TODO: define JALListViewDataSource
// * In addition to UITableViewDataSource it needs


// TODO: define JALDataStoreSingleton
// * Has all the accesors you could throw a stick at like
//   someObjectTypeSetWithPredicate:
// * Has property (id<JALDataAcquisitionDelegate>)dataAcquisitionDelegate
//
// TODO: define JALDataAcquisitionDelegate
// * Method acquireDataWithCompletionBlock:

@end

@interface JALListViewDataSource : NSObject <UITableViewDataSource> {
    
}

@end
