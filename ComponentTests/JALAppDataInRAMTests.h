//
//  JALAppDataReaderTestsBaseclass.h
//  JustAListTests
//
//  Created by Richard Mayer on 7/9/11.
//  Copyright 2011 Richard Mayer. All rights reserved.

#import <SenTestingKit/SenTestingKit.h>

#import "JALAppData.h"

#define kErrorString_IncorrectSetUp @"Test class is incorrectly initialised."

@interface JALAppDataInRAMTests : SenTestCase {
    id<JALAppData> _unitUnderTest;
}

@property (nonatomic, retain) id<JALAppData> unitUnderTest;

- (void)_testGetListItemForId;
- (void)_testGetListItemsAll;
- (void)_testGetListItemsAllTicked;

@end
