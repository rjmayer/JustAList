//
//  JALDefaultUserData.m
//  JustAList
//
//  Created by Richard Mayer on 23/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JALDefaultUserData.h"

@interface JALCustomUserData : JALDefaultUserData
- (id)initWithCustomFixture:(NSDictionary*)fixture;
@end

@implementation JALCustomUserData
- (id)initWithCustomFixture:(NSDictionary*)fixture
{
    // TODO: implement me, when the time comes
//    _listItems = [NSSet setWithSet:[fixture listItems]];
    return [super init];
}
@end
