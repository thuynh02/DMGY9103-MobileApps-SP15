//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Tony H on 2/22/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRDetailViewController.h"
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
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Homepwner";
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                target:self
                                action:@selector(addNewItem:)];
        
        navItem.rightBarButtonItem = bbi;
        navItem.leftBarButtonItem = self.editButtonItem;
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

-(void) viewWillAppear:(BOOL) animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
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

// Step into detailed view when selecting row
-(void) tableView:(UITableView *)tableView
        didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNRDetailViewController *detailViewController =
    [[BNRDetailViewController alloc] initForNewItem:NO];
    
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *selectedItem = items[indexPath.row];
    
    detailViewController.item = selectedItem;
    
    [self.navigationController pushViewController:detailViewController
                                         animated:YES];
    
}
// =================================================

- (IBAction) addNewItem:(id)sender
{
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    
    BNRDetailViewController *detailViewController =
    [[BNRDetailViewController alloc] initForNewItem:YES];
    
    detailViewController.item = newItem;
    UINavigationController *navController = [[UINavigationController alloc]
                                             initWithRootViewController:detailViewController];
    
    detailViewController.dismissBlock = ^{
        [self.tableView reloadData];
    };
    
    [self presentViewController:navController animated:YES completion:NULL];
}

@end
