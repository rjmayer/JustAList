//
//  PropertyList.h
//  PListStorage
//
//  Created by Gene Backlin on 7/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PlistDataArchivingUtil : NSObject {
	
}

// returns a dictionary object, initialised from a plist named filename 
// (*without* .plist extension)
// uses [NSKeyedUnarchiver unarchiveObjectWithData]
+ (NSDictionary *)dictionaryFromPropertyList:(NSString *)plistName;
//
// NOTE: there is an alternative, also by Backlin, from the UnitTests app
// [NSDictionary dictionaryFromPropertyList]
//
// What's the difference?
// This one uses the NSKeyedUnarchiver (a concrete subclass of NSCoder) to "unarchive" objects
// The other one uses NSPropertyListSerialization to "deserialize"
//
// For more info: http://www.evernote.com/shard/s44/sh/f790b5c2-2ac8-4644-b4e1-27705f6f823e/1d217c16ebd0e1816e14dcb258def9e7


+ (BOOL)writePropertyList:(NSString *)filename 
           fromDictionary:(NSDictionary *)plistDict;

@end
