//
//  JALHardocedFixtureTests.m
//  JustAList
//
//  Created by Richard Mayer on 23/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "JALHardcodedFixture.h"
#import "JALModelConstants.h"

#pragma mark Public Inteface
@interface JALHardocedFixtureTests : SenTestCase
@end

#pragma mark Private Inteface
@interface JALHardocedFixtureTests ()
@property (nonatomic, retain)JALHardcodedFixture *unitUnderTest;
@end

#pragma mark Implementation
@implementation JALHardocedFixtureTests

@synthesize unitUnderTest = _unitUnderTest;

#pragma mark SetUp & TearDown
- (void)setUp
{
    [super setUp];
    
    self.unitUnderTest = [[[JALHardcodedFixture alloc] init] autorelease];
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
 * Accessor 'objects' should return a dictionary of objects
 * - keynames should all be known
 * - values should all be instances of NSSet
 *
 */
-(void)testObjectsAccessor_000000
{
    // Test Conditions
    // TODO: this is defined differently now!
    NSSet *validKeys = [NSSet setWithObjects:
                        kJALPersistentDataKeyListItems,
                        nil];
    
    // Test Execution
    NSDictionary *actualResult = nil;
    STAssertNoThrow(actualResult = self.unitUnderTest.objects, nil);
    
    // Test Evaluation
    NSSet *actualKeys = [NSSet setWithArray:[actualResult allKeys]];
    STAssertTrue([actualKeys isSubsetOfSet:validKeys],
                 @"JALHardcodedFixture uses unknown keys or JALHardcodedFixtureTests needs updating");
    
    // TODO: check they're all the correct class
}

@end
