//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Tony H on 3/10/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

-(void) loadView
{
    self.view = [[BNRDrawView alloc] initWithFrame: CGRectZero];
}

@end
