//
//  JALAppData.h
//  JustAList
//
//  Created by Richard Mayer on 11/05/2011.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

/* JALAppData defines the required functionality for a class providing 
 * synchronous access to the application's persistent user data, stored locally.
 *
 * Any class that implements JALAppData is left to make it's own decision where 
 * the data comes from and how.
 *
 * Currently only reading data is supported, as not yet any mechanism in place
 * write or modify data! Obviously that'll come very soon ;)
 */

#import <Foundation/Foundation.h>

#import "JALListItem.h"

typedef enum  {
	JALPersistentDataCategoryNone,
	JALPersistentDataCategoryAll,
	JALPersistentDataCategoryDocuments,
	JALPersistentDataCategoryCache,
	JALPersistentDataCategoryTemp
} JALPersistentDataCategory;

@protocol JALAppData <NSObject>

// TODO: documentation!!!

- (void)unpersistAppData;

- (JALListItem*) getListItemForId:(NSUInteger)listItemId;
- (NSArray*) getListItemsAll;
- (NSArray*) getListItemsAllTicked:(BOOL)isTicked;

// TODO: turn into getListItemsAllTicked:Starred:Flagged:Due:etc:etc:etc:
// define enum JALGetObjFilterTypeBooleanProperty
// -1 any, 0 false, 1 true
// eg. getListItemsAllTicked:0 Starred:1 Flagged:-1
// returns all non-ticked starred items irrespective of flagged

// TODO: writing data comes later!
//- (void)persistAppData;

@end
