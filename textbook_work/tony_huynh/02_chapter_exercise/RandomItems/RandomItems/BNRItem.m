//
//  BNRItem.m
//  RandomItems
//
//  Created by Tony H on 2/1/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

// ---------------------------------
// return a random BNRItem
+ (instancetype) randomItem
{
    // create immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    // keep track of random adjective/noun index
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    // initialize random BNRItem attributes
    int randomValue = arc4random() % 100;
    NSString *randomName = [NSString stringWithFormat: @"%@ %@",
                             randomAdjectiveList[adjectiveIndex],
                             randomNounList[nounIndex]];
    NSString *randomSerialNumber =  [NSString stringWithFormat: @"%c%c%c%c%c",
                                     '0' + arc4random() % 10,
                                     'A' + arc4random() % 26,
                                     '0' + arc4random() % 10,
                                     'A' + arc4random() % 26,
                                     '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                       valueInDollars:randomValue
                                         serialNumber:randomSerialNumber];
    return newItem;
}

// ---------------------------------
// designated initializer
- (instancetype) initWithItemName: (NSString*) name
                   valueInDollars: (int) value
                     serialNumber: (NSString*) sNumber
{
    self = [super init];
    if( self ){
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        _dateCreated = [[NSDate alloc] init];
    }
    return self;
}

// ---------------------------------
// secondary initializer (uses the designated version)
- (instancetype) initWithItemName: (NSString*) name
{
    return [ self initWithItemName: name
                    valueInDollars: 0
                      serialNumber: @"" ];
}

// ---------------------------------
// overriding init method
- (instancetype) init
{
    return [self initWithItemName: @"Item"];
}

// ---------------------------------
// _itemName set/get
- (void) setItemName: (NSString*) str { _itemName = str; }
- (NSString*) itemName { return _itemName; }

// ---------------------------------
// _serialNumber set/get
- (void) setSerialNumber: (NSString*) str { _serialNumber = str; }
- (NSString*) serialNumber{ return _serialNumber; }

// ---------------------------------
// _valueInDollars set/get
- (void)setValueInDollars: (int) v { _valueInDollars = v; }
- (int) valueInDollars{ return _valueInDollars; }

// ---------------------------------
// _dateCreated get
- (NSDate*) dateCreated { return _dateCreated; }

// ---------------------------------
// overriding description method
- (NSString*) description
{
    NSString *descriptionString = [[NSString alloc]
        initWithFormat:@"%@ (%@): Worth $%d, recorderd on %@",
        self.itemName,
        self.serialNumber,
        self.valueInDollars,
        self.dateCreated ];
    
    return descriptionString;
}
@end
