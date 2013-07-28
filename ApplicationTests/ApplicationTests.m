//
//  ApplicationTests.m
//  JustAList
//
//  Created by Richard Mayer on 28/07/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "JALAppDelegate.h"
#import "JALListViewController.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark Public Interface
////////////////////////////////////////////////////////////////////////////////

@interface ApplicationTests : SenTestCase
@property (nonatomic, weak) JALListViewController* vc; // there's a good reason to make this a weak reference, but I've forgotten it
@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark Private Interface
////////////////////////////////////////////////////////////////////////////////

@interface ApplicationTests ()
@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark Implementation
////////////////////////////////////////////////////////////////////////////////

@implementation ApplicationTests

//---------------------------
#pragma mark SetUp & TearDown
//---------------------------

@synthesize vc=vc_;

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    UIApplication *application = [UIApplication sharedApplication];
    JALAppDelegate *appDelegate = [application delegate];
    UIWindow *window = [appDelegate window];
    
    self.vc = (JALListViewController *)[window rootViewController];    
}

- (void)tearDown
{
    // Tear-down code here.
    self.vc = nil;
    
    [super tearDown];
}

//---------------------------
#pragma mark Tests
//---------------------------

/*!
 * Test Purpose:
 * Test that the root view controller isnt nil
 *
 */
- (void)testThatViewControllerIsntNil
{
    STAssertNotNil(self.vc, @"JALListViewController hasn't been set");
}

@end
