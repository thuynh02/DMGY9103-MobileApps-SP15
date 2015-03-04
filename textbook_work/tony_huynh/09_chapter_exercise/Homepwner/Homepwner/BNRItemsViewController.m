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

@interface BNRItemsViewController()
@property (nonatomic, strong) IBOutlet UIView *headerView;
@end

@implementation BNRItemsViewController

-(instancetype) init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if( self ){
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
    
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}

// =================================================
// Table View Methods

// Get row count
- (NSInteger) tableView: (UITableView *) tableView
  numberOfRowsInSection:(NSInteger) section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}

// Return specific cell description based on index
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

// "Commit" the edit of deleting a row
-(void) tableView: (UITableView*) tableView
        commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
        forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if( editingStyle == UITableViewCellEditingStyleDelete ){
        NSArray *items = [[BNRItemStore sharedStore] allItems];
        BNRItem *item = items[indexPath.row];
        [[BNRItemStore sharedStore] removeItem:item];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath]
         withRowAnimation:UITableViewRowAnimationFade];
    }
}

// Move a row
-(void) tableView:(UITableView*) tableView
        moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
        toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row
                                        toIndex:destinationIndexPath.row];
}
// =================================================

- (UIView *) headerView
{
    if( !_headerView ){
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView"
                                      owner:self
                                    options:nil];
    }
    return _headerView;
}

- (IBAction) addNewItem:(id)sender
{
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    
    NSInteger lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection: 0 ];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
}

- (IBAction) toggleEditingMode:(id)sender
{
    if( self.isEditing ){
        [sender setTitle:@"Edit" forState: UIControlStateNormal];
        [self setEditing:NO animated:YES];
    }
    else{
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
    
    
}

@end
