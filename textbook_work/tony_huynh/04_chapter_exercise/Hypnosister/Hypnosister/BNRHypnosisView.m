//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Tony H on 2/10/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

//================================
// instantiator
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame ];
    if(self){
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

//================================
// concentric circles
-(void)drawRect:(CGRect) rect{
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height/ 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // Use the path to draw a circle around the center
    UIBezierPath *path = [[UIBezierPath alloc] init ];
    
    for( float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20 ){
        
        [path moveToPoint:CGPointMake(center.x+currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    path.lineWidth = 10;
    [[UIColor lightGrayColor] setStroke];
    
    [path stroke];
    
    // Bronze challenge: logo png
    UIImage *logoImage = [UIImage imageNamed:@"bnr_logo.png"];
    CGRect logoContainer = CGRectMake(center.x - (logoImage.size.width/4),
                                      center.y - (logoImage.size.height/4),
                                      logoImage.size.width/2,
                                      logoImage.size.height/2);
    [logoImage drawInRect:logoContainer];
}

@end
