//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Tony H on 2/15/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>
@end

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
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame: frame];
    
    CGRect textFieldRect = CGRectMake( 40, 70, 240, 30 );
    UITextField *textField = [[UITextField alloc] initWithFrame: textFieldRect ];
    
    // border for visibility/clarity
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [backgroundView addSubview: textField];
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    
    textField.delegate = self;
    
    self.view = backgroundView;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"BNRHypnosisViewController loaded its view.");
}

- (BOOL) textFieldShouldReturn: (UITextField *)  textField
{

    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    
    return YES;
}

- (void) drawHypnoticMessage: (NSString *) message
{
    for( int i = 0; i < 20; i++ ){
        
        UILabel *messageLabel = [[UILabel alloc] init ];
        
        // Configure label color & text
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        
        // Resize label relative to displayed text
        [messageLabel sizeToFit];
        
        // Random x value within hypnosis view width
        int width = self.view.bounds.size.width - messageLabel.bounds.size.width;
        int x  = arc4random() % width;
        
        // random y value within the hypnosis view height
        int height = self.view.bounds.size.height - messageLabel.bounds.size.height;
        int y = arc4random() % height;
        
        //update lable frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x,y);
        messageLabel.frame = frame;
        
        //Add label to hierarchy
        [self.view addSubview:messageLabel];
        
        // Motion influence. Only viewable on an actual device
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath: @"center.x"
                         type: UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @-25;
        motionEffect.maximumRelativeValue = @25;
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                         type: UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @-25;
        motionEffect.maximumRelativeValue = @25;
        [messageLabel addMotionEffect:motionEffect];
        
        
    }
}

@end
