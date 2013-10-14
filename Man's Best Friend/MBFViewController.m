//
//  MBFViewController.m
//  Man's Best Friend
//
//  Created by Eliot Arntz on 9/17/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import "MBFViewController.h"
#import "MBFDog.h"// Importing our MBFDog header file so that our ViewController knows about it
#import "MBFPuppy.h"

@interface MBFViewController ()

@end

@implementation MBFViewController

// A method that is automatically callled when the this ViewController's view loads, but has not appeared on screen yet
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // How to create, or instantiate an object
    MBFDog *myDog = [[MBFDog alloc] init];
    
    // We are not setting the properties of our dog
    // This takes a generic dog from our Dog class and makes it more specific
    myDog.name = @"Nana";
    myDog.breed = @"St. Bernard";
    myDog.age = 1;
    myDog.image = [UIImage imageNamed:@"St.Bernard.JPG"];
    
    // We are now checking to see if the dog's properties were set
    // Run the program and look at the debug console to see your dog
    NSLog(@"My Dog is %@ and he is a %i year old %@!", myDog.name, myDog.age, myDog.breed);
    
    // Setting our User Interface elements to match the properties on myDog
    self.myImageView.image = myDog.image;
    self.nameLabel.text = myDog.name;
    self.breedLabel.text = myDog.breed;
    
    // Setting our currentIndex to 0 (used for the challenge)
    self.currentIndex = 0;
    
    // The creation of three more dogs
    MBFDog *secondDog = [[MBFDog alloc] init];
    secondDog.name = @"Wishbone";
    secondDog.breed = @"Jack Russell Terrier";
    secondDog.image = [UIImage imageNamed:@"JRT.jpg"];
    
    MBFDog *thirdDog = [[MBFDog alloc] init];
    thirdDog.name = @"Lassie";
    thirdDog.breed = @"Collie";
    thirdDog.image = [UIImage imageNamed:@"BorderCollie.jpg"];
    
    MBFDog *fourthDog = [[MBFDog alloc] init];
    fourthDog.name = @"Angel";
    fourthDog.breed = @"Greyhound";
    fourthDog.image = [UIImage imageNamed:@"ItalianGreyhound.jpg"];
    
    self.myDogs = [[NSMutableArray alloc] init];
    [self.myDogs addObject:myDog];
    [self.myDogs addObject:secondDog];
    [self.myDogs addObject:thirdDog];
    [self.myDogs addObject:fourthDog];
    
    // The creation of a puppy, which is a subclass of a dog
    // Notice that a puppy can be used whenever a dog is used since a puppy is a dog.  However, the reverse
    MBFPuppy *littlePuppy = [[MBFPuppy alloc] init];
    [littlePuppy bark];
    littlePuppy.name = @"Bo O";
    littlePuppy.breed = @"Portuguese Water Dog";
    littlePuppy.image = [UIImage imageNamed:@"Bo.jpg"];
    
    // Demonstartion of a method call on a puppy
    // Notice that [myDog givePuppyEyes]; would raise an error as not all dogs are puppies
    // and can givePuppyEyes
    [littlePuppy givePuppyEyes];
    
    // Adding the puppy to our array of dogs.
    [self.myDogs addObject:littlePuppy];
}

// This is included by Apple and is called whenever there is a memory warning
// We do not need to "implement" it or write any code here
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)printHelloWorld
{
    NSLog(@"Hello world");
}

// The code that is executed when our barButtonItem is pressed.
- (IBAction)newDogBarButtonItemPressed:(UIBarButtonItem *)sender
{
    int numberOfDogs = [self.myDogs count];
    int randomIndex = arc4random() % numberOfDogs; // Finds a random number between 0 and our numberOfDogs - 1.  In our case either 0, 1, 2, 3, 4
    
    // First test if the currendIndex equals the randomIndex and if the currentIndex is 0.
    if (self.currentIndex == randomIndex && self.currentIndex == 0){
        randomIndex ++;
    }
    // Next test if the current index equals the random index.
    else if (self.currentIndex == randomIndex){
        randomIndex --;
    }
    
    /* Update your current index to the new random index */
    self.currentIndex = randomIndex;
    
    MBFDog *randomDog = [self.myDogs objectAtIndex:randomIndex];// Gets a randomDog from our arrayOfDogs
    
    // Set our UI elements to match the randomDog's properties
    // This is either done reguarly below or through animation!
    
    // REGULAR
    
    //    self.myImageView.image = randomDog.image;
    //    self.breedLabel.text = randomDog.breed;
    //    self.nameLabel.text = randomDog.name;
    
    [UIView transitionWithView:self.view duration:2.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.myImageView.image = randomDog.image;
        self.breedLabel.text = randomDog.breed;
        self.nameLabel.text = randomDog.name;
    } completion:^(BOOL finished) {
        
    }];
    
    // Changing the title on our UIBarButtonItem
    sender.title = @"And Another";
}

@end
