//
//  JALModelConstants
//  JustAList
//
//  Created by Richard Mayer on 20/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>

// TODO: move this into JALMacros
#define SIZE_OF(MY_CONSTANT_STRING_ARRAY) sizeof(MY_CONSTANT_STRING_ARRAY) / sizeof(MY_CONSTANT_STRING_ARRAY[0])

// General consts
extern NSString * const kJALPersistentDataKeyListItems;

// TODO: check Eli's pmx code, if this isn't better handled with enums
extern NSString * const kJALPersistentDataDictKeysArray[];
extern int kJALSizeOfPersistentDataDictKeysArray;
