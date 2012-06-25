//
//  TileImageView.m
//  Concentration
//
//  Created by John Waddington on 01/02/2012.
//  Copyright (c) 2012 John Waddington. All rights reserved.
//

#import "TileImageView.h"

@implementation TileImageView
@synthesize value;

- (id)initWithFrame:(CGRect)aRect value:(int) inValue
{
    self = [super initWithFrame:aRect];
    if (self) {
        self.value = inValue;
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageNamed:[NSString stringWithFormat:@"Card_%i.png",self.value]];
    }
    return self;
    
}


-(void) flipTileTick
{
    NSString* frontFileName =
    [NSString stringWithFormat:@"Tick.png"];
    self.image = [UIImage imageNamed:frontFileName]; 
    
}

-(void) flipTileCross
{
    NSString* frontFileName =
    [NSString stringWithFormat:@"Cross.png"];
    self.image = [UIImage imageNamed:frontFileName]; 
    
}
-(void) flipTile
{
    self.image = [UIImage imageNamed:[NSString stringWithFormat:@"Card_%i.png",self.value]];
    
}
-(void) shakeTile
{   
    
    self.image = [UIImage imageNamed:[NSString stringWithFormat:@"Tick.png"]];
    
}





@end
