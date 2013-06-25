//
//  NSException+JALExceptionTypes.h
//  JustAList
//
//  Created by Richard Mayer on 25/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	JALExceptionTypeUnknown = -1,
	JALExceptionTypeUnexpectedError
} JALExceptionType;

typedef struct {
    JALExceptionType	type;
	NSString*           name;
	NSString*           reason;
} JALExceptionStruct;

extern const JALExceptionStruct kJALExceptions [];

@interface NSException (JALExceptionTypes)

+ (void)raiseJALException:(JALExceptionType)exceptionType
                 userInfo:(NSDictionary *)userInfo;

@end
