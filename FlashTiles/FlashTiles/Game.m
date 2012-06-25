//
//  Game.m
//  Drill1
//
//  Created by John Waddington on 1/27/12.
//  Copyright (c) 2012 John Waddington. All rights reserved.
//

#import "Game.h"

@implementation Game

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



#pragma mark - View lifecycle



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    isAnimating = YES;
    exiting = NO;

    
    //load previous scores
    
    finalScoresSel = [[NSUserDefaults standardUserDefaults] objectForKey:@"finalscores"];
    contentArray = [[NSMutableArray alloc] initWithArray:finalScoresSel];

    
    
    //load previous occurances
    
    finalOccuranceSel = [[NSUserDefaults standardUserDefaults] objectForKey:@"finaloccurance"];
    occuranceArray = [[NSMutableArray alloc] initWithArray:finalOccuranceSel];
    
    finalAccuracySel = [[NSUserDefaults standardUserDefaults] objectForKey:@"finalaccuracy"];
    accuracyArray = [[NSMutableArray alloc] initWithArray:finalAccuracySel];
    
    
    

    
    
    
    if (accuracyArray.count == 0){
        
        for (NSInteger i=0; i<=25; i++){
            [accuracyArray addObject:[NSNumber numberWithInt:0]];
        }
    }
    
    if (occuranceArray.count == 0){
        
        for (NSInteger i=0; i<=25; i++){
            [occuranceArray addObject:[NSNumber numberWithInt:0]];
        }
    }
    
    
    
    

    
    [self createTiles];
}



-(void) countUp
{   if (finalTap == NO){
    timeInt +=1;
}
}

-(void) counterTimer
{
    timeInt = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countUp) userInfo:nil repeats:YES];
    
}

-(void) createTiles
{
    
    
    //create the array to hold the tiles
    tiles = [[NSMutableArray alloc] initWithCapacity:26];
    //insert tiles
    for (int i=1; i<=26; i++) {
        [tiles addObject:[NSNumber numberWithInt:i]];
    }
    //call method to add tiles to the current view
    [self addTilesToView];
    
    
    
    if (contentArray.count == 0) {
        
        popUp = [[UIAlertView alloc] initWithTitle:@"Concentration!" message:[NSString stringWithString:NSLocalizedString(@"GamePopUpMessage", nil)] delegate:self cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"GamePopUpButton", nil), nil];
        //launch the alert
        [popUp show];
    }else{
        tappedView = nil;
        finalTap = NO;
        correctTaps = 0.0;
        [self performSelector:@selector(shuffleTiles) withObject:nil
                   afterDelay:0.5]; 

        [self performSelector:@selector(createAudio) withObject:nil
                   afterDelay:1.0]; 

    }
    
    
}

