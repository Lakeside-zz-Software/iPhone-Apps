//
//  Scores.m
//  Drill1
//
//  Created by John Waddington on 1/28/12.
//  Copyright (c) 2012 John Waddington. All rights reserved.
//

#import "Scores.h"



@implementation Scores

@synthesize dataForPlot;
@synthesize dataForPlot2;

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



-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation  == UIInterfaceOrientationPortrait);
}

-(IBAction)done
{
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissModalViewControllerAnimated:YES];
}


-(void)viewDidLoad 
{
    [super viewDidLoad];
    
    //Loads data
    finalScoresSel = [[NSMutableArray alloc] init];
    
    finalScoresSel = [[NSUserDefaults standardUserDefaults] objectForKey:@"finalscores"];
    
    
    
    
    // Create graph from theme
    graph = [[CPTXYGraph alloc] initWithFrame:CGRectMake(0, 0, 320, 220)];
    CPTTheme *theme = [CPTTheme themeNamed:kCPTSlateTheme];
    [graph applyTheme:theme];
    CPTGraphHostingView *hostingView = [[CPTGraphHostingView alloc] initWithFrame:CGRectMake(0, 45, 320, 220)];
    hostingView.collapsesLayers = YES; // Setting to YES reduces GPU memory usage, but can slow drawing/scrolling
    
    hostingView.hostedGraph = graph;
    [view1 addSubview:hostingView];
    
    
    graph.paddingLeft = 10.0;
    graph.paddingTop = 5.0;
    graph.paddingRight = 10.0;
    graph.paddingBottom = 5.0;
    
    graph.plotAreaFrame.paddingBottom = 35.0;
    graph.plotAreaFrame.paddingLeft = 50.0;
    graph.plotAreaFrame.paddingRight= 10.0;
    
    // Setup plot space
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *)graph.defaultPlotSpace;
    plotSpace.allowsUserInteraction = YES;
    
    
    plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInteger(([finalScoresSel count]) - 9) length:CPTDecimalFromInteger(10)];
    plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInteger(0) length:CPTDecimalFromInteger(150)];
    
    
    //effectively disables Y-axis scrolling should user manipulation be enabled
    CPTPlotRange *globalYRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromDouble(0) length:CPTDecimalFromDouble(140)];
    //contrains x-axis from first to most recent game or 10 if no games have yet been played
    if (finalScoresSel){
        CPTPlotRange *globalXRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromDouble(1) length:CPTDecimalFromDouble([finalScoresSel count]+1)];
        plotSpace.globalXRange = globalXRange;
    }else{
        CPTPlotRange *globalXRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromDouble(1) length:CPTDecimalFromDouble(10)];
        plotSpace.globalXRange = globalXRange;
    }
    
    
    plotSpace.globalYRange = globalYRange;
    
    
    CPTMutableTextStyle *axisTextStyle = [CPTMutableTextStyle textStyle];
    axisTextStyle.fontSize = 10.0;
    //no float labels
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumFractionDigits:0];
    
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)graph.axisSet;
    CPTXYAxis *x = axisSet.xAxis;
    x.majorIntervalLength = CPTDecimalFromInteger(2);
    x.orthogonalCoordinateDecimal = CPTDecimalFromInteger(0);
    x.minorTicksPerInterval = 0;
    x.borderWidth = 0;
    //x.title = @"Game Number";
    //x.titleOffset = 18.0;
    x.labelFormatter = formatter;
    x.labelTextStyle = axisTextStyle;
    
    
    
    
    CPTXYAxis *y = axisSet.yAxis;
    y.majorIntervalLength = CPTDecimalFromInteger(10);
    y.minorTicksPerInterval = 1;
    y.orthogonalCoordinateDecimal = CPTDecimalFromInteger(0);
    y.title = [NSString stringWithString:NSLocalizedString(@"GraphYAxisLabel", nil)];
    y.labelFormatter = formatter;
    y.axisConstraints = [CPTConstraints constraintWithLowerOffset:0];
    y.labelTextStyle = axisTextStyle;
    
    //setup horizontal lines 
    CPTMutableLineStyle *horizontalLineStyle = [CPTMutableLineStyle 
                                                lineStyle]; 
    [horizontalLineStyle setLineWidth:0.1]; 
    [horizontalLineStyle setLineColor:[CPTColor colorWithGenericGray: 
                                       0.88]]; 
    y.majorGridLineStyle = horizontalLineStyle;
    
    
    
    
    
    
    y.visibleRange   = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInteger(0)
                                                    length:CPTDecimalFromInteger(130)];
    y.gridLinesRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInteger(0)
                                                    length:CPTDecimalFromInteger(140)];
    x.visibleRange   = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInteger(0)
                                                    length:CPTDecimalFromInteger(120)];
    x.gridLinesRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInteger(0)
                                                    length:CPTDecimalFromInteger(120)];
    
    
    
   	CPTScatterPlot *boundLinePlot = [[CPTScatterPlot alloc] init];
    CPTMutableLineStyle *lineStyle = [CPTMutableLineStyle lineStyle];
    lineStyle.miterLimit = 1.0f;
   	lineStyle.lineWidth = 1.0f;
   	lineStyle.lineColor = [CPTColor blueColor];
    boundLinePlot.dataLineStyle = lineStyle;
    boundLinePlot.identifier = @"letters";
    boundLinePlot.dataSource = self;
    [graph addPlot:boundLinePlot];
   	
   	// Do a blue gradient
   	CPTColor *areaColor1 = [CPTColor colorWithComponentRed:0.3 green:0.3 blue:1.0 alpha:0.9];
    CPTGradient *areaGradient1 = [CPTGradient gradientWithBeginningColor:areaColor1 endingColor:[CPTColor clearColor]];
    areaGradient1.angle = -90.0f;
    CPTFill *areaGradientFill = [CPTFill fillWithGradient:areaGradient1];
    boundLinePlot.areaFill = areaGradientFill;
    boundLinePlot.areaBaseValue = CPTDecimalFromInteger(0);  
    
    
   	// Add plot symbols
   	CPTMutableLineStyle *symbolLineStyle = [CPTMutableLineStyle lineStyle];
   	symbolLineStyle.lineColor = [CPTColor blackColor];
   	CPTPlotSymbol *plotSymbol = [CPTPlotSymbol ellipsePlotSymbol];
   	plotSymbol.fill = [CPTFill fillWithColor:[CPTColor blueColor]];
   	plotSymbol.lineStyle = symbolLineStyle;
    plotSymbol.size = CGSizeMake(8.0, 8.0);
    boundLinePlot.plotSymbol = plotSymbol;
    
    
    
   	self.dataForPlot = finalScoresSel;
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////    
    
    
    //Loads data
    finalPercentageSel = [[NSMutableArray alloc] init];
    
    finalPercentageSel = [[NSUserDefaults standardUserDefaults] objectForKey:@"finalpercentage"];
    
    
	// Create barChart from theme
	barChart = [[CPTXYGraph alloc] initWithFrame:CGRectMake(0, 0, 320, 160)];
	[barChart applyTheme:theme];
	CPTGraphHostingView *hostingView2 = [[CPTGraphHostingView alloc] initWithFrame:CGRectMake(0, 255, 320, 160)];
    
    
	hostingView2.hostedGraph	= barChart;
    
    [view2 addSubview:hostingView2];
    
	barChart.plotAreaFrame.masksToBorder = NO;
    
    barChart.paddingLeft = 10.0;
    barChart.paddingTop = 10.0;
    barChart.paddingRight = 10.0;
    barChart.paddingBottom = 5.0;
    
    barChart.plotAreaFrame.paddingBottom = 25.0;
    barChart.plotAreaFrame.paddingLeft = 50.0;
    barChart.plotAreaFrame.paddingRight= 10.0;
    barChart.plotAreaFrame.paddingTop = 20.0;
    
	// Add plot space for horizontal bar charts
	CPTXYPlotSpace *plotSpace2 = (CPTXYPlotSpace *)barChart.defaultPlotSpace;
	plotSpace2.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0.0f) length:CPTDecimalFromFloat(102.0f)];
	plotSpace2.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(-1.0f) length:CPTDecimalFromFloat(26.5f)];
    
    CPTMutableTextStyle *axisTextStyle2 = [CPTMutableTextStyle textStyle];
    axisTextStyle2.fontSize = 10.0;
    
    NSNumberFormatter *formatter2 = [[NSNumberFormatter alloc] init];
    [formatter2 setMaximumFractionDigits:0];
    axisTextStyle2.fontSize = 10.0;
    
	CPTXYAxisSet *axisSet2 = (CPTXYAxisSet *)barChart.axisSet;
	CPTXYAxis *x2		  = axisSet2.xAxis;
	x2.majorTickLineStyle		  = nil;
	x2.minorTickLineStyle		  = nil;
	x2.majorIntervalLength		  = CPTDecimalFromString(@"1");
	x2.orthogonalCoordinateDecimal = CPTDecimalFromString(@"0");
    x2.labelFormatter = formatter2;
    x2.labelTextStyle = axisTextStyle2;
    
    
    
	// Define some custom labels for the data elements
	x2.labelingPolicy = CPTAxisLabelingPolicyNone;
	NSArray *customTickLocations = [NSArray arrayWithObjects:[NSDecimalNumber numberWithFloat:-0.3], [NSDecimalNumber numberWithFloat:0.8], [NSDecimalNumber numberWithFloat:1.8], [NSDecimalNumber numberWithFloat:2.8], [NSDecimalNumber numberWithFloat:3.8],[NSDecimalNumber numberWithFloat:4.8],[NSDecimalNumber numberWithFloat:5.8],[NSDecimalNumber numberWithFloat:6.8],[NSDecimalNumber numberWithFloat:7.8],[NSDecimalNumber numberWithFloat:8.8],[NSDecimalNumber numberWithFloat:9.8],[NSDecimalNumber numberWithFloat:10.8],[NSDecimalNumber numberWithFloat:11.8],[NSDecimalNumber numberWithFloat:12.8],[NSDecimalNumber numberWithFloat:13.8],[NSDecimalNumber numberWithFloat:14.8],[NSDecimalNumber numberWithFloat:15.8],[NSDecimalNumber numberWithFloat:16.8],[NSDecimalNumber numberWithFloat:17.8],[NSDecimalNumber numberWithFloat:18.8],[NSDecimalNumber numberWithFloat:19.8],[NSDecimalNumber numberWithFloat:20.8],[NSDecimalNumber numberWithFloat:21.8],[NSDecimalNumber numberWithFloat:22.8],[NSDecimalNumber numberWithFloat:23.8],[NSDecimalNumber numberWithFloat:24.8],nil];
	NSArray *xAxisLabels		 = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
	NSUInteger labelLocation	 = 0;
	NSMutableArray *customLabels = [NSMutableArray arrayWithCapacity:[xAxisLabels count]];
	for ( NSNumber *tickLocation in customTickLocations ) {
		CPTAxisLabel *newLabel = [[CPTAxisLabel alloc] initWithText:[xAxisLabels objectAtIndex:labelLocation++] textStyle:x.labelTextStyle];
		newLabel.tickLocation = [tickLocation decimalValue];
		newLabel.offset		  = 1;  
		[customLabels addObject:newLabel];
	}
    
	x2.axisLabels = [NSSet setWithArray:customLabels];
    
	CPTXYAxis *y2 = axisSet2.yAxis;
	y2.majorTickLineStyle		  = nil;
	y2.minorTickLineStyle		  = nil;
	y2.majorIntervalLength		  = CPTDecimalFromString(@"20");
	y2.orthogonalCoordinateDecimal = CPTDecimalFromString(@"-1");
	y2.title						  = @"%";
	y2.titleOffset				  = 20.0f;
	y2.titleLocation				  = CPTDecimalFromFloat(50.0f);
    y2.labelFormatter = formatter2;
    y2.labelTextStyle = axisTextStyle2;
    
    
    
    y2.visibleRange   = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInteger(0)
                                                     length:CPTDecimalFromInteger(110)];
    y2.gridLinesRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInteger(0)
                                                     length:CPTDecimalFromInteger(100)];
    x2.visibleRange   = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInteger(-1)
                                                     length:CPTDecimalFromInteger(120)];
    x2.gridLinesRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInteger(0)
                                                     length:CPTDecimalFromInteger(120)];
    
    
    
    
    
	//bar plot
	CPTBarPlot *barPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor blueColor] horizontalBars:NO];
	barPlot.baseValue  = CPTDecimalFromString(@"0");
	barPlot.dataSource = self;
	barPlot.barOffset  = CPTDecimalFromFloat(-0.35f);
	barPlot.identifier = @"Bar Plot 1";
    barPlot.barWidth = CPTDecimalFromString(@"0.65");
    barPlot.lineStyle = symbolLineStyle;
    barPlot.fill = areaGradientFill;
    
	[barChart addPlot:barPlot toPlotSpace:plotSpace2];
    
    
    
    
    self.dataForPlot2 = finalPercentageSel;
    
    
}



