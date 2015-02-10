//
//  BNRContainer.m
//  RandomItems
//
//  Created by Tony H on 2/1/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

// ---------------------------------
// initializers
- (instancetype) initWithContainerName: (NSString*) name
                                 items: (NSMutableArray*) items
{
    self = [super init];
    if( self ){
        _containerName = name;
        _items = items;
        _valueInDollars = 0;
        
        for( BNRItem *item in items ){
            _valueInDollars += item.valueInDollars;
        }
    }
    return self;
}

// ---------------------------------
// getters & setters
- (void) setItems: (NSMutableArray*) items
{
    _items = items;
    
    // Reset total value in dollars
    _valueInDollars = 0;
    for( BNRItem *item in _items ){
        _valueInDollars += item.valueInDollars;
    }
}
- (NSMutableArray*) items { return _items; }

- (void) setContainerName: (NSString*) name { _containerName = name; }
- (NSString*) containerName { return _containerName; }

- (int) valueInDollars {
    [self updateTotalValue];
    return _valueInDollars;
}

// ---------------------------------
// Calculate total value in container
// *NOTE*
//      This only works because the container value attribute is also named
//      _valueInDollars, just like in the BNRItem class
- (int) updateTotalValue
{
    _valueInDollars = 0;
    for( BNRItem *item in _items ){
        _valueInDollars += item.valueInDollars;
    }
    return _valueInDollars;
}

// ---------------------------------
// override description
- (NSString*) description{
    [self updateTotalValue];
    NSString *fullDesc = [[NSString alloc]
                          initWithFormat:@"\n====%@ [$%d]====",
                          _containerName,
                          _valueInDollars ];
    
    // Build the item list by iterating through the array and appending the
    // item descriptions
    for( BNRItem *item in _items ){
        fullDesc = [fullDesc stringByAppendingString: @"\n"];
        fullDesc = [fullDesc stringByAppendingString: item.description];
    }
    fullDesc = [fullDesc stringByAppendingString: @"\n====== ~ ======\n"];
    
    return fullDesc;
}

@end
