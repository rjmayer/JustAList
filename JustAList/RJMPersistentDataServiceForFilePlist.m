//
//  RJMPersistentDataServiceForFilePlist.m
//  JustAList
//
//  Created by Richard Mayer on 12/11/2011.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

// TODO: can't write tests without class/method descriptions ;-)

// TODO: confugurable base folder
// - int's NSDocumentDirectory by default
// - add initWithFolderPath to allow better testing
// - or just write out the file direct from test case?!?

// TODO: custom filename
// - concept of defaultAppData (comes for free) + customUserData: (specify
//   filename
// - for now, it's all to documents folder, but makes sense to want to specify name

// TODO: RJMData as paralell replacement for CoreData. 
// - Instead of "file.db", "file.plist"
// - Other concepts the same

#import "RJMPersistentDataServiceForFilePlist.h"
#import "PlistDataArchivingUtil.h"

// System paths
#define kDocumentsDirectoryPath [[[[[[NSFileManager alloc] init] autorelease] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] path]

// Custom filename (for now it's hardcoded, in the fure maybe passed on init)
#define kPersitentDataDocumentsFilename @"UserData"

#define kPersistentDataFilePath [kDocumentsDirectoryPath stringByAppendingPathComponent:kPersitentDataDocumentsFilename]
#define kPersistentDataFilePathWithExtension [[kDocumentsDirectoryPath stringByAppendingPathComponent:kPersitentDataDocumentsFilename] stringByAppendingPathExtension:@"plist"]

@implementation RJMPersistentDataServiceForFilePlist

#pragma mark - RJMPersistentDataServiceFileReaderProtocol implementation

- (NSDictionary*)readDefaultApplicationDataContext 
{
    // FIXME: no; this goes into the delegate instead
    // - I also need to fix PlistDataArchivingUtil so that it takes filename and
    //   folder as args
    return [NSDictionary dictionaryWithDictionary:[PlistDataArchivingUtil dictionaryFromPropertyList:kPersistentDataFilePath]];
}

#pragma mark - RJMPersistentDataServiceFileWriterProtocol implementation

- (void)writeDefaultApplicationDataContext:(NSDictionary *)dataDict
{
    // FIXME: no; this goes into the delegate instead
    // - I also need to fix PlistDataArchivingUtil so that it takes filename and
    //   folder as args
    [PlistDataArchivingUtil writePropertyList:kPersistentDataFilePath
                               fromDictionary:dataDict];
}

@end
