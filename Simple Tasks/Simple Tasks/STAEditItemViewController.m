//
//  STAEditItemViewController.m
//  Simple Tasks
//
//  Created by Shane Sniteman on 7/30/14.
//  Copyright (c) 2014 Shane Sniteman. All rights reserved.
//

#import "STAEditItemViewController.h"

@interface STAEditItemViewController () <UITextFieldDelegate>

@end

@implementation STAEditItemViewController
{
     UITextField * itemTextField;
     UIButton * sliderButton;
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
    
    
    itemTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 40)];
    
    [self.view addSubview:itemTextField];
    
    UIView * fieldBar = [[UIView alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH - 70, 1)];
    
    fieldBar.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:fieldBar];
    
    itemTextField.delegate = self;
    
    sliderButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 50,20,40,40)];
    
    sliderButton.backgroundColor = [UIColor grayColor];
    sliderButton.layer.cornerRadius = 20;
    
    [self.view addSubview:sliderButton];
    
//    [sliderButton addTarget:self action:@selector(sliderButtonTouched) forControlEvents:UIControl]
    
    
    
    
    
    
    float spacing = 20;
    float btnSize = (SCREEN_WIDTH - spacing) / 3;
    float posX = btnSize / 2;
    float posY = SCREEN_HEIGHT - (spacing * 2) - btnSize;
    
    
    UIButton * cancelItem = [[UIButton alloc] initWithFrame:CGRectMake(posX, posY, btnSize, btnSize)];
    
    [cancelItem setImage:[UIImage imageNamed:@"item_close"] forState:UIControlStateNormal];
    
    [cancelItem addTarget:self action:@selector(cancelItemClicked) forControlEvents:UIControlEventTouchUpInside];
    
    cancelItem.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:cancelItem];

    
    
    
    UIButton * saveItem = [[UIButton alloc] initWithFrame:CGRectMake(posX + btnSize + spacing, posY, btnSize, btnSize)];
    
    [saveItem setImage:[UIImage imageNamed:@"item_save"] forState:UIControlStateNormal];
    
    [saveItem addTarget:self action:@selector(saveItemClicked) forControlEvents:UIControlEventTouchUpInside];
    
    saveItem.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:saveItem];

}

- (void)saveItemClicked
{
    
}

- (void)cancelItemClicked
{
    
}


-(void)setItemInfo:(NSMutableDictionary *)itemInfo
{
    // setter method
    
    _itemInfo = itemInfo;
    
    
    UITextField * itemNameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 80)];
    
    itemNameField.text = self.itemInfo[@"name"];
    itemNameField.delegate = self;
    
    float priority = [itemInfo[@"priority"]floatValue];
    float priorityHue = priority/360;
    
    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
    
    [self.view addSubview:itemNameField];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
//    self.itemInfo[@"name"] = textField.text;
    
    [textField resignFirstResponder];
    
    return YES;
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches slider][0];
    
    CGPoint location = [touch locationInView:self.view];
    
    [self changeColorWithLocation:location];
}



-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches allObjects][0];
    
    CGPoint location = [touch locationInView:self.view];
    
    [self changeColorWithLocation:location];
    
}


-(void) changeColorWithLocation:(CGPoint)location
{
    float priority = location.y / SCREEN_HEIGHT * 60;
    
    self.itemInfo[@"priority"] = @(priority);
    
    NSLog(@"y = %f",priority/60);
    
    float priorityHue = priority / 360;
    
    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
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
