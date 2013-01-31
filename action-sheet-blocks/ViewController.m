//
//  ViewController.m
//  action-sheet-blocks
//
//  Created by Mario Negro on 29/01/13.
//  Copyright (c) 2013 Mario Negro. All rights reserved.
//

#import "ViewController.h"
#import "UIActionSheet+Blocks.h"

@interface ViewController ()

- (IBAction)showActionSheet:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self setTitle:@"Test"];
    [[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showActionSheet:)]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showActionSheet:(id)sender {
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Test"
                                                       delegate:nil
                                              cancelButtonTitle:@"Cancel"
                                         destructiveButtonTitle:@"Destructive"
                                              otherButtonTitles:@"Option 1", @"Option 2", nil];
    
    [sheet showFromTabBar:[[self tabBarController] tabBar]
                  handler:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
                      
                      if (buttonIndex == [actionSheet cancelButtonIndex]) {
                          
                          NSLog(@"Cancel button index tapped");
                          
                      } else if (buttonIndex == [actionSheet destructiveButtonIndex]) {
                          
                          NSLog(@"Destructive button index tapped");
                          
                      } else  {
                          
                          NSLog(@"Button %i tapped", buttonIndex);
                      }
                      
                  }];
}

@end
