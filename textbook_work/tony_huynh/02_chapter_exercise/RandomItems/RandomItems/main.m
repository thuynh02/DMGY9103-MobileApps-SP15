//
//  main.m
//  RandomItems
//
//  Created by Tony H on 2/1/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        // ---------------------------------
//        // Previous exercises in chapter 2
//      
//        // Create a mutable array object
//        NSMutableArray *items = [[NSMutableArray alloc] init];
//        
//        // Send the message 'addObject:' to the NSMutableArray to give it the
//        // string elements
//        [items addObject:@"One"];
//        [items addObject:@"Two"];
//        [items addObject:@"Three"];
//        
//        // Send another message, 'inserObject:atIndex:', to that same array
//        [items insertObject:@"Zero" atIndex:0];
//        
//        // Iterate through the array using 'fast enumeration'
//        for( NSString *item in items ){
//            // Log the description of the item
//            NSLog( @"%@", item );
//            
//            // *** Note ***
//            // You cannot use fast enumeration if you need to add or remove
//            // objects within the loop
//            // ************
//        }
//        
//        // BNRItem *item = [[BNRItem alloc] init];
//        
//        // Setting instance variables with explicit calls to the setter methods
//        // [item setItemName:@"Red Sofa"];
//        // [item setSerialNumber:@"A1B2C"];
//        // [item setValueInDollars:100];
//        //
//        // NSLog( @"%@, %@, %@, $%d",
//        //      [item itemName],
//        //      [item dateCreated],
//        //      [item serialNumber],
//        //      [item valueInDollars] );
//        
//        // Dot syntax alternative (preferred)
//        // item.itemName = @"Red Sofa";
//        // item.serialNumber = @"A1B2C";
//        // item.valueInDollars = 100;
//        //
//        // NSLog( @"%@, %@, %@, $%d",
//        //      item.itemName,
//        //      item.dateCreated,
//        //      item.serialNumber,
//        //      item.valueInDollars );
//        
//        // Using the designated initializer
//        BNRItem *item = [[BNRItem alloc] initWithItemName: @"Red Sofa"
//                                           valueInDollars: 100
//                                             serialNumber: @"A1B2C"];
//        
//        // Will output using the overloaded 'description' method in BNRItem.m
//        NSLog( @"%@", item );
//        
//        BNRItem *itemWithName = [[BNRItem alloc] initWithItemName:@"Blue Sofa"];
//        NSLog( @"%@", itemWithName );
//        
//        BNRItem *itemWithNoName = [[BNRItem alloc] init];
//        NSLog( @"%@", itemWithNoName );
//        
//        // Destory the mutable array object
//        items = nil;
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for( int i = 0; i < 10; ++i ){
            BNRItem *item = [BNRItem randomItem];
            [items addObject: item];
        }
        
        for( BNRItem *item in items ){
            NSLog( @"%@", item );
        }
        
        
        // ============= Bronze-challenge =============
        // Note the exception when accessing the 11th item:
        // Terminating app due to uncaught exception 'NSRangeException',
        // reason:
        //  '*** -[__NSArrayM objectAtIndex:]: index 11 beyond bounds [0 .. 9]'
        //
        // NSLog( @"%@", items[11] );
        
        
        // ============= Silver Challenge =============
        BNRItem *itemWithNameAndSerial = [[BNRItem alloc]
                                          initWithItemName: @"Silver"
                                          serialNumber: @"S1V3R"];
        NSLog( @"%@", itemWithNameAndSerial );
        
        
        items = nil;
        
    }
    return 0;
}
