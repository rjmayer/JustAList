//
//  NSException+JALExceptionTypes.m
//  JustAList
//
//  Created by Richard Mayer on 25/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import "NSException+JALExceptionTypes.h"

const JALExceptionStruct kJALExceptions[] =
{
	{JALExceptionTypeUnexpectedError,
        @"JALExceptionTypeUnexpectedError",
        @"Something bad has happened!"},
    
    // Sentinal JALExceptionTypeUnknown marks end of the array
    {JALExceptionTypeUnknown,
        @"",
        @""}
};

@implementation NSException (JALExceptionTypes)

+ (void)raiseJALException:(JALExceptionType)exceptionType
                          userInfo:(NSDictionary *)userInfo
{
    NSException* exception = nil;
    NSDictionary* exceptionDefnDict = nil;
    
    for (const JALExceptionStruct *exceptionDefnStruct = kJALExceptions;
         exceptionDefnStruct->type != JALExceptionTypeUnknown;
         ++exceptionDefnStruct)
    {
        if (exceptionDefnStruct->type == exceptionType)
        {
            exceptionDefnDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                   exceptionDefnStruct->name, @"name",
                                   exceptionDefnStruct->reason, @"reason",
                                   nil];
            break;
        }
    }
    
    if (exceptionDefnDict != nil) {
        exception = [NSException exceptionWithName:[exceptionDefnDict objectForKey:@"name"]
                                            reason:[exceptionDefnDict objectForKey:@"reason"]
                                          userInfo:userInfo];
        
        [exception raise];
    }    
}


@end
