//
//  JALAppDataStorageMock.m
//  JustAList
//
//  Created by Richard Mayer on 13/10/11.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

#import "JALAppDataStorageMock.h"


@implementation JALAppDataStorageMock

#pragma mark - JALAppDataStorageDelegate

// === Data Retrieval

/* returns the same data as JALAppDataMock in it's init.
 * thus, real AppData & mock AppDataStorage is same as mock AppData
 */
- (NSMutableDictionary*)appDocumentData
{return [NSMutableDictionary dictionary];}

- (NSMutableDictionary*)appCacheData
{return [NSMutableDictionary dictionary];}

- (NSMutableDictionary*)appTmpData
{return [NSMutableDictionary dictionary];}


// === Data Writing
- (void)setAppDocumentData:(NSDictionary*)dataDict
{}

- (void)setAppCacheData:(NSDictionary*)dataDict
{}

- (void)setAppTmpData:(NSDictionary*)dataDict
{}

@end
