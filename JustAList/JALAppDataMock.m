//
//  JALAppDataReaderMock.m
//  JustAList
//
//  Created by Richard Mayer on 11/05/2011.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

#import "JALAppDataMock.h"

#import "JALListItem.h"

@interface JALAppDataMock ()

@property (nonatomic, strong) NSMutableSet* listItems;

@end


@implementation JALAppDataMock

const int kNumTestObjects = 11;

@synthesize listItems;

- (id)init
{
    if (!(self = [super init])) return nil;

    self.listItems = [NSMutableSet setWithCapacity:kNumTestObjects];
    
    for (int i=0; i<kNumTestObjects; i++) {
        JALListItem* listItem = [[JALListItem alloc] init];
        // set id
        listItem.identifier = i;
        // set name
        listItem.title = [NSString stringWithFormat:@"Mock list item %d", i];
        // tick every second
        if (i%2 == 0) {listItem.isTicked = YES;}
        // star every third
        if (i%3 == 0) {listItem.isStarred = YES;}

        [self.listItems addObject:listItem];
    }
    
    return self;
}



#pragma mark - JALAppData Protocol

#pragma mark Setters

- (void) setDataFromPersistentDataRoot:(NSDictionary *)dataDict 
                            ofCategory:(JALPersistentDataCategory)category
{
    switch (category) {
        case JALPersistentDataCategoryDocuments:
        case JALPersistentDataCategoryAll:
            self.listItems = [dataDict objectForKey:@"listItems"];
            break;
            
        default:
            break;
    }
}

#pragma mark Getters

- (NSDictionary*) getPersistentData:(JALPersistentDataCategory)category
{
    NSDictionary* persistentData = nil;
    
    switch (category) {
        case JALPersistentDataCategoryDocuments:
        case JALPersistentDataCategoryAll:
            persistentData = [NSDictionary dictionaryWithObjectsAndKeys:
                              self.listItems, @"listItems", 
                              nil];
            break;
            
        default:
            break;
    }
    
    return persistentData;
}

- (JALListItem*) getListItemForId:(NSUInteger)listItemId
{    
    // Data Access
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"identifier == %@", [NSNumber numberWithUnsignedInteger:listItemId]];
    NSSet* filteredSet = [self.listItems filteredSetUsingPredicate:predicate];
    NSArray* result = [filteredSet allObjects];

    // Evaluate Result
    JALListItem* obj = nil;
    
	if (result != nil && result.count == 1) {
        obj = [result objectAtIndex:0];
    }

	return obj;
}

- (NSArray*) getListItemsAll 
{
    return [self.listItems allObjects];
}

- (NSArray*) getListItemsAllTicked:(BOOL)isTicked 
{
    // Data Access
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"isTicked == %@", [NSNumber numberWithBool:isTicked]];
    NSSet* filteredSet = [self.listItems filteredSetUsingPredicate:predicate];
    NSArray* result = [filteredSet allObjects];
    
    return result;
}

@end
