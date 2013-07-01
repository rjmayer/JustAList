//
//  JALTypes.h
//  JustAList
//
//  Created by Richard Mayer on 01/07/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

// Enumeration of possible user data sets that can be generated
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

// Each JALUserDataTypeEnum maps onto one struct containing meta info required
// when reading or writing (initialising) the corresponding collection of objects
typedef struct {
    JALUserDataTypeEnum     type;
	NSString*               keyStr;
    NSString*               classNameStr;
} JALUserDataTypeStruct;


