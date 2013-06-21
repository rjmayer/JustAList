//
//  JALItem.h
//  JustAList
//
//  Created by Richard Mayer on 10/05/2011.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JALListItem : NSObject {
    
}

@property NSUInteger identifier;
@property (nonatomic, retain) NSString *title;
@property BOOL isTicked;
@property BOOL isStarred;

@end
