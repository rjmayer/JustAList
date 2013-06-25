//
//  SCCTestingConstants.h
//  ios-qa-challenge
//
//  Created by Richard Mayer on 20/06/2013.
//  Copyright (c) 2013 Slavko Krucaj. All rights reserved.
//

/*
 * Normally, I would consider putting all these into a .plist, rather than
 * defining them as constants.
 *
 * Flexible way to paramaterise the expected results, also different .plists
 * for different test scenarios.
 */

#import <Foundation/Foundation.h>

// General consts
extern NSString * const kSCTestingAccountUser;
extern NSString * const kSCTestingAccountPass;
extern float const kSCTestingMaxResponseWaitSecs;


// General expected result consts
extern NSUInteger const kSCTestingExpectedNumFollowers;
extern NSUInteger const kSCTestingExpectedNumLikes;

// Class specific expected result consts
extern NSUInteger const kSCTestingFollowersTVCExpectedNumSections;
extern NSUInteger const kSCTestingLikesTVCExpectedNumSections;

