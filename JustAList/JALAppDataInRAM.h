//
//  JALAppData.h
//  JustAList
//
//  Created by Richard Mayer on 10/10/11.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JALAppData.h"

@interface JALAppDataInRAM : NSObject <JALAppData> {
    
}

//TODO: in order to fulfill the interface requirement - (void)unpersistAppData;
// we'll demand to be init with a RJMPersistentDataStorageServiceForFile
// On init (or first time data required) we call appDocumentData in order to
// populate our own private prop(s)
//
// That renders the following redundant
//
/* Save the supplied data for later retrieval.
 *
 * @param dataDict typically represents an unarchived object graph. It may be
 * assumed that the keys of the dictionary correspond to known (expected)
 * strings; namely those also used when supplying persistentData. If unexpected
 * strings are encountered, it's recommended to raise an exception.
 *
 * @param category can be used to identify the inteded persistent storage
 * location of data and supply an appropriate persistentData dictionary on
 * request.
- (void)setDataFromPersistentDataRoot:(NSDictionary*)dataDict 
                           ofCategory:(JALPersistentDataCategory)category;
 */
//
// Whats important to remember at that point is that the protocol forces us
// to consiously do something about persistent data (even if nothing!) but in a
// way that remains generic. So, we read it from a plist, another class inits
// CoreData, another one might just contain hardcoded data, or itself call out 
// to some delegate, already init with test data.
//
// So JALAppData really is your one stop interface to the model layer.
//
// Without the 2 persist methods you'd either have an incomplete contract
// would be perfectly valid to write a class which *unintentionally* never gets 
// init with data.
//
// On the other hand trying to define protocols for objects required to init
// with also doesn't work, since too many use cases to consider.


//TODO: in order to fulfill the interface requirement - (void)unpersistAppData;
// we'll call setAppDocumentData also on RJMPersistentDataStorageServiceForFile
//
// Which removes the need for this:
//
/* Should supply a dictionary of persistable data. Typically, the dictionary
 * returned would be forwarded to (or have been requested from) some persistent 
 * storage service.
 *
 * @param category implies the intended storage location. 
 * E.g. JALAppDataCategoryDocuments requests data suitable for storage in
 * the application's Documents folder (think iCloud!)
 *
 * @return NSDictionary*
- (NSDictionary*)getPersistentData:(JALPersistentDataCategory)category;
 */

@end
