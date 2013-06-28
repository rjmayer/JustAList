//
//  JALAppDataMockTests.h
//  JustAListTests
//
//  Created by Richard Mayer on 31/8/11.
//  Copyright 2011 Richard Mayer. All rights reserved.

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>

#import "JALAppData.h"

#define USE_APPLICATION_UNIT_TEST 1

@interface JALAppDataMockTests : SenTestCase {
    id<JALAppData> _unitUnderTest;
}
#if USE_APPLICATION_UNIT_TEST

@property (nonatomic, retain) id<JALAppData> unitUnderTest;

- (void)testSetDataFromPersistentData;

- (void)testGetPersistentData;
- (void)testGetListItemForId;
- (void)testGetListItemsAll;
- (void)testGetListItemsAllTicked;

#endif
@end