// this method controlls ALL alert windows
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        if (contentArray.count == 0) {
            tappedView = nil;
            finalTap = NO;
            correctTaps = 0.0;
            [self shuffleTiles];
            [self performSelector:@selector(createAudio) withObject:nil
                       afterDelay:2.0];
            
        }else{
            
            if (popUp.title == [NSString stringWithString:NSLocalizedString(@"ResultPopUpTitle", nil)]){
                
                tappedView = nil;
                finalTap = NO;
                correctTaps = 0.0;
                [self appRatingChecker];
                if (rating == YES){
                    rating = NO;
                    popUp = [[UIAlertView alloc] initWithTitle: [NSString stringWithString:NSLocalizedString(@"RatingPopUpTitle", nil)] message:[NSString stringWithString:NSLocalizedString(@"RatingPopUpMessage", nil)] delegate:self cancelButtonTitle:[NSString stringWithString:NSLocalizedString(@"RatingPopUpCancelButton", nil)] otherButtonTitles:[NSString stringWithString:NSLocalizedString(@"RatingPopUpOtherButton", nil)], nil];
                    
                    [popUp show];
                    return;
                }else {
                    [self shuffleTiles];
                    [self performSelector:@selector(createAudio) withObject:nil
                               afterDelay:1.4];
                }
                
            }
            
            if(popUp.title == [NSString stringWithString:NSLocalizedString(@"RatingPopUpTitle", nil)] && exiting != YES){
                [self shuffleTiles];
                [self performSelector:@selector(createAudio) withObject:nil
                           afterDelay:1.4];
                
            }
            if(popUp.title == [NSString stringWithString:NSLocalizedString(@"RatingPopUpTitle", nil)] && exiting == YES){
                [self.navigationController popViewControllerAnimated:YES];
               
            }
        }
        
    }
    
    if (buttonIndex == 1) {
        
        if (popUp.title == [NSString stringWithString:NSLocalizedString(@"ResultPopUpTitle", nil)]){
            exiting = YES;
            [self appRatingChecker];
            if (rating == YES){
                rating = NO;
                popUp = [[UIAlertView alloc] initWithTitle: [NSString stringWithString:NSLocalizedString(@"RatingPopUpTitle", nil)] message:[NSString stringWithString:NSLocalizedString(@"RatingPopUpMessage", nil)] delegate:self cancelButtonTitle:[NSString stringWithString:NSLocalizedString(@"RatingPopUpCancelButton", nil)] otherButtonTitles:[NSString stringWithString:NSLocalizedString(@"RatingPopUpOtherButton", nil)], nil];
                [popUp show];
                return;
            }else{
                [self.navigationController popViewControllerAnimated:YES];
            }
        }
        
        if (popUp.title == [NSString stringWithString:NSLocalizedString(@"RatingPopUpTitle", nil)]){
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"appRated"];
            
            [[NSUserDefaults standardUserDefaults] synchronize];
            appRatingConcluded = [[NSUserDefaults standardUserDefaults] boolForKey:@"appRated"];
            [self.navigationController popViewControllerAnimated:YES]; 
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.apple.com/us/app/flashtiles/id515902357?ls=1&mt=8"]];
            
            
        }else {
            [self.navigationController popViewControllerAnimated:YES];
    
        }
        
    }
    
}

-(void) addTilesToView
{
    
    CGRect tileFrame;
    CGRect tileOrigin = CGRectMake(0,0, 55, 55);
    
    tileFrame.size = CGSizeMake(55, 55);
    CGPoint origin;
    int tileIndex = 0;
    
    
    for (int i=0; i<7; i++) {
        
        
        if (i==6){
            for (int j=1; j<3; j++) {
                
                
                origin.y = (i*55) + 52;
                origin.x = (j*65) + 26;
                
                
                
                
                tileFrame.origin = origin;
                
                // Create the tile at the origin
                tile[tileIndex] = [[TileImageView alloc] initWithFrame:tileOrigin 
                                                                 value:[[tiles objectAtIndex:tileIndex] intValue]];
                
                // Configure gesture recognizer
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] 
                                               initWithTarget:self 
                                               action:@selector(handletap:)];

                    
                tap.numberOfTapsRequired = 1;
                
                
                [tile[tileIndex] addGestureRecognizer:tap];
                
                [self.view addSubview:tile[tileIndex]];
                
                // Put the tiles in the correct position.
                tile[tileIndex].frame = tileFrame;
                tileIndex++;
            }
        }
        else{
            
            for (int j=0; j<4; j++) {
                origin.y = (i*55) + 52;
                origin.x = (j*65) + 26;
                tileFrame.origin = origin;
                
                // Create the tile at the origin
                tile[tileIndex] = [[TileImageView alloc] initWithFrame:tileOrigin 
                                                                 value:[[tiles objectAtIndex:tileIndex] intValue]];
                
                // Configure gesture recognizer
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] 
                                               initWithTarget:self 
                                               action:@selector(handletap:)];
                
                

                    tap.numberOfTapsRequired = 1;
                
                
                //add gesture recognisers to each tile
                [tile[tileIndex] addGestureRecognizer:tap];
                
                //add tiles to viewController
                [self.view addSubview:tile[tileIndex]];
                
                
                // Put the tiles in the correct position.
                tile[tileIndex].frame = tileFrame;
                tileIndex++;
            }
        }
        
    }
    
    
}

