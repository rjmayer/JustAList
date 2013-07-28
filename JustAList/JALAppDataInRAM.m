//
//  JALAppData.m
//  JustAList
//
//  Created by Richard Mayer on 10/10/11.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

#import "JALAppDataInRAM.h"

#import "JALListItem.h"

@interface JALAppDataInRAM ()

@property (nonatomic, strong) NSSet* listItems;

@end

// TODO: initWithPersistentDataStorageServiceForDictionary
// @property dataService
// rootDocsDataDict = [dataService appDocumentData]
// self.foo = [rootDocsDataDict objectForKey:@"foo"]
// self.bar = [rootDocsDataDict objectForKey:@"bar"]
// etc

@implementation JALAppDataInRAM

@synthesize listItems;

- (id)init
{
    if (!(self = [super init])) return nil;
    
    return self;
}



#pragma mark - JALAppData Protocol

#pragma mark Setters

/*
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
 */
- (void)unpersistAppData
{
    // TODO: use service's readDefaultApplicationDataContext
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
    
    int n = [result count];
	if (result != nil && n == 1) {
        obj = [result objectAtIndex:0];
    }
    
    else if (result != nil) {
        NSAssert(n <= 1, @"Program Error; duplicate id's found for id %d", listItemId);
    }
    
	return obj;
}

- (NSArray*) getListItemsAll 
{
    return [self.listItems allObjects];
}

// TODO: generalise this accessor
// - turn into sth like getListItemsForKeysAndValues:

- (NSArray*) getListItemsAllTicked:(BOOL)isTicked 
{
    // Data Access
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"isTicked == %@", [NSNumber numberWithBool:isTicked]];
    NSSet* filteredSet = [self.listItems filteredSetUsingPredicate:predicate];
    NSArray* result = [filteredSet allObjects];
    
    return result;
}

@end
