//
//  BNRItem.h
//  RandomItems
//
//  Created by Tony H on 2/1/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

// ---------------------------------
// ORDER OF HEADER DECLARATIONS (by convention)
// - Instance variables
// - Class methods
// - Initializers
// - Instance methods

{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

// ---------------------------------
// return a random BNRItem
+ (instancetype) randomItem;

// ---------------------------------
// designated initializer for BNRItem
- (instancetype) initWithItemName: (NSString*) name
                   valueInDollars: (int) value
                     serialNumber: (NSString*) sNumber;

- (instancetype) initWithItemName: (NSString*) name;

// ---------------------------------
// overriding init to call designated initializer
- (instancetype) init;

// ---------------------------------
// getters & setters
- (void) setItemName: (NSString*) str;
- (NSString*) itemName;

- (void) setSerialNumber: (NSString*) str;
- (NSString*) serialNumber;

- (void)setValueInDollars: (int) v;
- (int) valueInDollars;

- (NSDate*) dateCreated;

// ---------------------------------
// Description method will be overwritten
// (not in book example, but noting it to be clear)
- (NSString*) description;
@end
