//
//  JALHardcodedDataTests.m
//  JustAList
//
//  Created by Richard Mayer on 28/07/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "JALHardcodedDataDefault.h"


////////////////////////////////////////////////////////////////////////////////
#pragma mark Public Interface
////////////////////////////////////////////////////////////////////////////////

@interface JALHardcodedDataDefaultTests : SenTestCase
@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark Private Interface
////////////////////////////////////////////////////////////////////////////////

@interface JALHardcodedDataDefaultTests ()
@property (nonatomic, strong) JALHardcodedDataDefault *unitUnderTest;
@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark Implementation
////////////////////////////////////////////////////////////////////////////////

@implementation JALHardcodedDataDefaultTests

@synthesize unitUnderTest = _unitUnderTest;

//---------------------------
#pragma mark SetUp & TearDown
//---------------------------

- (void)setUp
{
    [super setUp];
    
    //--
    STAssertNoThrow(self.unitUnderTest = [[JALHardcodedDataDefault alloc] init],
                    @"\n>>> Test precondition not met. The unit under test raised an exception, whilst being instantiated.");
    STAssertNotNil(self.unitUnderTest,
                   @"\n>>> Test precondition not met. The unit under test was incorrectly initialised.");
}

- (void)tearDown
{
    self.unitUnderTest = nil;
    
    //--
    [super tearDown];
}


//---------------------------
#pragma mark Preconditions
//---------------------------

- (BOOL)precondA_SomeRequiredPrecondition
{
    BOOL isPreconditionGood = YES;
    
    //NSLog(@"Verifying precondition A: ...");
    
    if (!isPreconditionGood) {
        //NSLog(@"Precondition A doesn't hold: ...");
    }
    
    return (isPreconditionGood);
}

/*
// Is dependant on precond A
- (BOOL)precondB_SomeRequiredPrecondition
{
    if (![self precondA_SomeRequiredPrecondition]) {
        STFail(@"Test precondition A failed: ...");
        return NO;
    }
    
    BOOL isPreconditionGood = YES;
    
    //NSLog(@"Verifying precondition B: ...");
    
    if (!isPreconditionGood) {
        //NSLog(@"Precondition B doesn't hold: ...");
    }
    
    return (isPreconditionGood);
}
*/

//---------------------------
#pragma mark Tests
//---------------------------

-(void)testInit
{
    // There's nothing else to do, if setup passes then so has the test
}

-(void)testConfirmsToProtocol
{
    STAssertTrue([self.unitUnderTest conformsToProtocol:@protocol(JALHardcodedDataProtocol)],
                 @"\n>>> The unit under test %@ doesn't conform to JALHardcodedDataProtocol", self.unitUnderTest);
}

/*!
 * Method under test:
 * - (NSDictionary *)userDataDict;
 *
 * Test Purpose:
 * Basic check
 *
 * Expected Result:
 * Return a dictionary, with key kJALUserDataDictionaryObjectTypeListItemKey
 * pointing to an array of JALListItem
 *
 */
-(void)testGetter_userDataDict
{
    NSDictionary* udd = [self.unitUnderTest userDataDict];
    STAssertTrueNoThrow([[udd allKeys] containsObject:kJALUserDataDictionaryObjectTypeListItemKey],
                        @"\n>>> Key %@ not found in userDataDict dictionary %@", kJALUserDataDictionaryObjectTypeListItemKey, udd);
    
    NSArray* a = udd[kJALUserDataDictionaryObjectTypeListItemKey];
    STAssertNotNil(a,
                   @"\n>>> Nil value for key %@ in userDataDict dictionary %@. It should be an array of JALListItem", kJALUserDataDictionaryObjectTypeListItemKey, udd);
    
    NSInteger listItemCount = a.count;
    STAssertTrue(listItemCount > 0,
                 @"\n>>> Empty array for key %@ in userDataDict dictionary %@. It should be an array of at least 1 JALListItem", kJALUserDataDictionaryObjectTypeListItemKey, udd);
}

@end

