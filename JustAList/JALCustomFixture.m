//
//  JALDefaultUserData.m
//  JustAList
//
//  Created by Richard Mayer on 23/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JALHardcodedFixture.h"

@interface JALCustomFixture : JALHardcodedFixture
- (id)initWithCustomFixture:(NSDictionary*)fixture;
@end

@implementation JALCustomFixture
- (id)initWithCustomFixture:(NSDictionary*)fixture
{
    // TODO: implement me, when the time comes
//    _listItems = [NSSet setWithSet:[fixture listItems]];
    return [super init];
}
@end
