//
//  STAItemsTableViewController.h
//  Simple Tasks
//
//  Created by Shane Sniteman on 7/30/14.
//  Copyright (c) 2014 Shane Sniteman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STAItemsTableViewController : UITableViewController

// hold dictionary of a group so we can grab the items from the table view array

@property (nonatomic) NSMutableDictionary * groupInfo;

@end
