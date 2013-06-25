//
//  JALUserDataDictionarySpec.h
//  JustAList
//
//  Created by Richard Mayer on 25/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>

////////////////////////////////////////////////////////////////////////////////
#pragma mark Type & Const Definitions
////////////////////////////////////////////////////////////////////////////////

// Enumeration of possible data sets that can be generated
typedef enum {
	JALUserDataTypeUnknown = -1,
	JALUserDataTypeListItems,
    
    JALUserDataTypeEnumStartValid = JALUserDataTypeListItems,
    JALUserDataTypeEnumEndValid = JALUserDataTypeListItems
} JALUserDataTypeEnum;

typedef struct {
    JALUserDataTypeEnum     type;
	NSString*               keyStr;
	NSString*               collectionClassTypeStr;
    NSString*               objectClassTypeStr;
} JALUserDataTypeStruct;

extern const JALUserDataTypeStruct kJALUserDataCollections [];

@interface JALUserDataDictionarySpec : NSObject

// These accessors are mostly intended for validation of the returned data,
// E.g. validation by a unit test
- (NSString*)keyNameForDataType:(JALUserDataTypeEnum)userDataType;
- (NSString*)collectionClassForDataType:(JALUserDataTypeEnum)userDataType;
- (NSString*)objectClassTypeForDataType:(JALUserDataTypeEnum)userDataType;

@end
