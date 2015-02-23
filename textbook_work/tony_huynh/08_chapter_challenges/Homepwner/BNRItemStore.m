//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Tony H on 2/22/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore()
@property (nonatomic) NSMutableArray *privateItems;
@end

@implementation BNRItemStore

+(instancetype) sharedStore
{
    static BNRItemStore *sharedStore;
    
    if( !sharedStore ){
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

-(instancetype) init
{
    [NSException raise: @"Singleton"
                format: @"Use +[BNRItemStore shareStore]"];
    return nil;
}

-(instancetype) initPrivate
{
    self = [super init];
    if( self ){
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSArray *)allItems{
    return [self.privateItems copy];
}

-(BNRItem *) createItem
{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

@end
