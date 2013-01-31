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

#import <UIKit/UIKit.h>

/*
 * Completion handler invoked when user taps a button.
 *
 * @param actionSheet The action sheet being shown.
 * @param buttonIndex The index of the button tapped.
 */
typedef void(^UIActionSheetHandler)(UIActionSheet *actionSheet, NSInteger buttonIndex);

/**
 * Category of `UIActionSheet` that offers a completion handler to listen to interaction. This avoids the need of the implementation of the delegate pattern.
 *
 * @warning Completion handler: Invoked when user taps a button.
 *
 * typedef void(^UIActionSheetHandler)(UIActionSheet *actionSheet, NSInteger buttonIndex);
 *
 * - *actionSheet* The action sheet view being shown.
 * - *buttonIndex* The index of the button tapped.
 */
@interface UIActionSheet (Blocks) <UIActionSheetDelegate>

/**
 * Shows the sheet from a view.
 *
 * @param view The view from which the action sheet originates.
 * @param handler The handler that will be invoked in user interaction.
 */
- (void)showInView:(UIView *)view handler:(UIActionSheetHandler)handler;

/**
 * Shows the sheet from a bar button item.
 *
 * @param item The item from which the action sheet originates.
 * @param animated Specify YES to animate the presentation of the action sheet or NO to present it immediately without any animation effects.
 * @param handler The handler that will be invoked in user interaction.
 */
- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated handler:(UIActionSheetHandler)handler;

/**
 * Shows the sheet from a rect.
 *
 * @param rect The portion of view from which to originate the action sheet.
 * @param view The view from which to originate the action sheet.
 * @param animated Specify YES to animate the presentation of the action sheet or NO to present it immediately without any animation effects.
 * @param handler The handler that will be invoked in user interaction.
 */
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated handler:(UIActionSheetHandler)handler;

/**
 * Shows the sheet from a tab bar.
 *
 * @param view The tab bar view from which the action sheet originates.
 * @param handler The handler that will be invoked in user interaction.
 */
- (void)showFromTabBar:(UITabBar *)view handler:(UIActionSheetHandler)handler;

/**
 * Shows the sheet from a toobar.
 *
 * @param view The toolbar from which the action sheet originates.
 * @param handler The handler that will be invoked in user interaction.
 */
- (void)showFromToolbar:(UIToolbar *)view handler:(UIActionSheetHandler)handler;

@end
