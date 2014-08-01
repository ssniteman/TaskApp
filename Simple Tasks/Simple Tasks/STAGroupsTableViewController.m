//
//  STAGroupsTableViewController.m
//  Simple Tasks
//
//  Created by Shane Sniteman on 7/30/14.
//  Copyright (c) 2014 Shane Sniteman. All rights reserved.
//

#import "STAGroupsTableViewController.h"
#import "STANewGroupViewController.h"
#import "STAItemsTableViewController.h"

@interface STAGroupsTableViewController () <UITextFieldDelegate>
@end

@implementation STAGroupsTableViewController

{
    NSMutableArray * groups;
   
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        // Custom initialization
        
        
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        
        groups = [@[]mutableCopy];
                    
//                    [@{@"name": @"Movies To Watch",
//                      @"items": [@[
//                                   [@{
//                                       @"name": @"School of Rock",
//                                       @"priority": @60
//                                    } mutableCopy],
//                                   
//                                   [@{
//                                       @"name": @"Step Brothers",
//                                       @"priority": @40
//                                    } mutableCopy],
//                                 
//                                    [@{
//                                       
//                                       @"name": @"TMNT",
//                                       @"priority": @10
//                                           
//                                    } mutableCopy]
//                                   
//                                   ] mutableCopy]
//                      } mutableCopy],
//                    
//                    [@{@"name": @"Apps To Write",
//                      @"items": [@[] mutableCopy]
//                      } mutableCopy]
//                    
//                    ] mutableCopy];
        
        
        NSMutableArray * loadGroupsArray = [self loadGroupData];
        
        if (loadGroupsArray)
        {
            groups = loadGroupsArray;
        }
        
        
        }
    
    
        return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    /////////////// WHAT ARE WE DOING HERE ???? ////////////
    
    /// what is the class of a table view row ////
    /// can customize the cell and call that file ////
    
    [self.tableView registerClass:[UITableViewCell class]
        forCellReuseIdentifier:@"cell"];

    UIBarButtonItem * addNewGroup = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewGroupClicked)];
    
    self.navigationItem.rightBarButtonItem = addNewGroup;
    
    
    
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//// This method takes away the status bar at the top ///////////

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    NSLog(@"%@",groups);
    
    [self.tableView reloadData];
    
    [self saveGroupData];
}


- (void)addNewGroupClicked
{
    // when happens when our + button is clicked
    
    STANewGroupViewController * addNewGroupVC = [[STANewGroupViewController alloc] init];
    
    addNewGroupVC.newgroups = groups;
    
    [self.navigationController presentViewController:addNewGroupVC animated:YES completion:nil];
    
    // subclass UIViewController ... STANewGroupViewController
    
    
    // add textfield for group name
    

    
    // add 2 buttons for cancel and save
    
//    UIButton * save = [UIButton alloc] initWithFrame:CGRectMake(20, 20, 20, 20);
//    
//    UIButton * cancel = [UIButton alloc] initWithFrame:CGRectMake(20, 20, 20, 20);
    
    // pass the groups array to the VC  hint: property
    
    // save should create a new NSMutableDictionary and adds it to the groups array
    
    // save and cancel "dismiss" the VC
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return groups.count;
}



- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //// please re use cell 1 when scrolling... please x code///
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    /// setting the data on our cell... displaying group name ///
    
    cell.textLabel.text = groups[indexPath.row][@"name"];
    
    
    // Configure the cell...
    
    return cell;

}

//////// when you click on the row, goes to new itemView - OR what must happen when you click? can change background color if wanted ///////////
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
        (NSIndexPath *)indexPath

{
    // we wanted it to go to a different page ///
    
    
    // creates an instance of the items table view ///
    
    STAItemsTableViewController * itemsTVC = [[STAItemsTableViewController alloc] init];
    
   // passing the dictionary over
    
    // indexPath is what cell/row you are in
    
    itemsTVC.groupInfo = groups[indexPath.row];
    
    /// adds another child to the navigation -- SO we can go back ///
    
    [self.navigationController pushViewController:itemsTVC animated:YES];

    
}























/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [groups removeObjectAtIndex:indexPath.row];
        
        [self saveGroupData];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)saveGroupData
{
    NSData * groupData = [NSKeyedArchiver archivedDataWithRootObject:groups];
    
    [groupData writeToFile:[self groupFilePath] atomically:YES];
}

- (NSMutableArray *)loadGroupData
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self groupFilePath]];
}

- (NSString *)groupFilePath
{
    NSArray * documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString * path = documentDirectories[0];
    
    return [path stringByAppendingString:@"groups.data"];
}

- (BOOL)prefersStatusBarHidden { return YES; }


@end
