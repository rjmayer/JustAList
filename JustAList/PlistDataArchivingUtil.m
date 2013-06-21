//
//  PropertyList.m
//  PListStorage
//
//  Created by Gene Backlin on 7/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PlistDataArchivingUtil.h"


@implementation PlistDataArchivingUtil

+ (NSDictionary *)dictionaryFromPropertyList:(NSString *)filename {
	NSDictionary *result = nil;
	
	NSString *fname = [NSString stringWithFormat:@"%@.plist", filename];
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *filePath = [rootPath stringByAppendingPathComponent:fname];
	
	NSData *aData = [NSData dataWithContentsOfFile:filePath];
	if(aData != nil) {
		result = [NSKeyedUnarchiver unarchiveObjectWithData:aData];
	}
	
	return result;
}

+ (BOOL)writePropertyList:(NSString *)filename 
           fromDictionary:(NSDictionary *)plistDict {
	NSString *fname = [NSString stringWithFormat:@"%@.plist", filename];
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *filePath = [rootPath stringByAppendingPathComponent:fname];
	
	NSData *aData = [NSKeyedArchiver archivedDataWithRootObject:plistDict]; 
	
	return [aData writeToFile:filePath atomically:YES];
}

@end
