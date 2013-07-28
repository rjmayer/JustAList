//
//  JALHardcodedFixture.h
//  JustAList
//
//  Created by Richard Mayer on 05/07/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JALHardcodedDataConstants.h"

@protocol JALHardcodedDataProtocol <NSObject>

/*!
 * Should return a dictionary of sets; the hardcoded user data.
 */
- (NSDictionary *)userDataDict;

@end
