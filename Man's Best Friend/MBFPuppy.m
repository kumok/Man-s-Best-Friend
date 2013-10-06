//
//  MBFPuppy.m
//  Man's Best Friend
//
//  Created by Eliot Arntz on 9/22/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import "MBFPuppy.h"

@implementation MBFPuppy

-(void)givePuppyEyes
{
    NSLog(@":(");
}

// Implementing the method declared in our superclass (MBFDog)
-(void)bark
{
    [super bark];
    NSLog(@"whimper whimper");
    [self givePuppyEyes];
}

@end
