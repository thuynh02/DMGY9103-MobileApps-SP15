//
//  BNRContainer.h
//  RandomItems
//
//  Created by Tony H on 2/1/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

@interface BNRContainer : NSObject
{
    NSMutableArray *_items;
    NSString *_containerName;
    int _valueInDollars;
}

// ---------------------------------
// initializers
- (instancetype) initWithContainerName: (NSString*) name
                                 items: (NSMutableArray*) items;

// ---------------------------------
// getters & setters
- (void) setItems: (NSMutableArray*) items;
- (NSMutableArray*) items;

- (void) setContainerName: (NSString*) name;
- (NSString*) containerName;

- (int) valueInDollars;

// ---------------------------------
// Calculate total value in container
- (int) updateTotalValue;

// ---------------------------------
// override description
- (NSString*) description;


@end
