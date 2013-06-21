//
//  PropertyList.h
//  UnitTests
//
//  Created by Gene Backlin on 6/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (PropertyList)

// returns a dictionary object, initialised from a plist specified by filename 
// (with or without .plist extension)
//
// uses [NSPropertyListSerialization propertyListFromData:...]
+ (NSDictionary *)dictionaryFromPropertyList:(NSString *)filename;

@end
