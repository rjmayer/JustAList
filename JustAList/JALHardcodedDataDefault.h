//
//  JALHardcodedDataDefault.h
//  JustAList
//
//  Created by Richard Mayer on 23/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

/*!
 * JALHardcodedDataDefault is the 'data file' to be read by some utility, to
 * populate a data store.
 *
 * Don't follow? Imagine a .plist file called Default.plist containing exactly
 * the same data as would be retrieved from this class. It's the equivilant.
 * The .plist would be read by some plist reading utility. This class is read
 * by some "Hardcoded Data" reading utility. Both are implementations of the
 * <JALDataAquisition> protocol and are used to populate a static data store
 * (not database or web).
 *
 * The main goal/purpose of a class like this is to support the very early 
 * stages of development. Alternatively, a derivative (subclass) of it could be 
 * written and used by application tests, to set their own specific fixture 
 * data.
 *
 * It's unlikely to be used in production code, but nevertheless is not to be 
 * ruled out. It could for e.g. quite viably be used as part of a 'reset' 
 * feature.
 *
 * It forms the basis of the protocol JALDataAquisition, which later could be
 * applied to other forms of data acquisition e.g. as mentined above; plist,
 * xml, json, etc. In this way a Data-Store class could be initialised with a
 * JALUserDataSource implementation and where there data actually comes from
 * remains transparent.
 *
 */

#import <Foundation/Foundation.h>

#import "JALHardcodedDataProtocol.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface Definition
////////////////////////////////////////////////////////////////////////////////

@interface JALHardcodedDataDefault : NSObject <JALHardcodedDataProtocol>
@end