#pragma mark -
#pragma mark Plot Data Source Methods

-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
    if ([plot isKindOfClass:[CPTBarPlot class]]) {
        return 26;
    }else{
        return [dataForPlot count];
    }
    
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
    
    
    NSDecimalNumber *num = nil;
    
    if([plot isKindOfClass:[CPTScatterPlot class]]){
        num = (NSDecimalNumber *) [[dataForPlot objectAtIndex:index] valueForKey:(fieldEnum == CPTScatterPlotFieldX ? @"x" : @"y")];
    }
    
    
    
    
    
	if ( [plot isKindOfClass:[CPTBarPlot class]] ) {
		switch ( fieldEnum ) {
			case CPTBarPlotFieldBarLocation:
				num = (NSDecimalNumber *)[NSDecimalNumber numberWithUnsignedInteger:index];
				break;
                
			case CPTBarPlotFieldBarTip:
				num = (NSDecimalNumber *)[[dataForPlot2 objectAtIndex:index] valueForKey:(fieldEnum ==CPTBarPlotFieldBarLocation ? @"letter" : @"percentage")];
				
				break;
		}
	}
    
	return num;
    
    
    
}


-(IBAction)resetButton:(id)sender
{
    
    popUp = [[UIAlertView alloc] initWithTitle:[NSString stringWithString:NSLocalizedString(@"GraphAlertPopUpTitle", nil)] message:[NSString stringWithString:NSLocalizedString(@"GraphAlertPopUpMessage", nil)] delegate:self cancelButtonTitle:[NSString stringWithString:NSLocalizedString(@"GraphAlertPopUpCancelButton", nil)] otherButtonTitles:[NSString stringWithString:NSLocalizedString(@"GraphAlertPopUpOtherButton", nil)], nil];
    //launch the alert
    [popUp show];
    
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    if (buttonIndex == 0) {
        return;}
    
    if (buttonIndex == 1) {
        
        NSUserDefaults *finalSel = [NSUserDefaults standardUserDefaults];
        
        [finalSel setObject:nil forKey:@"finalscores"];
        [finalSel synchronize];
        
        NSUserDefaults *occuranceSel = [NSUserDefaults standardUserDefaults];
        
        [occuranceSel setObject:nil forKey:@"finaloccurance"];
        [occuranceSel synchronize];
        
        NSUserDefaults *accuracySel = [NSUserDefaults standardUserDefaults];
        
        [accuracySel setObject:nil forKey:@"finalaccuracy"];
        [accuracySel synchronize];
        
        NSUserDefaults *percentageSel = [NSUserDefaults standardUserDefaults];
        
        [percentageSel setObject:nil forKey:@"finalpercentage"];
        [percentageSel synchronize];
        
        [self.navigationController popViewControllerAnimated:YES];
        [self dismissModalViewControllerAnimated:YES];
        
    }
    
    
    
}

@end