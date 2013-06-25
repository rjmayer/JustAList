//
//  JALDefaultUserData.m
//  JustAList
//
//  Created by Richard Mayer on 23/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JALHardcodedFixture.h"
#import "JALModelConstants.h"
#import "JALListItem.h"

#pragma mark Private Inteface
@interface JALHardcodedFixture ()
- (NSSet*)listItemObjects;
@end

@implementation JALHardcodedFixture

@synthesize objects = _objects;

- (id)init
{
	if (!(self = [super init])) return nil;
    
    _objects = [NSDictionary dictionaryWithObjectsAndKeys:
                [self listItemObjects], kJALPersistentDataKeyListItems,
                nil];
    
    // TODO: verify that set of _objects.allKeys is a subset of
    // kJALSizeOfPersistentDataDictKeysArray
    
    /*
    for (int i=0; i < kJALSizeOfPersistentDataDictKeysArray; i++) {
        NSLog(@"my constant string is: %@", kJALPersistentDataDictKeysArray[i]);
    }
     */
    
    return self;
}

- (void)dealloc
{
    _objects = nil;
    
    [super dealloc];
}

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
