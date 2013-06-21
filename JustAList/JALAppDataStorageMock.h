//
//  JALAppDataStorageMock.h
//  JustAList
//
//  Created by Richard Mayer on 13/10/11.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RJMPersistentDataServiceForFileProtocol.h"

//FIXME JALAppDataStorageMock is either wrongly named or shouldn't be implementing RJMPersistentDataServiceForFileProtocol
@interface JALAppDataStorageMock : NSObject <RJMPersistentDataServiceForFileProtocol> {
    
}

@end
