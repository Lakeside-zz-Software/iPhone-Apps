//
//  ViewController.m
//  FlashTiles
//
//  Created by John Waddington on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"




@implementation LettersA


#pragma mark - View lifecycle



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [slidingHand setImage:nil];
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"1"]; 
    [pronunciationFlag setImage:[audio playAudio]];
    [self performSelector:@selector(handSlide) withObject:nil afterDelay:1.1];
    
    
}


- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"1"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    
}

-(void)handSlide{
    
    slidyHand = [UIImage imageNamed: @"slidinghand.png"];
    [slidingHand setImage:slidyHand];
    
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(stopAnimating)];
    [UIView setAnimationRepeatCount:4];
    [slidingHand setTransform:CGAffineTransformMakeScale(1.2, 1.2)];
    [slidingHand setTransform:CGAffineTransformIdentity];
    [UIView commitAnimations];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}

@end






@implementation LettersB

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"2"]; 
    [pronunciationFlag setImage:[audio playAudio]];
    
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"2"]; 
    [audio playAudio];
    
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersC

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"3"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"3"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersD

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"4"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"4"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersE

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"5"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"5"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersF

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"6"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"6"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersG

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"7"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"7"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersH

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"8"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"8"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersI

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"9"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"9"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersJ

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"10"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"10"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersK

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"11"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"11"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersL

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"12"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"12"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersM

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"13"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"13"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersN

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"14"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"14"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersO

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"15"]; 
    [pronunciationFlag setImage:[audio playAudio]];
    [letterTile setImage:[audio varTile]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"15"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersP

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"16"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"16"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersQ

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"17"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"17"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersR

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"18"]; 
    [pronunciationFlag setImage:[audio playAudio]];
    [letterTile setImage:[audio varTile]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"18"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersS

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"19"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"19"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersT

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"20"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"20"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersU

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"21"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"21"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersV

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"22"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"22"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersW

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"23"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"23"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersX

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"24"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"24"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersY

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"25"]; 
    [pronunciationFlag setImage:[audio playAudio]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"25"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}


@end

@implementation LettersZ

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"26"]; 
    [pronunciationFlag setImage:[audio playAudio]];
    [letterTile setImage:[audio varTile]];
}

- (IBAction)repeatButton:(id)sender{
    
    audio = [[FlashcardAudio alloc] init];
    [audio setNumber:@"26"]; 
    [audio playAudio];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}    
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}



@end
