//
//  Options.m
//  Drill1
//
//  Created by John Waddington on 1/28/12.
//  Copyright (c) 2012 John Waddington. All rights reserved.
//

#import "Options.h"

@implementation Options

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle




- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)viewWillDisappear:(BOOL)animated
{    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:volumeSlider.value forKey:@"slider"];
    [defaults synchronize];
    

    
    NSUserDefaults *pronunciation = [NSUserDefaults standardUserDefaults];
    [pronunciation setInteger:pronunciationSelector.selectedSegmentIndex forKey:@"pronunciation"];
    [pronunciation synchronize];
}

-(void)viewDidLoad{
    
    
    volumeSlider.value = [[NSUserDefaults standardUserDefaults] floatForKey:@"slider"];
    pronunciationSelector.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"pronunciation"];
}

-(IBAction)done{
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissModalViewControllerAnimated:YES];
}


@end
