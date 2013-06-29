//
//  JALUserDataDictionarySpecTests.m
//  JustAList
//
//  Created by Richard Mayer on 23/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "JALUserDataDictionarySpec.h"

// TODO: How can I force tests to run in a particular order?

// TODO: put all strings int Localizable, include a macro definition to get
// with something like ERROR_MSG_FORMAT3(SUITE, TEST, CASE, ERRTYPE)
// NSLog([NSString stringWithFormat:ERROR_MSG_FORMAT3(SUITE, @"methodName:", @"01", @"NoThrow"), arg1, arg2, arg3])

#define JALUserDataDictionarySpecTestsErrorMsg_unitUnderTest_NoThrow 

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
    _unitUnderTest = nil;
    [self.unitUnderTest release];
    
    //--
    [super tearDown];
}


//---------------------------
#pragma mark Tests
//---------------------------

/*!
 * Method under test:
 * - (id)init;
 *
 * Preconditions:
 * The object under test has been instantiated, without unexpected behaviour.
 *
 * Test Purpose:
 * It's not so much about testing `init`, but rather validating declarations and
 * the hardcoded constants of the class itself. This is a precondition for all 
 * other tests in the suite, which will likely fail if the underlying data 
 * structures have'nt been correctly defined. 
 *
 * Furthermore, it's exactly this aspect of the class (as opposed to the actual
 * methods) that is most prone to human error. E.g a new data-type enumeration 
 * defined, description added to struct array, but the dev forgets to update the
 * array size #define.
 *
 * Test Description:
 * 1. Verify that the JALUserDataTypeEnum contains two helper 'aliases';
 *    JALUserDataTypeEnumFirst (with int value 0) and
 *    JALUserDataTypeEnumLast (with int value 0 or greater)
 * 2. Verify that the 'implicitly' defined enumeration count (delta First..Last)
 *    matches the 'explicitly' defined count (USER_DATA_TYPE_ENUMS_COUNT)
 * 3. Verify that the 'explicitly' defined enumeration count
 *    (USER_DATA_TYPE_ENUMS_COUNT) matches the actual size of the struct array[]
 *
 * Expected Result:
 * All verifications should hould true, without unexpected behaviour. 
 *
 */
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
            
            isEnumCountDeclarationValidated = (userDataTypeCount == USER_DATA_TYPE_ENUMS_COUNT);
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
 * - (NSString*)keynameForDataType:(JALUserDataTypeEnum)userDataType;
 *
 * Preconditions:
 * testEnumAndArrayConsistency must have already passed
 *
 * Test Purpose:
 * Verify that the method returns correct data, with a range of valid input.
 *
 * Test description:
 * 1. Invoke with value 0
 * 2. Invoke with values in the range JALUserDataTypeEnumFirst to 
 *    JALUserDataTypeEnumLast
 *
 * Considerations:
 * The test exceeds the usual boundry value testing, because there's a
 * potential for error for any one of the enum values (e.g. enum has been
 * defined with non-consecutive int values). Also, testing every value explictly
 * allows to check for non-exclusive key names.
 *
 * Expected Result:
 * * In all cases, a string is returned, neither nil nor empty @""
 * * No two strings are equal (key names are mutually exclusive)
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
 * - (NSString*)keynameForDataType:(JALUserDataTypeEnum)userDataType;
 *
 * Preconditions:
 * testEnumAndArrayConsistency must have already passed
 *
 * Test Purpose:
 * Invalid input data handled correctly (robustness)
 *
 * Test description:
 * 1. Invoke with value JALUserDataTypeEnumFirst - 1
 * 2. Invoke with value JALUserDataTypeEnumLast + 1
 *
 * Expected Result:
 * * No exception is raised in the object under test
 * * Return value 'nil'
 *
 */
-(void)testKeyNameForDataType_invalid
{
    if (self.unitUnderTest != nil)
    {
        NSString* noThrowErrorMsg = @"Unexpected exceptions are bad!";
        NSString* notNilErrorMsgFormat = @"`keyNameForDataType:` should return nil for the invalid value of %ld";
        NSString* keyNameResult = nil;
        
        // Test below boundary
        STAssertNoThrow(keyNameResult = [self.unitUnderTest keynameForSetOfDataType:JALUserDataTypeEnumFirst - 1],
                        noThrowErrorMsg);
        STAssertNil(keyNameResult,
                    [NSString stringWithFormat:notNilErrorMsgFormat, JALUserDataTypeEnumFirst - 1]);
        
        // Test above boundary
        STAssertNoThrow(keyNameResult = [self.unitUnderTest keynameForSetOfDataType:JALUserDataTypeEnumLast + 1],
                        noThrowErrorMsg);
        STAssertNil(keyNameResult,
                    [NSString stringWithFormat:notNilErrorMsgFormat, JALUserDataTypeEnumLast + 1]);
    }
    
    else {
        STFail(@"Test not executed because unit under test was not initialised");
    }
}

