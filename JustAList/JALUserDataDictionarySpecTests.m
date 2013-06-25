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
#pragma mark Public Inteface
////////////////////////////////////////////////////////////////////////////////

@interface JALUserDataDictionarySpecTests : SenTestCase
@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark Private Inteface
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
    
    self.unitUnderTest = [[[JALUserDataDictionarySpec alloc] init] autorelease];
}

- (void)tearDown
{
    self.unitUnderTest = nil;
    
    [super tearDown];
}


//---------------------------
#pragma mark Tests
//---------------------------

// TEST that the array size is equal to ...EndValid - ...StartValid
// and that ...StartValid = 0
// and that ...Unknown = -1

/*!
 * Method under test:
 * - (NSString*)keyNameForDataType:(JALUserDataTypeEnum)userDataType;
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
    NSString* keyNameResult = nil;
    NSMutableSet* allKeyNameResults = [NSMutableSet set];
    
    STAssertTrue(JALUserDataTypeEnumStartValid == 0,
                 @"Uh-oh, looks like the JALUserDataTypeEnum definition is bad. JALUserDataTypeEnumStartValid should be = 0, followed by all the other valid ones. JALUserDataTypeUnknown should be -1");
    
    for (JALUserDataTypeEnum userDataType = JALUserDataTypeEnumStartValid;
         userDataType <= JALUserDataTypeEnumEndValid;
         ++userDataType)
    {
        STAssertNoThrow(keyNameResult = [self.unitUnderTest keyNameForDataType:userDataType],
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

/*!
 * Method under test:
 * - (NSString*)keyNameForDataType:(JALUserDataTypeEnum)userDataType;
 *
 * Test description:
 * Method called with the "unknown" enum value. The result is inspected.
 *
 * Expected Result:
 * Should return nil (definately not an empty string);
 *
 * We also need to check that the ...Unknown enum has the value -1,
 * because the vaild enums are the index into the array of structs.
 */
-(void)testKeyNameForDataType_unknown
{
    NSString* keyNameResult = nil;
    
    STAssertTrue(JALUserDataTypeUnknown == -1,
                 @"Uh-oh, looks like the JALUserDataTypeEnum definition is bad. JALUserDataTypeUnknown should be -1");
    
    STAssertNoThrow(keyNameResult = [self.unitUnderTest keyNameForDataType:JALUserDataTypeUnknown],
                    @"Unexpected exceptions are bad!");
    STAssertNil(keyNameResult,
                    @"`keyNameForDataType:` should return nil for JALUserDataTypeUnknown (%d). Please check the key name definitions in JALUserDataDictionarySpec.m",
                   JALUserDataTypeUnknown);
    STAssertFalse([keyNameResult isEqualToString:@""],
                    @"`keyNameForDataType:` shouldn't return an empty string for JALUserDataTypeUnknown (%d). Please check the key name definitions in JALUserDataDictionarySpec.m",
                   JALUserDataTypeUnknown);
}

/*!
 * Method under test:
 * - (NSString*)keyNameForDataType:(JALUserDataTypeEnum)userDataType;
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
    NSString* keyNameResult = nil;
    
    STAssertNoThrow(keyNameResult = [self.unitUnderTest keyNameForDataType:INT_MIN],
                    @"Unexpected exceptions are bad!");
    STAssertNil(keyNameResult,
                @"`keyNameForDataType:` should return nil for any invalid value (eg. %ld)",
                INT_MIN);
    STAssertFalse([keyNameResult isEqualToString:@""],
                  @"`keyNameForDataType:` shouldn't return an empty string for invalid types.");
}

@end
