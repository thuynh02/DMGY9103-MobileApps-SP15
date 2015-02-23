//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Tony H on 2/22/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemsViewController

-(instancetype) init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if( self ){
        for( int i = 0; i < 5; ++i ) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

-(instancetype) initWithStyle: (UITableViewStyle) style
{
    return [self init];
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass: [UITableViewCell class]
           forCellReuseIdentifier: @"UITableViewCell"];
}

- (NSInteger) tableView: (UITableView *) tableView
  numberOfRowsInSection:(NSInteger) section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView: (UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier: @"UITableViewCell"
                                        forIndexPath: indexPath ];
    
    NSArray *items = [[BNRItemStore sharedStore ] allItems];
    BNRItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    return cell;
}

@end
