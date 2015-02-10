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
// PROPERTY ATTRIBUTES
//  nonatomic:  since we're in a single thread environment, we don't need
//              to worry about handling resources atomically.
//
//  strong:     defines the 'strength' of the object pointer. A strong
//              'strong' reference will continue to point to an address,
//              even if the object at that location is destroyed.
//
//  weak:       also defines the 'strength' of the object pointer. A weak
//              pointer, however, will be set to nil if the object at the
//              memory location is destroyed
//
//  copy:       force a hard-copy when that variable is being set
//
//  readonly:   do not create a set function

@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

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
