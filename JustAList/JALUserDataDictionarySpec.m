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


@implementation JALUserDataDictionarySpec

-(id)init
{
	if (!(self = [super init])) return nil;
    
    // Perform self check on declaration consistency (pre-condition is
    // declaration of the enumeration helpers)
    NSUInteger enumCount = JALUserDataTypeEnumLast - JALUserDataTypeEnumFirst + 1;
    if (enumCount != USER_DATA_TYPE_ENUMS_COUNT) {
        [NSException raise:@"NSDictionaryAsConst declaration error"
                    format:@"The #define USER_DATA_TYPE_ENUMS_COUNT declares %d types, but there are %d enums defined, between FruitTypeFirst (%d) and FruitTypeLast (%d)",
         USER_DATA_TYPE_ENUMS_COUNT, enumCount, JALUserDataTypeEnumFirst, JALUserDataTypeEnumLast];
    }
	
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

@end
