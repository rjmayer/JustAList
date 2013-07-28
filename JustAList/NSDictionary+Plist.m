//
//  PropertyList.m
//  UnitTests
//
//  Created by Gene Backlin on 6/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSDictionary+Plist.h"


@implementation NSDictionary(PropertyList)

+ (NSDictionary *)dictionaryFromPropertyList:(NSString *)filename {
	NSString *errorDesc = nil; 
	NSPropertyListFormat format; 
	NSString *plistPath = [[NSBundle mainBundle] pathForResource:filename ofType:@"plist"]; 
	NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath]; 
	NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization 
										  propertyListFromData:plistXML 
										  mutabilityOption:NSPropertyListMutableContainersAndLeaves 
										  format:&format errorDescription:&errorDesc]; 
	if (!temp) { 
		NSLog(@"%@", errorDesc); 
	}
	
	return temp;
}

@end
