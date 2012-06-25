//
//  FlashcardAudio.m
//  Drill1
//
//  Created by John Waddington on 2/3/12.
//  Copyright (c) 2012 John Waddington. All rights reserved.
//

#import "FlashcardAudio.h"

@implementation FlashcardAudio

-(UIImage *) playAudio {
    
    pronunSel = [[NSUserDefaults standardUserDefaults] integerForKey:@"pronunciation"];
    
    NSString *resourceString;    
    switch (pronunSel) {
        case 0:
            image = [UIImage imageNamed: @"United-Kingdom-Flag-3-icon-1.png"];
            resourceString = [[NSString alloc] initWithFormat:@"Br_Audio_%@", num];
            soundFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                pathForResource:resourceString ofType: @"mp3"]];
            
            
            sound = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFile error:nil];
            [sound play];
            sound.volume = [[NSUserDefaults standardUserDefaults] floatForKey:@"slider"];
            break;
            
        case 1:
            image = [UIImage imageNamed: @"United-States-Flag-3-icon.png"];
            resourceString = [[NSString alloc] initWithFormat:@"Am_Audio_%@", num];
            soundFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                pathForResource:resourceString ofType: @"mp3"]];
            sound = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFile error:nil];
            [sound play];
            sound.volume = [[NSUserDefaults standardUserDefaults] floatForKey:@"slider"];
            break;
    }
    
    return image;
    
    
}

-(UIImage *) varTile {
    
    int tileNumber = [num intValue];    
    switch (tileNumber) {
        case 15:
            switch (pronunSel) {
                case 0:
                    image = [UIImage imageNamed: @"Oo.png"];
                    break;
                    
                case 1:
                    image = [UIImage imageNamed: @"OoAm.png"];
                    break;
            }
            
            break;
            
        case 18:
            switch (pronunSel) {
                case 0:
                    image = [UIImage imageNamed: @"Rr.png"];
                    break;
                    
                case 1:
                    image = [UIImage imageNamed: @"RrAm.png"];
                    break;
            }
            break;
            
        case 26:
            switch (pronunSel) {
                case 0:
                    image = [UIImage imageNamed: @"Zz.png"];
                    break;
                    
                case 1:
                    image = [UIImage imageNamed: @"ZzAm.png"];
                    break;
            }
            
            break;
    }
    
    return image;
}



-(void) setNumber:(NSString *)n{
    
    num = n;
    
}






@end
