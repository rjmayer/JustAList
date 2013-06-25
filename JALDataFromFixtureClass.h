//
//  JALDataFromFixtureClass.h
//  JustAList
//
//  Created by Richard Mayer on 22/06/2013.
//  Copyright (c) 2013 Richard Mayer. All rights reserved.
//

/*
 * JustAList (the "product client") has to have knowledge of the data objects used here!
 *
 * JustAList will know that, and so will every JAL(Test)DataFrom... class 
 * because it's defined and documented by the "product" developer, who also
 * implement various API's for getting it.
 *
 * It just so happens that for the case of JAL, I'm both product and client
 * developer! But think of a typical scenario:
 * Developer Foo develops a client for displaying data from the product Bar
 * and Bar has been developed by SoundCloud, Dropbox, Google...
 *
 * THE POINT IS: The Product Reigns Supreme... and then we write a client for it.
 *
 * Just like a web service defines what the data objects look like, so does
 * CoreData, so does a plist, etc and therefore so should a hardcoded data 
 * service.
 *
 * Once I've done it for harcoded and plist, the next step is to generalise into
 * JALDataAcquisition. Whether it works with test or live data is irrelevant.
 * E.g. if it gets it's data from plist, the location and author (e.g. user 
 * (the app) or tester (manual editing, script generated) of the plist is total
 * irrelavent.
 *
 */

#import <Foundation/Foundation.h>

@interface JALDataFromFixtureClass : NSObject

@end
