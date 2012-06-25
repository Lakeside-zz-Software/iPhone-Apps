//
//  Game.h
//  Drill1
//
//  Created by John Waddington on 1/26/12.
//  Copyright (c) 2012 John Waddington. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "TileImageView.h"
#import "CorePlot-CocoaTouch.h"


@interface Game : UIViewController
{

    NSMutableArray *finalScoresSel;
    NSMutableArray *finalOccuranceSel;
    NSMutableArray *occuranceArray;
    NSMutableArray *finalAccuracySel;
    NSMutableArray *accuracyArray;
    NSMutableArray *finalPercentageSel;
    NSMutableArray *percentageArray;
    TileImageView* tile[26];
    TileImageView* correctTile;
    UIAlertView *popUp;
    NSString *finalScoreAsString;
    int totalElementsInAudioArray;
    int finalScoreInt;
    int timeInt;
    int tallyScore;
    float correctTaps;
    float finalPercentage;
    NSTimer *timer;
    NSMutableArray *tiles;
    TileImageView *tappedView;
    bool isAnimating;
    bool finalTap;
    int audioArrayElement;
    int pronunSel;
    bool rating;
    bool exiting;
    bool appRatingConcluded;

    
    NSMutableArray *contentArray;
    
    NSURL *soundFile;
    AVAudioPlayer *sound;
    NSMutableArray *audioArray;
    NSNumber *letterNumber;
    
    IBOutlet UIImageView *pronunciationFlag;
    
    
}

-(void) handleAudio;
-(void) createTiles;
-(void) createAudio;
-(void) addTilesToView;
-(void) flipTiles;
-(void) counterTimer;
-(void) shuffleTiles;
-(void) countUp;
-(void) flashSolution:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;


@end
