//
//  BNRDrawView.m
//  TouchTracker
//
//  Created by Tony H on 3/11/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRDrawView.h"
#import "BNRLine.h"

@interface BNRDrawView()
@property (nonatomic, strong) NSMutableDictionary *linesInProgress;
@property (nonatomic, strong) NSMutableArray *finishedLines;
@end

@implementation BNRDrawView

-(instancetype) initWithFrame: (CGRect)r
{
    self = [super initWithFrame: r];
    if( self ){
        self.linesInProgress = [[NSMutableDictionary alloc] init];
        self.finishedLines = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
    }
    return self;
}

-(void) strokeLine: (BNRLine *) line
{
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    
    [bp moveToPoint: line.begin];
    [bp addLineToPoint: line.end];
    [bp stroke];
}

-(void) drawRect: (CGRect) rect
{
    [[UIColor blackColor] set];
    for (BNRLine *line in self.finishedLines ){
        [self strokeLine: line];
    }
}

-(void) touchesBegan: (NSSet *) touches
           withEvent: (UIEvent *) event
{
    NSLog( @"%@", NSStringFromSelector(_cmd) );
    for( UITouch *t in touches ){
        CGPoint location = [t locationInView:self];
        
        BNRLine *line = [[BNRLine alloc] init];
        line.begin = location;
        line.end = location;
        
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.linesInProgress[key] = line;
    }
    
    [self setNeedsDisplay];
}

-(void) touchesMoved: (NSSet*) touches
           withEvent: (UIEvent*) event
{
    NSLog( @"%@", NSStringFromSelector(_cmd) );
    for( UITouch *t in touches ){
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        line.end = [t locationInView:self];
    }
    [self setNeedsDisplay];
}

-(void) touchesEnded: (NSSet *) touches
           withEvent: (UIEvent*) event
{
    NSLog(@"%@", NSStringFromSelector(_cmd) );
    for( UITouch *t in touches ){
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        
        [self.finishedLines addObject:line];
        [self.linesInProgress removeObjectForKey:key];
    }
    [self setNeedsDisplay];
}

-(void) touchesCancelled:(NSSet *) touches
               withEvent: (UIEvent*) event
{
    NSLog( @"%@", NSStringFromSelector(_cmd));
    for( UITouch *t in touches ){
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
    }
    [self setNeedsDisplay];
}

@end
