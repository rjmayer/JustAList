//
//  JALConstants.h
//  JustAList
//
//  Created by Richard Mayer on 11/05/2011.
//  Copyright 2011 Richard Mayer. All rights reserved.
//


#pragma mark Configuration

// TODO: LO: make this dependant on some preprocessor macro (which in turn depends on build settings)
#define __kRJM_ClassMapName @"ClassMap"



#pragma mark Constants

#define kRJM_ClassMapFilepath [[NSBundle mainBundle] pathForResource:__kRJM_ClassMapName ofType:@"plist"]