- (void)createAudio
{
    //define total number elements in array
    totalElementsInAudioArray = 10;
    
    //define array
    audioArray = [[NSMutableArray alloc] initWithCapacity:totalElementsInAudioArray];
    for (int i=1; i<=totalElementsInAudioArray; i++) {
        [audioArray addObject:[NSNumber numberWithInt:(arc4random() % ([tiles count])) + 1]];
        
        
        //disallow consecutive repetitions of the same letter
        if (i>1) {
            
            while([[audioArray objectAtIndex:i-1] isEqual:[audioArray objectAtIndex:i-2]]){
                
                [audioArray replaceObjectAtIndex:i-1 withObject:[NSNumber numberWithInt:(arc4random() % ([tiles count])) + 1]];
                
            }
            
        }
        
    }
    audioArrayElement = 0;
    [self handleAudio];
    [self counterTimer];
    
}


- (void)handleAudio
{       
    while (audioArrayElement < totalElementsInAudioArray) {
        letterNumber = [audioArray objectAtIndex:audioArrayElement];
        pronunSel = [[NSUserDefaults standardUserDefaults] integerForKey:@"pronunciation"];
        
        switch (pronunSel) {
            case 0:
                soundFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                    pathForResource:[NSString stringWithFormat:@"Br_Audio_%@", letterNumber] ofType:@"mp3"]];
                    [pronunciationFlag setImage:[UIImage imageNamed:@"UnitedKingdom_GB_GBR_826_Flag3.png"]];
                break;
                
            case 1:
                soundFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                    pathForResource:[NSString stringWithFormat:@"Am_Audio_%@", letterNumber] ofType:@"mp3"]];
                    [pronunciationFlag setImage:[UIImage imageNamed:@"UnitedStates_US_USA_840_Flag3.png"]];
                break;
        }
        
        sound = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFile error:nil];
        sound.volume = [[NSUserDefaults standardUserDefaults] floatForKey:@"slider"];
        [sound play];
        audioArrayElement++;
        
        
        int x = [[occuranceArray objectAtIndex:([letterNumber intValue]-1)] intValue];
        
        [occuranceArray replaceObjectAtIndex:([letterNumber intValue] - 1) withObject:[NSNumber numberWithInt:(x + 1)]];
        
        isAnimating = NO;
        return;
        
        
    }
    
}

