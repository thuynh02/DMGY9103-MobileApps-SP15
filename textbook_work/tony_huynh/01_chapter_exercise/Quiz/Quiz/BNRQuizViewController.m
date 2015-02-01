//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by Tony H on 1/31/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

// View objects
@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

// Model objects
@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@end

@implementation BNRQuizViewController

// Initialization
- (instancetype) initWithNibName: (NSString*) nibNameOrNil
                          bundle: (NSBundle*) nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self){
        // Create two arrays filled with questions and answers
        // and make the pointers point to them
        self.questions =    @[@"From what is cognac made?",
                              @"What is 7+7?",
                              @"What is the capital of Vermont?"];
        
        self.answers =      @[@"Grapes",
                              @"14",
                              @"Montpelier"];
    }
    
    // Return the address of the new object
    return self;
}

// Actions
- (IBAction) showQuestion: (id)sender
{

    // Step to the next question
    self.currentQuestionIndex++;
    
    // Check if the index has gone past the last question
    if( self.currentQuestionIndex == [self.questions count] ){
        // If so, return to the first question
        self.currentQuestionIndex = 0;
    }
         
    // Get the string at the current index
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // Display the string in the question label
    self.questionLabel.text = question;
    
    // Reset the answer label
    self.answerLabel.text = @"???";
    
}

- (IBAction) showAnswer: (id)sender
{
 
    // Get the answer to the current question & display it
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text  = answer;
    
}

@end
