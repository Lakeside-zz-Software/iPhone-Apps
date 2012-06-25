//
//  FlashcardAudio.h
//  Drill1
//
//  Created by John Waddington on 2/3/12.
//  Copyright (c) 2012 John Waddington. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>
#import "TileImageView.h"

@interface FlashcardAudio : UIImageView <AVAudioPlayerDelegate>{
    NSString *num;
    NSURL *soundFile;
    AVAudioPlayer *sound;
    UIImage *image;
    UIImage *slidyHand;
    int pronunSel;
    TileImageView* flagTile;
    
}
-(UIImage *) playAudio;
-(UIImage *) varTile;
-(void) setNumber:(NSString *)n;

@end
