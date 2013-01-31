/*
 * Copyright (c) 28/01/2013 Mario Negro (@emenegro)
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "UIActionSheet+Blocks.h"
#import <objc/runtime.h>

/*
 * Runtime association key.
 */
static NSString *kHandlerAssociatedKey = @"kHandlerAssociatedKey";

@implementation UIActionSheet (Blocks)

#pragma mark - Showing

/*
 * Shows the sheet from a view.
 */
- (void)showInView:(UIView *)view handler:(UIActionSheetHandler)handler {
    
    objc_setAssociatedObject(self, (__bridge const void *)(kHandlerAssociatedKey), handler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setDelegate:self];
    [self showInView:view];
}

/*
 * Shows the sheet from a bar button item.
 */
- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated handler:(UIActionSheetHandler)handler {
    
    objc_setAssociatedObject(self, (__bridge const void *)(kHandlerAssociatedKey), handler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setDelegate:self];
    [self showFromBarButtonItem:item animated:animated];
}

/*
 * Shows the sheet from a rect.
 */
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated handler:(UIActionSheetHandler)handler {
    
    objc_setAssociatedObject(self, (__bridge const void *)(kHandlerAssociatedKey), handler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setDelegate:self];
    [self showFromRect:rect inView:view animated:animated];
}

/*
 * Shows the sheet from a tab bar.
 */
- (void)showFromTabBar:(UITabBar *)view handler:(UIActionSheetHandler)handler {
    
    objc_setAssociatedObject(self, (__bridge const void *)(kHandlerAssociatedKey), handler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setDelegate:self];
    [self showFromTabBar:view];
}

/*
 * Shows the sheet from a toobar.
 */
- (void)showFromToolbar:(UIToolbar *)view handler:(UIActionSheetHandler)handler {
    
    objc_setAssociatedObject(self, (__bridge const void *)(kHandlerAssociatedKey), handler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setDelegate:self];
    [self showFromToolbar:view];
}

#pragma mark - UIActionSheetDelegate

/*
 * Sent to the delegate when the user clicks a button on an action sheet.
 */
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    UIActionSheetHandler completionHandler = objc_getAssociatedObject(self, (__bridge const void *)(kHandlerAssociatedKey));
    
    if (completionHandler != nil) {
        
        completionHandler(actionSheet, buttonIndex);
    }
}

@end
