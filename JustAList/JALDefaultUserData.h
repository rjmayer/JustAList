//
//  JALDataFixture.h
//  JustAList
//
//  Created by Richard Mayer on 23/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Protocol Definition
////////////////////////////////////////////////////////////////////////////////

// Protocol to facilitate writing mock implementations
@protocol JALUserDataSource <NSObject>
- (NSDictionary *)userDataDict;
@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface Definition
////////////////////////////////////////////////////////////////////////////////

@interface JALDefaultUserData : NSObject <JALUserDataSource>

/*!
 * Returns one or more collections of objects. kJALUserDataCollections defines
 * class types for each collection and it's respective objects. 
 *
 * Before returning the objects (initialised on the fly) an exception if raised 
 * if the objects/collections created don't match the expected types (internal 
 * error).
 *
 * It's not possible to test the exception, without first manually "breaking"
 * the hard coded data generation.
 *
 * Each set contains identical object types, corresponding to the specific key
 * 
 * A test should fail if it finds any other data type.
 */
@property (nonatomic, retain, readonly) NSDictionary *userDataDict;

@end
