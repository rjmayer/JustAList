//
//  JALTypes.h
//  JustAList
//
//  Created by Richard Mayer on 01/07/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

// TODO: Simplify this, because it's huge overkill for what I need.
// The techniques is maybe OK with 3 or 4 strings or more or with nested
// structs but in this concrete case I can just use normal consts in the
// JALUserDataDictionarySpec and save myself one whole shitload of testing and
// even exception handling
// - kUserDataDictionaryObjectTypeListItemKey
// - kUserDataDictionaryObjectTypeListItemClass

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


