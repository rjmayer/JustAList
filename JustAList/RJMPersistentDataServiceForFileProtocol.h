//
//  RJMPersistentDataServiceForFileProtocol.h
//  RJM Library
//
//  Created by Richard Mayer on 12/10/11.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>


/* Defines the PDS interface for reading data from file.
 *
 * This is intentionally decoupled from the file-writing protocol to
 * facilitate unit testing. E.g. read data from file, write to mock to test
 * the results, or reverse.
 */
@protocol RJMPersistentDataServiceFileReadDelegate <NSObject>
/* Retrieve the default application data context, from documents folder
 */
- (NSDictionary*)readObjectGraphFromFile:(NSString*)filename
                                inFolder:(NSString*)foldername;
@end


/* Defines the PDS interface for writing data to file.
 *
 * This is intentionally decoupled from the file-reading protocol to
 * facilitate unit testing. E.g. read data from mock, write to file or
 * reverse.
 */
@protocol RJMPersistentDataServiceFileWriteDelegate <NSObject>
/* Save data to Documents folder (iCloud backup, iTunes sharing)
 */
- (void)writeObjectGraph:(NSDictionary*)dataDict
                  toFile:(NSString*)filename
                inFolder:(NSString*)foldername;
@end


/* Defines the combined PDS interface requirements for reading/writing
 * pdata to/from file.
 */
@protocol RJMPersistentDataServiceForFileProtocol <NSObject>

- (id)initWithFileReader:(id<RJMPersistentDataServiceFileReadDelegate>)fileReader
              fileWriter:(id<RJMPersistentDataServiceFileWriteDelegate>)fileWriter;

/* Retrieve the default application data context, from documents folder.
 * E.g. using the fileReader supplied on init
 */
- (NSDictionary*)readDefaultApplicationDataContext;

/* Save data to Documents folder (iCloud backup, iTunes sharing)
 * E.g. using the fileWriter supplied on init
 */
- (void)writeDefaultApplicationDataContext:(NSDictionary*)dataDict;

@end