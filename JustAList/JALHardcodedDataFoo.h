//
//  JALHardcodedDataFoo.h
//  JustAList
//
//  Created by Richard Mayer on 05/07/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

/*!
 * JALHardcodedDataFoo is another serial data source. Just another variation 
 * on JALHardcodedDataDefault or JALHardcodedDataFoo, implementing the 
 * JALHardcodedData protocol.
 *
 */

#import <Foundation/Foundation.h>

#import "JALHardcodedDataProtocol.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface Definition
////////////////////////////////////////////////////////////////////////////////

@interface JALHardcodedDataFoo : NSObject <JALHardcodedDataProtocol>

@end
