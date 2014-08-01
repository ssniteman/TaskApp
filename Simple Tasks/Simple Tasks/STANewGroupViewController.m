//
//  STANewGroupViewController.m
//  Simple Tasks
//
//  Created by Shane Sniteman on 7/31/14.
//  Copyright (c) 2014 Shane Sniteman. All rights reserved.
//

#import "STANewGroupViewController.h"
#import "STAGroupsTableViewController.h"

@interface STANewGroupViewController () <UITextFieldDelegate>


@end

@implementation STANewGroupViewController
{
    UITextField * groupTextField;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
         self.view.backgroundColor = [UIColor whiteColor];
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    groupTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 40)];
    
    [self.view addSubview:groupTextField];
    
    UIView * fieldBar = [[UIView alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH - 40, 1)];
    
    fieldBar.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:fieldBar];
    
    [groupTextField becomeFirstResponder];
    
//    groupTextField.text = self.groups[@"name"];
//    groupTextField.delegate = self;
//    
    UIButton * cancelGroup = [[UIButton alloc]  initWithFrame:CGRectMake(SCREEN_WIDTH / 2 -110, 80, 100, 100)];
    
    [cancelGroup setImage:[UIImage imageNamed:@"group_close"] forState:UIControlStateNormal];
    
    [cancelGroup addTarget:self action:@selector(cancelGroupClicked) forControlEvents:UIControlEventTouchUpInside];
    
    cancelGroup.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:cancelGroup];
    
    UIButton * saveGroup = [[UIButton alloc]  initWithFrame:CGRectMake(SCREEN_WIDTH / 2 + 10, 80, 100, 100)];
    
    [saveGroup setImage:[UIImage imageNamed:@"group_save"] forState:UIControlStateNormal];
    
    [saveGroup addTarget:self action:@selector(saveGroupClicked) forControlEvents:UIControlEventTouchUpInside];

    saveGroup.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:saveGroup];
    
    

}

- (void)cancelGroupClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveGroupClicked
{
    [self.newgroups addObject: [@{
                                  @"name":groupTextField.text,
                                  @"item":[@[] mutableCopy]
                                 
                                 } mutableCopy]];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (BOOL)prefersStatusBarHidden { return YES; }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
