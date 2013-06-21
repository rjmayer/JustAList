//
//  JALAppDataReaderTestsBaseclass.m
//  JustAListTests
//
//  Created by Richard Mayer on 7/9/11.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

#import "JALAppDataInRAMTests.h"
#import "JALListItem.h"

#pragma mark Private Inteface
@interface JALAppDataInRAMTests ()
- (BOOL) isCorrectlySetup;
@end



#pragma mark Implementation
@implementation JALAppDataInRAMTests

@synthesize unitUnderTest = _unitUnderTest;

- (void)setUp
{
    [super setUp];    
}

- (void)tearDown
{
    self.unitUnderTest = nil;
    [_unitUnderTest release];
    
    [super tearDown];
}

#pragma mark - Helpers

- (BOOL) isCorrectlySetup
{
    return [self.unitUnderTest conformsToProtocol:@protocol(JALAppData)];
}


#pragma mark - Unit Tests

- (void)_testGetListItemForId;
{
    BOOL bRes;
    
    // Test Validation
    bRes = [self isCorrectlySetup];
    STAssertTrue(bRes, kErrorString_IncorrectSetUp);
    
    // Test Case 1:
    // Receive a JALListItem for a valid id.
    // However we don't know if the id is valid without setting it first.
    
    // Test Case 2:
    // Exception id thrown for an invalid id.
    
    // Really not sure if this pseudo baseclass is useful cos this is all
    // dependant on concrete implementations?!?

}

- (void)_testGetListItemsAll
{    
    BOOL bRes;
    
    // Test Validation
    bRes = [self isCorrectlySetup];
    STAssertTrue(bRes, kErrorString_IncorrectSetUp);
    
    // Test Case 1:
    // Receive an array. We don't know how many items there should be, without
    // setting them first. To do that we need to init a mock JALDataProxy
    // with the unitUnderTest reader class. Until then, all we can do is at 
    // least test that we get an array back.
    //
    NSArray* allListItems = [self.unitUnderTest getListItemsAll];
    STAssertNotNil(allListItems, @"JALAppDataReaderMock::getListItemsAll returned nil");
    
    // Test Case 2:
    // The array contains only JALListItem objects. This we can be sure of!
    // 
    for (id o in allListItems) {
        bRes = ([o class] == [JALListItem class]);
        STAssertTrue(bRes, @"Wrong class type found.");
    }
}

@end
