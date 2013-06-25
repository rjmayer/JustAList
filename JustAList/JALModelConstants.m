//
//  JALModelConstants.h
//  JustAList
//
//  Created by Richard Mayer on 20/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import "JALModelConstants.h"

typedef enum {
	JALHardcodedFixtureDictKeyListItems
} JALHardcodedFixtureDictKey;

// This is a C array
NSString * const kJALPersistentDataDictKeysArray[] = {
    @"kJALPersistentDataKeyListItems"
};
int kJALSizeOfPersistentDataDictKeysArray = SIZE_OF(kJALPersistentDataDictKeysArray);

// To use it
/*
 for (int i=0; i < kJALSizeOfPersistentDataDictKeysArray; i++)
 NSLog(@"my constant string is: %@", kJALPersistentDataDictKeysArray[i]);
 */




// General consts
NSString * const kJALPersistentDataKeyListItems =  @"kJALPersistentDataKeyListItems";

