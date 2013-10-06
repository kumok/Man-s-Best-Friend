//
//  MBFDog.m
//  Man's Best Friend
//
//  Created by Eliot Arntz on 9/17/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import "MBFDog.h"

@implementation MBFDog

// The implementation of each method declared in the header, or .h, file.

-(void)bark
{
    NSLog(@"Woof Woof!");
}

-(void)barkANumberOfTimes:(int)numberOfTimes
{
    for (int bark = 1; bark <= numberOfTimes; bark ++){
        [self bark];
    }
}

-(void)changeBreedToWerewolf
{
    self.breed = @"Werewolf";
}

-(void)barkANumberOfTimes:(int)numberOfTimes loudly:(BOOL)isLoud
{
    if (!isLoud){
        for (int bark = 1; bark <= numberOfTimes; bark ++){
            NSLog(@"yip yip");
        }
    }
    else {
        for (int bark = 1; bark <= numberOfTimes; bark ++){
            NSLog(@"Ruff Ruff!");
        }
    }
}

-(int)ageInDogYearsFromAge:(int)regularAge
{
    int newAge = regularAge * 7;
    return newAge;
}

@end
