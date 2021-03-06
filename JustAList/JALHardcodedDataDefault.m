//
//  JALDefaultUserData.m
//  JustAList
//
//  Created by Richard Mayer on 23/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JALHardcodedDataDefault.h"
#import "JALListItem.h"


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Inteface
////////////////////////////////////////////////////////////////////////////////

@interface JALHardcodedDataDefault ()
- (NSSet*)listItemObjects;
@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation
////////////////////////////////////////////////////////////////////////////////

@implementation JALHardcodedDataDefault

#pragma mark Lifecycle

- (id)init
{
	if (!(self = [super init])) return nil;
    
    return self;
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - protocol implementation JALHardcodedData
////////////////////////////////////////////////////////////////////////////////
- (NSDictionary *)userDataDict
{
 return @{kJALUserDataDictionaryObjectTypeListItemKey: [self listItemObjects]};
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Here's where the data actually gets manufactured
////////////////////////////////////////////////////////////////////////////////

#pragma mark Init Objects of Type: JALListItem

- (NSSet*)listItemObjects
{
    NSMutableSet *listItems = [NSMutableSet set];
    
    int numItems = 10;
    
    for (int i=0; i<numItems; i++) {
        JALListItem *listItem = [[JALListItem alloc] init];
        // set id
        listItem.identifier = i;
        // set name
        listItem.title = [NSString stringWithFormat:@"Default data list item %d", i];
        // tick every second
        if (i%2 == 0) {listItem.isTicked = YES;}
        // star every third
        if (i%3 == 0) {listItem.isStarred = YES;}
        
        [listItems addObject:listItem];
    }
    
    return listItems;
}

@end
