//
//  NSException+JALExceptionTypesTest.m
//  JustAList
//
//  Created by Richard Mayer on 25/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "NSException+JALExceptionTypes.h"

@interface NSException_JALExceptionTypesTests : SenTestCase

@end

@implementation NSException_JALExceptionTypesTests

- (void)testJALExceptionTypeUnexpectedError
{
    STAssertThrowsSpecificNamed([NSException raiseJALException:JALExceptionTypeUnexpectedError
                                                      userInfo:[NSDictionary dictionaryWithObject:@"object value foo"
                                                                                           forKey:@"key value bar"]],
                                NSException,
                                kJALExceptions[JALExceptionTypeUnexpectedError].name,
                                @"Wrong exception title");
}

@end