/*!
 * Method under test:
 * - (NSString*)classnameForDataType:(JALUserDataTypeEnum)userDataType;
 *
 * Preconditions:
 * testEnumAndArrayConsistency must have already passed
 *
 * Test Purpose:
 * Verify that the method returns correct data, with a range of valid input.
 *
 * Test description:
 * 1. Invoke with value 0
 * 2. Invoke with values in the range JALUserDataTypeEnumFirst to
 *    JALUserDataTypeEnumLast
 *
 * Considerations:
 * The test exceeds the usual boundry value testing, because there's a
 * potential for error for any one of the enum values (e.g. enum has been
 * defined with non-consecutive int values).
 *
 * Expected Result:
 * * In all cases, a string is returned, neither nil nor empty @""
 * * The string is the name of a value class, that can be successfully
 *   instanciated.
 *
 */
-(void)testClassnameForDataType_valid
{
    if (self.unitUnderTest != nil)
    {
        NSString* classNameResult = nil;
        
        STAssertTrue(JALUserDataTypeEnumFirst == 0,
                     @"Uh-oh, looks like the JALUserDataTypeEnum definition is bad. JALUserDataTypeEnumStartValid should be = 0, followed by all the other valid ones. JALUserDataTypeUnknown should be -1");
        
        for (JALUserDataTypeEnum userDataType = JALUserDataTypeEnumFirst;
             userDataType <= JALUserDataTypeEnumLast;
             ++userDataType)
        {
            // Get the ClassnameForDataType
            STAssertNoThrow(classNameResult = [self.unitUnderTest classnameForDataType:userDataType],
                            @"Unexpected exceptions are bad!");
            NSLog(@"The hardcoded classname for enum %d objects is: %@", userDataType, classNameResult);

            // Check it's not nil or @""
            STAssertNotNil(classNameResult,
                           @"`classnameForDataType:` shouldn't return nil for a valid enum (%d). Please check the key name definitions in JALUserDataDictionarySpec.m. Also check validity of the enum declaration in JALUserDataDictionarySpecTests.h E.g. does it define a consecutive range of valid values, using ...StartValid and ...EndValid?",
                           userDataType);
            STAssertFalse([classNameResult isEqualToString:@""],
                          @"`classnameForDataType:` shouldn't return an empty string for a valid enum (%d). Please check the key name definitions in JALUserDataDictionarySpec.m. Also check validity of the enum declaration in JALUserDataDictionarySpecTests.h E.g. does it define a consecutive range of valid values, using ...StartValid and ...EndValid?",
                          userDataType);
            
            // If the class name appears to be valid...
            if (classNameResult != nil && ![classNameResult isEqualToString:@""]) {                
                // try to instantiate the corresponding class
                id c;
                STAssertNoThrow(c = [NSClassFromString(classNameResult) alloc] , @"Unexpected exception whilst trying to alloc class %@", classNameResult);
                NSLog(@"Result of allocating an instance of %@: %@", classNameResult, c);
                NSObject* obj = [c init];
                STAssertNotNil(obj, @"Failed to init. Does the class %@ really exist?", classNameResult);
            }
        }
    }
    
    else {
        STFail(@"Test not executed because unit under test was not initialised");
    }
}

/*!
 * Method under test:
 * - (NSString*)classnameForDataType:(JALUserDataTypeEnum)userDataType;
 *
 * Preconditions:
 * testEnumAndArrayConsistency must have already passed
 *
 * Test Purpose:
 * Invalid input data handled correctly (robustness)
 *
 * Test description:
 * 1. Invoke with value JALUserDataTypeEnumFirst - 1
 * 2. Invoke with value JALUserDataTypeEnumLast + 1
 *
 * Expected Result:
 * * No exception is raised in the object under test
 * * Return value 'nil'
 *
 */
-(void)testClassnameForDataType_invalid
{
    if (self.unitUnderTest != nil)
    {
        NSString* noThrowErrorMsg = @"Unexpected exceptions are bad!";
        NSString* notNilErrorMsgFormat = @"`keyNameForDataType:` should return nil for the invalid value of %ld";
        NSString* keyNameResult = nil;
        
        // Test below boundary
        STAssertNoThrow(keyNameResult = [self.unitUnderTest classnameForDataType:JALUserDataTypeEnumFirst - 1],
                        noThrowErrorMsg);
        STAssertNil(keyNameResult,
                    [NSString stringWithFormat:notNilErrorMsgFormat, JALUserDataTypeEnumFirst - 1]);
        
        // Test above boundary
        STAssertNoThrow(keyNameResult = [self.unitUnderTest classnameForDataType:JALUserDataTypeEnumLast + 1],
                        noThrowErrorMsg);
        STAssertNil(keyNameResult,
                    [NSString stringWithFormat:notNilErrorMsgFormat, JALUserDataTypeEnumLast + 1]);
    }
    
    else {
        STFail(@"Test not executed because unit under test was not initialised");
    }
}
@end
