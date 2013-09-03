//
//  AppDelegate.h
//  JibenetApplication
//
//  Created by Raj on 12/08/13.
//  Copyright (c) 2013 Raj. All rights reserved.
//

#import <UIKit/UIKit.h>


@class RMEIdeasPullDownControl;

@protocol RMEIdeasPullDownControlProtocol <NSObject>
/*
 Informs the delegate that a selection has been made
 */
- (void) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl selectedControlAtIndex:(NSUInteger)controlIndex;


@end

@protocol RMEIdeasPullDownControlDataSource <NSObject>

@required

- (UIImage*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl imageForControlAtIndex:(NSUInteger)controlIndex;
- (UIImage*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl selectedImageForControlAtIndex:(NSUInteger)controlIndex;
- (NSString*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl titleForControlAtIndex:(NSUInteger)controlIndex;
- (NSUInteger) numberOfButtonsRequired:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl;


@end

@interface RMEIdeasPullDownControl : UIView
//Tells the control which selection to make.
- (void) selectControlAtIndex:(NSInteger)controlIndex;

//Designated initializer
- (id)initWithDataSource:(id<RMEIdeasPullDownControlDataSource>)dataSource
                delegate:(id<RMEIdeasPullDownControlProtocol>)delegate
        clientScrollView:(UIScrollView*)clientScrollView;

@end
