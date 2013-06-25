//
//  JALDataFixture.h
//  JustAList
//
//  Created by Richard Mayer on 23/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JALDataFixture <NSObject>
- (NSDictionary *)objects;
@end

@interface JALHardcodedFixture : NSObject <JALDataFixture>

/*!
 * Returns a dictionary of NSSets, indexed using one of the kJALDataTypeCollectionKeyString
 * strings (which are defined in the constant array kJALDataTypeCollectionKeyStrings
 * and idexed from the enum type kJALDataTypeCollectionType.
 *
 * A test should fail if it finds a key other than one of those.
 *
 * Each set contains identical object types, corresponding to the specific key
 * 
 * A test should fail if it finds any other data type.
 *
 * E.g. objects[kJALPersistentDataTypeKeyListItems] returns a set of
 * kJALDataTypeListItem objects.
 */
@property (nonatomic, retain, readonly) NSDictionary *objects;
@end
