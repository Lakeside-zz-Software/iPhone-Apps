//
//  Scores.h
//  Drill1
//
//  Created by John Waddington on 1/28/12.
//  Copyright (c) 2012 John Waddington. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

@interface Scores : UIViewController<CPTPlotDataSource>
{
	NSMutableArray *finalScoresSel;
    
    CPTXYGraph *graph;
	
	NSMutableArray *dataForPlot;
    
    IBOutlet UIView *view1;
    
    NSMutableArray *finalPercentageSel;
    
	NSMutableArray *dataForPlot2;
    
    IBOutlet UIView *view2;
    
	CPTXYGraph *barChart;
    
    UIAlertView *popUp;
    
    
    
    
}

-(IBAction)resetButton:(id)sender;


@property(readwrite, retain, nonatomic) NSMutableArray *dataForPlot;
@property(readwrite, retain, nonatomic) NSMutableArray *dataForPlot2;


@end