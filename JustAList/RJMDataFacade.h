//
//  RJMDataFacade.h
//  JustAList
//
//  Created by Richard Mayer on 12/05/2011.
//  Copyright 2011 Richard Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RJMDataFacade : NSObject {
    
}

@property (nonatomic, strong) IBOutlet NSDictionary* classMap;

+ (RJMDataFacade*)sharedInstance;

@end
