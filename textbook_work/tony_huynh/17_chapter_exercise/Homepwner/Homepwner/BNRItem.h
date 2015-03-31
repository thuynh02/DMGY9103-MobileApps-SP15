//
//  BNRItem.h
//  RandomItems
//
//  Created by Tony H on 2/1/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;
@property (nonatomic, copy) NSString *itemKey;

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
// overriding dealloc to understand NSObject's implementation
- (void) dealloc;

// ---------------------------------
// Description method will be overwritten
// (not in book example, but noting it to be clear)
- (NSString*) description;
@end
