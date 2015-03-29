//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Tony H on 3/10/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore()
@property (nonatomic, strong) NSMutableDictionary *dictionary;
@end

@implementation BNRImageStore

// Initialization
+(instancetype) sharedStore
{
    static BNRImageStore *sharedStore;
    
    if( !sharedStore ){
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

-(instancetype) init
{
    [NSException raise: @"Singleton"
                format: @"Use + [BNRImageStore sharedStore]" ];
    return nil;
}

-(instancetype) initPrivate
{
    self = [super init];
    
    if(self){
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

// Image methods
-(void)setImage: (UIImage*)image forKey:(NSString *) key
{
    self.dictionary[key] = image;
}

-(UIImage *) imageForKey:(NSString *) key
{
    return self.dictionary[key];
}

-(void) deleteImageForKey: (NSString*) key
{
    if (!key ){
        return;
    }
    [self.dictionary removeObjectForKey: key];
}

@end
