//
//  JALHardocedFixtureTests.m
//  JustAList
//
//  Created by Richard Mayer on 23/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "JALDefaultUserData.h"

#pragma mark Public Inteface
@interface JALDefaultUserDataTests : SenTestCase
@end

#pragma mark Private Inteface
@interface JALDefaultUserDataTests ()
@property (nonatomic, retain) JALDefaultUserData *unitUnderTest;
@end

#pragma mark Implementation
@implementation JALDefaultUserDataTests

@synthesize unitUnderTest = _unitUnderTest;

#pragma mark SetUp & TearDown
- (void)setUp
{
    [super setUp];
    
    self.unitUnderTest = [[[JALDefaultUserData alloc] init] autorelease];
}

- (void)tearDown
{
    self.unitUnderTest = nil;
    
    [super tearDown];
}

#pragma mark Tests

/*!
 * Test Case 000000: testObjectsAccessor
 *
 * Expected Result:
 * Accessor 'objects' should return a dictionary of sets
 * - their keynames should all be known (e.g. kJALFixtureDataKeys array,
 *    indexed by enum type JALFixtureDataKeyEnum)
 * - values should all be instances of NSSet
 * - all objects of the set should be instances of the same class
 * - it should be possible to dynamically get the class type, required for 
 *   a specific key
 *
 */
-(void)testObjectsAccessor_000000
{
    // Test Conditions
    // The set of valid key strings must be filled dynamically, in order not
    // to have to update the test after every data model update (test is self
    // maintaining)
    NSSet *validKeys = [NSSet setWithObjects:
                        nil];
    STAssertTrue([validKeys count] > 0,
                 @"TEST / IMPLEMENTATION IS UNFINISHED: pending developer spec of JALUserDataTypeEnum");
    
    // Test Execution
    NSDictionary *actualResult = nil;
    STAssertNoThrow(actualResult = self.unitUnderTest.userDataDict, nil);
    
    // Test Evaluation
    NSSet *actualKeys = [NSSet setWithArray:[actualResult allKeys]];
    STAssertTrue([actualKeys isSubsetOfSet:validKeys],
                 @"JALDefaultUserData uses unknown keys or JALDefaultUserDataTests needs updating");

    // TODO: check it's an NSSet

    // TODO: check it's objects are all the correct class
}

@end
