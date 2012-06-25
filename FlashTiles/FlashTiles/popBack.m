//
//  popBack.m
//  FlashTiles
//
//  Created by John Waddington on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "popBack.h"

@implementation popBack

- (void) perform {
    
    UIViewController *src = (UIViewController *) self.sourceViewController;
    
    [src.navigationController popViewControllerAnimated:YES];
}
    

@end