- (void)handletap:(UIGestureRecognizer*) gestureRecognizer
{           if (isAnimating){   
    return;
}
    if (audioArrayElement == totalElementsInAudioArray){
        finalTap = YES;
    }
    
    TileImageView *tappedTile = (TileImageView*) gestureRecognizer.view;
    
    
    // Set the view containing the tile as the tapped tile 
    tappedView = tappedTile;
    
    
    
    
    
    
    
    
    
    
    if (tappedView.value == [letterNumber intValue])
    {
        //player found a match
        isAnimating = YES;
        correctTaps +=1.0;
        
        
        int x = [[accuracyArray objectAtIndex:([letterNumber intValue]-1)] intValue];
        
        [accuracyArray replaceObjectAtIndex:([letterNumber intValue] - 1) withObject:[NSNumber numberWithInt:(x + 1)]];
        
        
        
        
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:tappedTile cache:YES];
        [tappedTile flipTileTick];
        [UIView setAnimationDuration:0.5];
        [UIView commitAnimations];
        
        [self performSelector:@selector(flipTiles) withObject:nil
                   afterDelay:1];         
        
    }  
    else{
        isAnimating = YES;
        
        
        //set the tile that should have been tapped
        correctTile = tile[([letterNumber integerValue] - 1)];
        [self.view bringSubviewToFront:correctTile];
        //call flash solution method
        [self flashSolution:nil finished:nil context:nil];          
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:tappedTile cache:YES];
        [tappedTile flipTileCross];
        [UIView setAnimationDuration:0.5];
        [UIView commitAnimations];
        
        
        // call method to flip tile back over
        [self performSelector:@selector(flipTiles) withObject:nil
                   afterDelay:1];         
        
    }
    if (finalTap == YES) {
        
        //lets us know we can begin shuffling the tiles hereafter
        
        
        
        finalPercentage = (correctTaps/audioArray.count)*100;
        //this gives final score,; the constants are 100% bonus and mother-tongue co-efficient
        if (finalPercentage == 100){
            finalScoreInt =
            10 + ((finalPercentage/timeInt) * (3.7 * totalElementsInAudioArray));
        }
        else{
            
            
            
            finalScoreInt =
            (finalPercentage/timeInt) * (2.7 * totalElementsInAudioArray);
            
        }
        
        // Add some initial data
        
        NSUInteger i = [contentArray count];
        
        if (i>=1){
            id x = [NSNumber numberWithInteger:(i + 1)];
            id y = [NSNumber numberWithInteger:finalScoreInt];    
            
            [contentArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x, @"x", y, @"y", nil]];
        }else{
            id x = [NSNumber numberWithInteger:1];
            id y = [NSNumber numberWithInteger:finalScoreInt];    
            
            [contentArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x, @"x", y, @"y", nil]];
        }
        
        
        percentageArray = [[NSMutableArray alloc] init];
        
        for (int j=0; j<= 25; j++){
            
            int asciiCode;
            asciiCode = j;
            
            
            id letter = [NSNumber numberWithInteger:(asciiCode)];
            
            
            if ([[occuranceArray objectAtIndex:j] intValue] !=0) {
                
                
                id percentage = [NSNumber numberWithInteger:([[accuracyArray objectAtIndex:j] floatValue] / [[occuranceArray objectAtIndex:j] floatValue]) *100];
                [percentageArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:letter, @"letter", percentage, @"percentage", nil]];
            }else{
                
                id percentage = 0;
                [percentageArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:letter, @"letter", percentage, @"percentage", nil]];
            }
            
            
            
        }
        
        
        NSUserDefaults *finalSel = [NSUserDefaults standardUserDefaults];
        
        [finalSel setObject:contentArray forKey:@"finalscores"];
        [finalSel synchronize];
        
        NSUserDefaults *occuranceSel = [NSUserDefaults standardUserDefaults];
        
        [occuranceSel setObject:occuranceArray forKey:@"finaloccurance"];
        [occuranceSel synchronize];
        
        NSUserDefaults *accuracySel = [NSUserDefaults standardUserDefaults];
        
        [accuracySel setObject:accuracyArray forKey:@"finalaccuracy"];
        [accuracySel synchronize];
        
        NSUserDefaults *percentageSel = [NSUserDefaults standardUserDefaults];
        
        [percentageSel setObject:percentageArray forKey:@"finalpercentage"];
        [percentageSel synchronize];
        
        
        
        [self performSelector:@selector(setScore) withObject:nil afterDelay:1.5];
        [timer invalidate];
    }
}

- (void) flashSolution:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(stopAnimating)];
    [UIView setAnimationRepeatCount:3];
    [correctTile setTransform:CGAffineTransformMakeScale(1.4, 1.4)];
    [correctTile setTransform:CGAffineTransformIdentity];
    [UIView commitAnimations];
}



