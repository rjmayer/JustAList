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
    //  The data set for this key,       is a kind of    containing instances of...
	{JALUserDataTypeListItems,
        @"JALUserDataTypeListItems",     @"NSSet",       @"JALListItem"},
    
    // Sentinal JALUserDataTypeUnknown marks end of the array
    {JALUserDataTypeUnknown, nil, nil}
};


@implementation JALUserDataDictionarySpec

#pragma mark Public Methods

- (NSString*)keyNameForDataType:(JALUserDataTypeEnum)fixtureDataType
{
    NSString* ret = nil;
    
    if (fixtureDataType != JALUserDataTypeUnknown &&
        fixtureDataType >= JALUserDataTypeEnumStartValid &&
        fixtureDataType <= JALUserDataTypeEnumEndValid)
    {
        ret = kJALUserDataCollections[fixtureDataType].keyStr;
    }
    
    return ret;
}

- (NSString*)collectionClassForDataType:(JALUserDataTypeEnum)fixtureDataType
{
    // FIXME: implement
    return @"";
}

- (NSString*)objectClassTypeForDataType:(JALUserDataTypeEnum)fixtureDataType
{
    // FIXME: implement
    return @"";
}

@end
