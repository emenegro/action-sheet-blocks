Category of `UIActionSheet` that offers a completion handler to listen to interaction. This avoids the need of the implementation of the delegate pattern.

Installation instructions
=========================

1. Import `UIActionSheet+Blocks.h` in the desired classes of your project.
2. You has to create the sheet the regular way

		UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Test"
														   delegate:nil // Can be another value but will be overridden when showing with handler.
												  cancelButtonTitle:@"Cancel"
											 destructiveButtonTitle:@"Delete"
												  otherButtonTitles:@"Option 1", @"Option 2", nil];

3. Now you have several new methods to show the sheet passing the completion handler.
    
		[sheet showInView:view
                  handler:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
                      
                      if (buttonIndex == [actionSheet cancelButtonIndex]) {
                          
                          NSLog(@"Cancel button index tapped");
                          
                      } else if (buttonIndex == [actionSheet destructiveButtonIndex]) {
                          
                          NSLog(@"Destructive button index tapped");
                          
                      } else  {
                          
                          NSLog(@"Button %i tapped", buttonIndex);
                      }                      
                  }];

4. For each method in UIActionSheet that shows a sheet there is a new method with the same signature but that also passes the handler.

		- (void)showInView:(UIView *)view handler:(UIActionSheetHandler)handler;
		- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated handler:(UIActionSheetHandler)handler;
		- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated handler:(UIActionSheetHandler)handler;
		- (void)showFromTabBar:(UITabBar *)view handler:(UIActionSheetHandler)handler;
		- (void)showFromToolbar:(UIToolbar *)view handler:(UIActionSheetHandler)handler;

5. You can see some examples in `ViewController` class.

Documentation
=============

Execute `appledoc appledoc.plist` in the root of the project path to generate documentation. 