-(void) setScore
{   
    //set tally of number correct as integer
    tallyScore = (int) correctTaps;
    
    //set final score 
    finalScoreAsString = [NSString stringWithFormat:@"%d", finalScoreInt];
    
    
    
    
    
    
    
    
    //create popup alert giving result
    popUp = [[UIAlertView alloc] initWithTitle:[NSString stringWithString:NSLocalizedString(@"ResultPopUpTitle", nil)]message:[NSString stringWithFormat:@"\n\n\n\n\n\n"] delegate:self cancelButtonTitle:[NSString stringWithString:NSLocalizedString(@"ResultPopUpCancelButton", nil)] otherButtonTitles:[NSString stringWithString:NSLocalizedString(@"ResultPopUpOtherButton", nil)], nil];
    
    //tick
    UILabel *tick = [[UILabel alloc] initWithFrame:CGRectMake(35,30,50,50)];
    tick.font = [UIFont fontWithName:@"Arial Unicode MS" size:44];
    tick.textColor = [UIColor greenColor];
    tick.backgroundColor = [UIColor clearColor];
    tick.shadowColor = [UIColor blackColor];
    tick.shadowOffset = CGSizeMake(0,-1);
    tick.lineBreakMode = UILineBreakModeWordWrap;
    tick.numberOfLines = 1;
    tick.textAlignment = UITextAlignmentCenter;
    tick.text = [NSString stringWithUTF8String:"\u2713"];
    [popUp addSubview:tick];
    
    //tickText
    UILabel *tickText = [[UILabel alloc] initWithFrame:CGRectMake(65,30,70,50)];
    tickText.font = [UIFont systemFontOfSize:28];
    tickText.textColor = [UIColor whiteColor];
    tickText.backgroundColor = [UIColor clearColor];
    tickText.shadowColor = [UIColor blackColor];
    tickText.shadowOffset = CGSizeMake(0,-1);
    tickText.lineBreakMode = UILineBreakModeWordWrap;
    tickText.numberOfLines = 1;
    tickText.textAlignment = UITextAlignmentCenter;
    tickText.text = [NSString stringWithFormat:@"= %i", tallyScore];
    [popUp addSubview:tickText];
    
    //cross
    UILabel *cross = [[UILabel alloc] initWithFrame:CGRectMake(150,30,50,50)];
    cross.font = [UIFont fontWithName:@"Arial Unicode MS" size:44];
    cross.textColor = [UIColor redColor];
    cross.backgroundColor = [UIColor clearColor];
    cross.shadowColor = [UIColor blackColor];
    cross.shadowOffset = CGSizeMake(0,-1);
    cross.lineBreakMode = UILineBreakModeWordWrap;
    cross.numberOfLines = 1;
    cross.textAlignment = UITextAlignmentCenter;
    cross.text = [NSString stringWithUTF8String:"\u2717"];
    [popUp addSubview:cross];
    
    //crossText
    UILabel *crossText = [[UILabel alloc] initWithFrame:CGRectMake(180,30,70,50)];
    crossText.font = [UIFont systemFontOfSize:28];
    crossText.textColor = [UIColor whiteColor];
    crossText.backgroundColor = [UIColor clearColor];
    crossText.shadowColor = [UIColor blackColor];
    crossText.shadowOffset = CGSizeMake(0,-1);
    crossText.lineBreakMode = UILineBreakModeWordWrap;
    crossText.numberOfLines = 1;
    crossText.textAlignment = UITextAlignmentCenter;
    crossText.text = [NSString stringWithFormat:@"= %i", (totalElementsInAudioArray-tallyScore)];
    [popUp addSubview:crossText];
    
    //seconds
    UILabel *seconds = [[UILabel alloc] initWithFrame:CGRectMake(85,65,120,50)];
    seconds.font = [UIFont systemFontOfSize:28];
    seconds.textColor = [UIColor whiteColor];
    seconds.backgroundColor = [UIColor clearColor];
    seconds.shadowColor = [UIColor blackColor];
    seconds.shadowOffset = CGSizeMake(0,-1);
    seconds.lineBreakMode = UILineBreakModeWordWrap;
    seconds.numberOfLines = 1;
    seconds.textAlignment = UITextAlignmentCenter;
    seconds.text = [NSString stringWithFormat:@"%i sec.", timeInt];
    [popUp addSubview:seconds];
    
    //finalScoreText
    UILabel *finalScoreText = [[UILabel alloc] initWithFrame:CGRectMake(85,95,120,50)];
    finalScoreText.font = [UIFont systemFontOfSize:22];
    finalScoreText.textColor = [UIColor whiteColor];
    finalScoreText.backgroundColor = [UIColor clearColor];
    finalScoreText.shadowColor = [UIColor blackColor];
    finalScoreText.shadowOffset = CGSizeMake(0,-1);
    finalScoreText.lineBreakMode = UILineBreakModeWordWrap;
    finalScoreText.numberOfLines = 1;
    finalScoreText.textAlignment = UITextAlignmentCenter;
    finalScoreText.text = [NSString stringWithFormat:[NSString stringWithString:NSLocalizedString(@"ResultPopUpScore", nil)]];
    [popUp addSubview:finalScoreText];
    
    //finalScore
    UILabel *finalScore = [[UILabel alloc] initWithFrame:CGRectMake(12,130,260,50)];
    finalScore.font = [UIFont systemFontOfSize:44];
    finalScore.textColor = [UIColor whiteColor];
    finalScore.backgroundColor = [UIColor clearColor];
    finalScore.shadowColor = [UIColor blackColor];
    finalScore.shadowOffset = CGSizeMake(0,-1);
    finalScore.lineBreakMode = UILineBreakModeWordWrap;
    finalScore.numberOfLines = 2;
    finalScore.textAlignment = UITextAlignmentCenter;
    finalScore.text = [NSString stringWithFormat:@"%@\n", finalScoreAsString];
    [popUp addSubview:finalScore];
    
    [popUp show];
    
    
}

