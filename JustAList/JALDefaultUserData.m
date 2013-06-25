//
//  JALDefaultUserData.m
//  JustAList
//
//  Created by Richard Mayer on 23/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JALDefaultUserData.h"
#import "JALModelConstants.h"
#import "JALListItem.h"


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Inteface
////////////////////////////////////////////////////////////////////////////////

@interface JALDefaultUserData ()
- (NSSet*)listItemObjects;
@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation
////////////////////////////////////////////////////////////////////////////////

@implementation JALDefaultUserData

@synthesize userDataDict = _objects;

#pragma mark Lifecycle

- (id)init
{
	if (!(self = [super init])) return nil;
    
    // TODO: now we've got enums, this should be done different to avoid making mistakes
    _objects = [NSDictionary dictionaryWithObjectsAndKeys:
                [self listItemObjects], kJALPersistentDataKeyListItems,
                nil];
    
    return self;
}

- (void)dealloc
{
    _objects = nil;
    
    [super dealloc];
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Here's where the data actually gets manufactured
////////////////////////////////////////////////////////////////////////////////

#pragma mark Init Objects of Type: JALListItem

// TODO: check up on retain count shit!!! (and run static analyzer)
// TODO: implement exactly according to the.h documentation
- (NSSet*)listItemObjects
{
    NSMutableSet *listItems = [NSMutableSet set];
    
    int numItems = 10;
    
    for (int i=0; i<numItems; i++) {
        JALListItem *listItem = [[[JALListItem alloc] init] autorelease];
        // set id
        listItem.identifier = i;
        // set name
        listItem.title = [NSString stringWithFormat:@"Default fixture data list item %d", i];
        // tick every second
        if (i%2 == 0) {listItem.isTicked = YES;}
        // star every third
        if (i%3 == 0) {listItem.isStarred = YES;}
        
        [listItems addObject:listItem];
    }
    
    return listItems;
}

@end
