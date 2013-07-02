//
//  JALUserDataDictionarySpec.m
//  JustAList
//
//  Created by Richard Mayer on 25/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import "JALUserDataDictionarySpec.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark Const Declarations
////////////////////////////////////////////////////////////////////////////////

const JALUserDataTypeStruct kJALUserDataCollections [] =
{
	{JALUserDataTypeListItem,
        @"JALUserDataTypeListItem",       @"JALListItem"}
};

// TODO: turn enumCount into a property, in order to stub it for testing the
// exception

@implementation JALUserDataDictionarySpec

-(id)init
{
	if (!(self = [super init])) return nil;
    
    // Perform self check on declaration consistency (pre-condition is
    // declaration of the enumeration helpers)
    NSUInteger enumCount = JALUserDataTypeEnumLast - JALUserDataTypeEnumFirst + 1;
    [self validateTheResolvedEnumCount:enumCount];
	
	return self;
}

#pragma mark Public Methods

- (NSString*)keynameForSetOfDataType:(JALUserDataTypeEnum)dataType
{
    NSString* ret = nil;
    
    if (dataType >= JALUserDataTypeEnumFirst &&
        dataType <= JALUserDataTypeEnumLast)
    {
        ret = kJALUserDataCollections[dataType].keyStr;
    }
    
    return ret;
}

- (NSString*)classnameForDataType:(JALUserDataTypeEnum)dataType
{
    NSString* ret = nil;
    
    if (dataType >= JALUserDataTypeEnumFirst &&
        dataType <= JALUserDataTypeEnumLast)
    {
        ret = kJALUserDataCollections[dataType].classNameStr;
    }
    
    return ret;
}

#pragma mark Helpers
// This is abstracted out as a helper in order to test (using a partial mock)
- (void)validateTheResolvedEnumCount:(NSUInteger)enumCount
{
    // TODO: get the name (only) from JAL types (same as for a class)
    if (enumCount != USER_DATA_TYPE_ENUMS_COUNT) {
        [NSException raise:@"NSDictionaryAsConst declaration error"
                    format:@"The #define USER_DATA_TYPE_ENUMS_COUNT declares %d types, but there are %d enums defined, between JALUserDataTypeEnumFirst (%d) and JALUserDataTypeEnumLast (%d). In the case of a disproportianately large number of enums, please verify that the enums take consecutive integer values.",
         USER_DATA_TYPE_ENUMS_COUNT, enumCount, JALUserDataTypeEnumFirst, JALUserDataTypeEnumLast];
    }
}

@end
