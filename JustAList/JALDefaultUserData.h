//
//  JALDefaultUserData.h
//  JustAList
//
//  Created by Richard Mayer on 23/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

/*!
 * Describe the purpose of this class.
 */

#import <Foundation/Foundation.h>

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Protocol Definition
////////////////////////////////////////////////////////////////////////////////

// Protocol to facilitate writing mock implementations
@protocol JALUserDataSource <NSObject>
- (NSDictionary *)userDataDict;
@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface Definition
////////////////////////////////////////////////////////////////////////////////

@interface JALDefaultUserData : NSObject <JALUserDataSource>

/*!
 * Returns a dictionary of sets, which together make up the default user data.
 *
 * Each set is a collection of objects of one and the same class.
 *
 */
@property (nonatomic, retain, readonly) NSDictionary *userDataDict;

@end
