//
//  JALUserDataDictionarySpecTests.m
//  JustAList
//
//  Created by Richard Mayer on 23/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "JALUserDataDictionarySpec.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark Public Interface
////////////////////////////////////////////////////////////////////////////////

@interface JALUserDataDictionarySpecTests : SenTestCase
@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark Private Interface
////////////////////////////////////////////////////////////////////////////////

@interface JALUserDataDictionarySpecTests ()
@property (nonatomic, retain) JALUserDataDictionarySpec *unitUnderTest;
@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark Implementation
////////////////////////////////////////////////////////////////////////////////

@implementation JALUserDataDictionarySpecTests

@synthesize unitUnderTest = _unitUnderTest;

//---------------------------
#pragma mark SetUp & TearDown
//---------------------------

- (void)setUp
{
    [super setUp];
    // --
    
    STAssertNoThrow(self.unitUnderTest = [[[JALUserDataDictionarySpec alloc] init] autorelease],
                    @"Test failed. The unit under test raised an exception, whilst being instantiated.");
}

- (void)tearDown
{
    [self.unitUnderTest release];
    
    //--
    [super tearDown];
}


//---------------------------
#pragma mark Tests
//---------------------------

-(void)testEnumAndArrayConsistency
{
    if (self.unitUnderTest != nil)
    {
        NSUInteger userDataTypeCount = 0;
        
        NSLog(@"Testing the correct structure of enum JALUserDataTypeEnum...");
        
        // There is a ...First enumeration = 0
        NSLog(@"JALUserDataTypeEnumFirst = %d (expect 0)", JALUserDataTypeEnumFirst);
        BOOL isJALUserDataTypeEnumFirstGood = (JALUserDataTypeEnumFirst == 0);
        STAssertTrue(isJALUserDataTypeEnumFirstGood, nil);
        
        // There is an ...Last enumeration > 0
        NSLog(@"JALUserDataTypeEnumLast = %d (expect 0 or larger)", JALUserDataTypeEnumLast);
        BOOL isJALUserDataTypeEnumLastGood = (JALUserDataTypeEnumLast >= 0);
        STAssertTrue(isJALUserDataTypeEnumLastGood, nil);
        
        BOOL isEnumCountDeclarationValidated = NO;
        if (isJALUserDataTypeEnumFirstGood && isJALUserDataTypeEnumLastGood)
        {
            // The USER_DATA_TYPE_ENUMS_COUNT define is in sync with the actual number of enums?
            for (JALUserDataTypeEnum userDataType = JALUserDataTypeEnumFirst;
                 userDataType <= JALUserDataTypeEnumLast;
                 ++userDataType)
            {
                userDataTypeCount++;
                // For the log out, knock 1 off the userData type count, just so that the
                // message "looks" correct. Although perfectly valid "UserData typ 1 with
                // enum val 0" would seem wrong to the casual observer!)
                NSLog(@"JALUserDataTypeEnum enum %d has the value %d", userDataTypeCount-1, userDataType);
            }
            
            isEnumCountDeclarationValidated = (userDataTypeCount = USER_DATA_TYPE_ENUMS_COUNT);
            STAssertTrue(isEnumCountDeclarationValidated,
                         @"The object under test declares %d types (USER_DATA_TYPE_ENUMS_COUNT), but between JALUserDataTypeEnumFirst (%d) and JALUserDataTypeEnumLast (%d) there are %d enumerations. Perhaps someone forgot to update USER_DATA_TYPE_ENUMS_COUNT or the First/Last aliases are incorrect?", USER_DATA_TYPE_ENUMS_COUNT, JALUserDataTypeEnumFirst, JALUserDataTypeEnumLast, JALUserDataTypeEnumLast-JALUserDataTypeEnumFirst+1);
        }
        
        if (isEnumCountDeclarationValidated)
        {
            // Test that enumerations map onto the array of structs
            int sizeOfUserDataDefsArray = (sizeof(kJALUserDataCollections) / sizeof(kJALUserDataCollections[0]));
            
            STAssertTrue(USER_DATA_TYPE_ENUMS_COUNT == sizeOfUserDataDefsArray,
                         @"kJALUserDataCollections array size doesn't correlate with the number of types defined by UserDataTypes");
            
            STAssertTrue(USER_DATA_TYPE_ENUMS_COUNT <= sizeOfUserDataDefsArray,
                         @"kJALUserDataCollections array size %d is larger than expected (%d) - potential double defined types?", sizeOfUserDataDefsArray, USER_DATA_TYPE_ENUMS_COUNT);
            
            STAssertTrue(USER_DATA_TYPE_ENUMS_COUNT >= sizeOfUserDataDefsArray,
                         @"kJALUserDataCollections array size %d is smaller than expected (%d) - definitions may be missing for some types.", sizeOfUserDataDefsArray, USER_DATA_TYPE_ENUMS_COUNT);
            
            NSLog(@"There are %d userData type enums defined (incl. 'Unknown'), corresponding to %d array elements to store user data type descriptions", sizeOfUserDataDefsArray, USER_DATA_TYPE_ENUMS_COUNT);
        }
    }
    
    else {
        STFail(@"Test not executed because unit under test was not initialised");
    }
}

