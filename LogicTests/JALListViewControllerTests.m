//
//  JALListViewControllerTests.m
//  JustAList
//
//  Created by Richard Mayer on 08/07/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "JALListViewController.h"
#import "JALListViewDataSource.h"

#pragma mark Public Inteface
@interface JALListViewControllerTests : SenTestCase
@end

#pragma mark Private Inteface
@interface JALListViewControllerTests ()
@property (nonatomic, strong) JALListViewController *unitUnderTest;
@end

#pragma mark Implementation
@implementation JALListViewControllerTests

@synthesize unitUnderTest;

#pragma mark SetUp & TearDown
- (void)setUp
{
    [super setUp];
    
    // FIXME: it's wrong I should be unarchiving the view
    
    self.unitUnderTest = [[JALListViewController alloc] init];
}

- (void)tearDown
{
    self.unitUnderTest = nil;
    
    [super tearDown];
}

#pragma mark Tests

// After initialising there should be a data provider
// * implements the JALListViewDataSource protocol
//
// This is an application test, because the nib defines the table provider,
// which of course is the "view's" table provider, so actually nothng to do with
// the controller (it's onl ythat the controller sometimes does the job)
-(void)testAfterInitHasTheCorrectDataSource
{
    id <UITableViewDataSource> dataSource = self.unitUnderTest.tableViewDataSource;
    STAssertNotNil(dataSource, @"Data source for the object under test is nil. Expected an instance of %@", [JALListViewDataSource class]);
    if (dataSource != nil) {
        STAssertTrue([(NSObject*)dataSource conformsToProtocol:@protocol(JALListViewDataSource)],
                     @"Object under test's data source %@ doesn't conform to the expected protocol %@", dataSource, @protocol(JALListViewDataSource));
    }
}

@end