-(void)appRatingChecker {
    
    appRatingConcluded = [[NSUserDefaults standardUserDefaults] objectForKey:@"appRated"];
    int tot = contentArray.count;
    if (tot > 3 && appRatingConcluded !=YES){
        NSNumber *initialScore = [[contentArray objectAtIndex:0] valueForKey:@"y"];
        NSNumber *latestScore = [[contentArray objectAtIndex:(tot-1)] valueForKey:@"y"];
        NSNumber *penultimateScore = [[contentArray objectAtIndex:(tot-2)] valueForKey:@"y"];
        
        if ((tot > 5) && ([latestScore intValue] > ([initialScore intValue] + 10)) && ([latestScore intValue] > [penultimateScore intValue])){
            rating = YES;
        } else {
            rating = NO;
        } 
    }
}



-(void) flipTiles
{    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:tappedView cache:YES];
    [tappedView flipTile];
    [UIView setAnimationDuration:0.3];
    [UIView commitAnimations];
    isAnimating=NO;
    tappedView = nil;
    
    //Call next letter audio.
    [self handleAudio];
    
}

-(void) shuffleTiles
{
    NSMutableArray *imageCentreArray = [[NSMutableArray alloc] initWithCapacity:25];
    
    for (int i = 0; i<=25; i++) {
        
        NSValue *point = [NSValue valueWithCGPoint:tile[i].center];
        
        [imageCentreArray addObject:point];
        
    }
    
    
    for (int i = 0; i<100000; i++ ){
        int swapA = (random() % 26);
        int swapB = (random() % 26);
        NSNumber *shuffle = [imageCentreArray objectAtIndex:swapA];
        [imageCentreArray replaceObjectAtIndex:swapA withObject:[imageCentreArray objectAtIndex:swapB]];
        [imageCentreArray replaceObjectAtIndex:swapB withObject:shuffle];
    }
    
    
    
    
    for (int i = 0; i <= 25; i++){
        
        [UIView animateWithDuration:1 delay:0.2 options:UIViewAnimationCurveEaseOut animations:^{
            tile[i].center = [[imageCentreArray objectAtIndex:i] CGPointValue];
        } completion:NULL];
        
    }
    
    [imageCentreArray removeAllObjects];
    
    
    
}




- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    [sound stop];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
    [sound stop];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}

@end

