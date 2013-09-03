//
//  AppDelegate.h
//  JibenetApplication
//
//  Created by Raj on 12/08/13.
//  Copyright (c) 2013 Raj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRSlidingTableViewCell.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "propertyList.h"

@interface JibenetViewController : UIViewController<UIGestureRecognizerDelegate,LRSlidingTableViewCellDelegate,propertyListDelegate>
{
    BOOL isClicked;
    LRSlidingTableViewCell *customView;
    SLComposeViewController *mySLComposerSheet;
    SLComposeViewController *mySLComposerSheet1;
    NSArray *arrName;
    NSArray *arrAddr;
    NSArray *arrSize;
    NSArray *arrRate;
    NSData *dataImage;
    
}
@property (nonatomic, retain) LRSlidingTableViewCell *currentlyActiveSlidingCell;
@property (nonatomic, retain) IBOutlet UISegmentedControl *swipeDirectionSegmentedControl;
@property (nonatomic, assign) LRSlidingTableViewCellSwipeDirection swipeDirection;
- (IBAction)handleSegmentedControlSelection:(id)sender;

@end