/*!
 * Method under test:
 * - (NSString*)keynameForSetOfDataType:(JALUserDataTypeEnum)userDataType;
 *
 * Test description:
 * Method called with all valid enum values for userDataType. The result
 * (an NSString) is inspected.
 *
 * Expected Result:
 * Although technically possible to hardcode the expected result (based on the
 * current valid requirements), that would make for a brittle test. Better to
 * write them to the test log, for verification and do a rudimentary check
 * that all strings are unique and not nil.
 *
 * We also need to check that the ...StartValid enum has the value 0,
 * because the vaild enums are the index into the array of structs.
 *
 * The test isn't really that critical, because the UserDataDictionarySpec is 
 * *the* reference written spec, against which everything else is implemented, 
 * so we can and should only test it's consistency.
 *
 */
-(void)testKeyNameForDataType_valid
{
    if (self.unitUnderTest != nil)
    {
        NSString* keyNameResult = nil;
        NSMutableSet* allKeyNameResults = [NSMutableSet set];
        
        STAssertTrue(JALUserDataTypeEnumFirst == 0,
                     @"Uh-oh, looks like the JALUserDataTypeEnum definition is bad. JALUserDataTypeEnumStartValid should be = 0, followed by all the other valid ones. JALUserDataTypeUnknown should be -1");
        
        for (JALUserDataTypeEnum userDataType = JALUserDataTypeEnumFirst;
             userDataType <= JALUserDataTypeEnumLast;
             ++userDataType)
        {
            STAssertNoThrow(keyNameResult = [self.unitUnderTest keynameForSetOfDataType:userDataType],
                            @"Unexpected exceptions are bad!");
            STAssertNotNil(keyNameResult,
                           @"`keyNameForDataType:` shouldn't return nil for a valid enum (%d). Please check the key name definitions in JALUserDataDictionarySpec.m. Also check validity of the enum declaration in JALUserDataDictionarySpecTests.h E.g. does it define a consecutive range of valid values, using ...StartValid and ...EndValid?",
                           userDataType);
            STAssertFalse([keyNameResult isEqualToString:@""],
                          @"`keyNameForDataType:` shouldn't return an empty string for a valid enum (%d). Please check the key name definitions in JALUserDataDictionarySpec.m. Also check validity of the enum declaration in JALUserDataDictionarySpecTests.h E.g. does it define a consecutive range of valid values, using ...StartValid and ...EndValid?",
                          userDataType);
            
            // If the keyname is valid...
            if (keyNameResult != nil && ![keyNameResult isEqualToString:@""]) {
                // Make sure the name isn't already in use
                STAssertFalse([allKeyNameResults containsObject:keyNameResult],
                              @"Oh dear. Looks like the key name %@ has beed double defined?! Please check the key name definitions in JALUserDataDictionarySpec.m",
                              keyNameResult);
                
                NSLog(@"The key for enum %d is %@", userDataType, keyNameResult);
                [allKeyNameResults addObject:keyNameResult];
            }
        }
    }
    
    else {
        STFail(@"Test not executed because unit under test was not initialised");
    }
}

/*!
 * Method under test:
 * - (NSString*)keynameForSetOfDataType:(JALUserDataTypeEnum)userDataType;
 *
 * Test description:
 * Method called with an invalid enum value. The result is inspected.
 *
 * Expected Result:
 * Should raise an exception;
 *
 */
-(void)testKeyNameForDataType_invalid
{
    if (self.unitUnderTest != nil)
    {
        NSString* keyNameResult = nil;
        
        STAssertNoThrow(keyNameResult = [self.unitUnderTest keynameForSetOfDataType:INT_MIN],
                        @"Unexpected exceptions are bad!");
        STAssertNil(keyNameResult,
                    @"`keyNameForDataType:` should return nil for any invalid value (eg. %ld)",
                    INT_MIN);
        STAssertFalse([keyNameResult isEqualToString:@""],
                      @"`keyNameForDataType:` shouldn't return an empty string for invalid types.");
    }
    
    else {
        STFail(@"Test not executed because unit under test was not initialised");
    }
}

@end
