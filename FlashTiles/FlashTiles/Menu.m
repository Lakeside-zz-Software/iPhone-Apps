//
//  Menu.m
//  Drill1
//
//  Created by John Waddington on 1/28/12.
//  Copyright (c) 2012 John Waddington. All rights reserved.
//

#import "Menu.h"
#import "SHKTwitter.h"



@implementation Menu

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


- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
    [super viewWillAppear:animated];
    [self dismissViewControllerAnimated:YES completion:nil];


}


- (IBAction)website:(id)sender{
    NSString *urlString = [NSString stringWithFormat:@"http://www.lakesidesoftware.co.uk"];
    NSURL *url = [NSURL URLWithString:urlString];
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)share:(id)sender{
    NSString *urlImage = @"http://fbcdn-photos-a.akamaihd.net/photos-ak-snc1/v85006/83/392138684133419/app_1_392138684133419_5936.gif";
    NSURL *url = [NSURL URLWithString:@"http://www.facebook.com/FlashTiles"];
    SHKItem *item = [SHKItem URL:url title:@"Check out FlashTiles, the new iPod/iPhone app to learn and practice the English alphabet!"];
    
    UIImage *image = [UIImage imageNamed:@"icon@2x.png"];
    [item setCustomValue:urlImage forKey:@"picture"];    
    item.image = image;
    
    

    
    
    

    
    SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
  
    item.shareType = SHKShareTypeURL;
    
    [SHK flushOfflineQueue];
    
    [actionSheet showFromToolbar:self.navigationController.toolbar];
    
    
    
    
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Like This App? Tell A Friend!" delegate:self cancelButtonTitle:@"Maybe Later" destructiveButtonTitle:nil otherButtonTitles:@"Send Email", @"Post on Twitter", @"Share on Facebook", nil];
//    [actionSheet showInView:self.view];
                                  
}

@end


