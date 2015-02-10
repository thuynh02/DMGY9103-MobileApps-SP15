//
//  main.m
//  RandomItems
//
//  Created by Tony H on 2/1/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        BNRItem *backpack = [[BNRItem alloc] initWithItemName: @"Backpack"];
        [items addObject: backpack];
        
        BNRItem *calculator = [[BNRItem alloc] initWithItemName: @"Calculator"];
        [items addObject: calculator];
        
        backpack.containedItem = calculator;
        backpack = nil;
        calculator = nil;
        
        for( BNRItem *item in items ){
            NSLog( @"%@", item );
        }
        
        // Indicate that the items array will soon be set to nil
        // Expecting output from dealloc to show object information
        NSLog( @"Setting items to nil..." );
        items = nil;
        
    }
    return 0;
}
