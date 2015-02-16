//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Tony H on 2/15/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if( self ){
        self.tabBarItem.title = @"Hypnotize";
        UIImage *i = [UIImage imageNamed: @"Hypno.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

-(void)loadView
{
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    self.view = backgroundView;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"BNRHypnosisViewController loaded its view.");
}

@end
