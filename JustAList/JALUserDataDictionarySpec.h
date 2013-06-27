//
//  JALUserDataDictionarySpec.h
//  JustAList
//
//  Created by Richard Mayer on 25/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

/*!
 * Defines the data framework used, to serve harcoded user data. ie. It 
 * described what object types are contained in what collection typed and 
 * accessible using what key names.
 *
 * It serves as a "contract" between the supplier of hardcoded user data 
 * (typically JALDefaultUserData) and the consumer of it (typically tests, but
 * quite feasably also other parts of the app itself e.g. for restoring
 * default start up data).
 */

#import <Foundation/Foundation.h>

////////////////////////////////////////////////////////////////////////////////
#pragma mark Type & Const Definitions
////////////////////////////////////////////////////////////////////////////////

// Enumeration of possible data sets that can be generated
typedef enum {
    // -------------------------------------------------------------------------
    // These are the "regular" enums (the actual types). There should be
    // USER_DATA_TYPE_ENUMS_COUNT of these! Remember to update the item count 
    // when adding or removing items, also to update JALUserDataTypeEnumLast
	JALUserDataTypeListItem,
    // -------------------------------------------------------------------------

    // -------------------------------------------------------------------------
    // These are helpers. In order to facilitate "for" loop enumeration
    // these 'aliases' mark the first and last items to iterate through.
    JALUserDataTypeEnumFirst = JALUserDataTypeListItem,
    JALUserDataTypeEnumLast = JALUserDataTypeListItem
    // -------------------------------------------------------------------------
} JALUserDataTypeEnum;
#define USER_DATA_TYPE_ENUMS_COUNT 1 // keep this in sync with changes to the enum

// Each JALUserDataTypeEnum maps onto one struct array element, containing
// meta info on the data object
typedef struct {
    JALUserDataTypeEnum     type;
	NSString*               keyStr;
    NSString*               classNameStr;
} JALUserDataTypeStruct;

// This is the array containing the hardcoded meta info
// It's used to dynamically instantiate the correct data objects and potentially
// also to verify an externally prepared object graph
extern const JALUserDataTypeStruct kJALUserDataCollections [USER_DATA_TYPE_ENUMS_COUNT];

@interface JALUserDataDictionarySpec : NSObject

// These accessors are mostly intended for validation of the returned data,
// E.g. validation by a unit test
- (NSString*)keynameForSetOfDataType:(JALUserDataTypeEnum)userDataType;
- (NSString*)classnameForDataType:(JALUserDataTypeEnum)userDataType;

@end

