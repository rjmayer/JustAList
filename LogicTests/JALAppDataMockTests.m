//
//  JALAppDataMockTests.m
//  JustAListTests
//
//  Created by Richard Mayer on 31/8/11.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

#import "JALAppDataMockTests.h"
#import "JALAppDataMock.h"

@interface JALAppDataMockTests ()
@end

@implementation JALAppDataMockTests
#if USE_APPLICATION_UNIT_TEST 

@synthesize unitUnderTest = _unitUnderTest;

// ------------------------
#pragma mark Setup/Teardown
// ------------------------

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.unitUnderTest = [[JALAppDataMock alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

// ---------------------------------------
#pragma mark Unit-Tests
// ---------------------------------------


/* @Unit Test Description
 *
 * - (void)setDataFromPersistentDataRoot:(NSDictionary*)dataDict 
 *                            ofCategory:(JALPersistentDataCategory)category;
 * 
 * ==
 * @Test Case 1
 * No plan what or how to test; just make sure it swallows some test data!
 *
 * Expected Result:
 * Receive a valid JALListItem object with id 0
*/
- (void)testSetDataFromPersistentData
{
    // Test Data to set
    NSDictionary* d = [NSDictionary dictionaryWithObjectsAndKeys:
                       @"Foo", @"Foo",
                       @"Bar", @"Bar",
                       @"Boo!", @"Boo!",
                       nil];
    
    // Test Case 1
    [self.unitUnderTest setDataFromPersistentDataRoot:d 
                                           ofCategory:JALPersistentDataCategoryDocuments];                       
}

/* @Unit Test Description
 *
 * - (NSDictionary*)getPersistentData:(JALPersistentDataCategory)category;
 * 
 * ==
 * @Test Case 1
 * Normal use case; just call it and make sure we get a dictionary back.
 *
 * Expected Result:
 * Receive a dictionary.
 */
- (void)testGetPersistentData {
    NSDictionary* resultObject;
    
    // Test Case 1
    resultObject = [self.unitUnderTest getPersistentData:JALPersistentDataCategoryDocuments];
    STAssertNotNil(resultObject, @"JALAppDataMock should not return nil obj for Documents data");

}

/* @Unit Test Description
 *
 * - (JALListItem*) getListItemForId:(NSUInteger)listItemId;
 * 
 * JALDataStoreMock accesses hardcoded data that it initalises itself on init.
 * Therefore we know that the ids are in the range 0..kNumTestObjects-1
 *
 * ==
 * @Test Case 1
 * Minimum valid id (0)
 *
 * Expected Result:
 * Receive a valid JALListItem object with id 0
 *
 * ==
 * @Test Case 2:
 * Maximum valid id (kNumTestObjects-1)
 *
 * Expected Result:
 * Receive a valid JALListItem object with correct id
 *
 * ==
 * @Test Case 3:
 * Invalid id (kNumTestObjects)
 *
 * Expected Result:
 * Exception thrown for an invalid id.
 *
 */
- (void)testGetListItemForId
{
    JALListItem* resultObject;
    
    // Test Case 1
    resultObject = [self.unitUnderTest getListItemForId:0];
    STAssertTrue(resultObject.identifier == 0, @"Wrong object returned for minimum id 0");

    // Test Case 2
    resultObject = [self.unitUnderTest getListItemForId:kNumTestObjects-1];
    STAssertTrue(resultObject.identifier == kNumTestObjects-1, @"Wrong object returned for maximum id %d", kNumTestObjects-1);

    // Test Case 3
    /*
    STAssertThrows([self.unitUnderTest getListItemForId:kNumTestObjects], @"No exception raised for invalid id %d", kNumTestObjects);
     */
}

/* @Unit Test Description
 *
 * - (NSArray*) getListItemsAll;
 * 
 * JALDataStoreMock accesses hardcoded data that it initalises itself on init.
 * Therefore we know how many objects to get back.
 *
 * ==
 * @Test Case 1
 *
 * Expected Results:
 * 1. receive an array of JALListItem objects
 * 2. correct number of objects
 * 3. they are all JALListItem objects
 *
 */
- (void)testGetListItemsAll 
{    
    // Expected Result 1
    NSArray* allListItems = [self.unitUnderTest getListItemsAll];
    STAssertNotNil(allListItems, 
                   @"JALDataStoreMock::getListItemsAll returned nil");
    
    // Expected Result 2
    int nItems = [allListItems count];
    STAssertTrue(nItems == kNumTestObjects, 
                 @"JALDataStoreMock::getListItemsAll returned unexpected number of list items (%i)", 
                 nItems); 
    
    // Expected Result 3
    for (id obj in allListItems) {
        STAssertTrue([obj isKindOfClass:NSClassFromString(@"JALListItem")], 
                     @"Invalid object type found: %@",
                     [obj class]);
    }
}

/* @Unit Test Description
 *
 * - (NSArray*) getListItemsAllTicked:(BOOL)isTicked;
 * 
 * JALDataStoreMock accesses hardcoded data that it initalises itself on init.
 * It defines kNumTestObjects objects, of which every 2nd isTicked=YES.
 *
 * ==
 * @Test Case 1
 * Get the ticked objects
 *
 * Expected Results:
 * 1. receive an array of JALListItem objects
 * 2. correct number of objects
 * 3. they are all JALListItem objects
 *
 * ==
 * @Test Case 2
 * Get the non-ticked objects
 *
 * Expected Results:
 * 1. receive an array of JALListItem objects
 * 2. correct number of objects
 * 3. they are all JALListItem objects
 *
 */
- (void)testGetListItemsAllTicked
{
    // == Test Case 1
    NSArray* allListItems = [self.unitUnderTest getListItemsAllTicked:YES];
    int nItems = [allListItems count];
    int nExpected = (kNumTestObjects/2) + (kNumTestObjects%2);

    // Expected Result 1
    STAssertTrue(nItems == nExpected,
                 @"Wrong number of ticked objects returned (%d). Expected %d.", 
                 nItems, nExpected);
    
    // Expected Result 2
    for (id obj in allListItems) {
        STAssertTrue([obj isKindOfClass:NSClassFromString(@"JALListItem")], 
                     @"Invalid object type found: %@",
                     [obj class]);
    }

    // == Test Case 2
    allListItems = [self.unitUnderTest getListItemsAllTicked:NO];
    nItems = [allListItems count];
    nExpected = (kNumTestObjects/2);
    
    // Expected Result 1
    STAssertTrue(nItems == nExpected,
                 @"Wrong number of non-ticked objects returned (%d). Expected %d.", 
                 nItems, nExpected);
    
    // Expected Result 2
    for (id obj in allListItems) {
        STAssertTrue([obj isKindOfClass:NSClassFromString(@"JALListItem")], 
                     @"Invalid object type found: %@",
                     [obj class]);
    }
}

#endif
@end
