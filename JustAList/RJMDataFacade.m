//
//  RJMDataFacade.m
//  JustAList
//
//  Created by Richard Mayer on 12/05/2011.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

#import "RJMDataFacade.h"


@implementation RJMDataFacade

static RJMDataFacade *sharedInstance = nil;

@synthesize classMap;

#pragma mark -
#pragma mark Class Instance methods



#pragma mark -
#pragma mark Singleton methods

+ (RJMDataFacade*)sharedInstance
{
    // @synchronized() makes it thread safe
	@synchronized(self)
    {
        if (sharedInstance == nil)
            sharedInstance = [[RJMDataFacade alloc] init];
    }
    return sharedInstance;
}

// Prevents multiple instanciation
+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;  // assignment and return on first allocation
        }
    }
    return nil; // on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain {
    return self;
}

- (NSUInteger)retainCount {
    return UINT_MAX;  // denotes an object that cannot be released
}

- (void)release {
    //do nothing
}

- (id)autorelease {
    return self;
}

@end