//
//  TileImageView.h
//  Concentration
//
//  Created by John Waddington 01/02/2012.
//  Copyright (c) 2012 John Waddington. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TileImageView : UIImageView {

    int value;
}

- (id)initWithFrame:(CGRect)aRect value:(int) inValue;
- (void) flipTileTick;
- (void) flipTileCross;
- (void) flipTile;
- (void) shakeTile;



@property int value;

@end